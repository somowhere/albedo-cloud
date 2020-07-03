/*
 *  Copyright (c) 2019-2020, somowhere (somewhere0813@gmail.com).
 *  <p>
 *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  <p>
 * https://www.gnu.org/licenses/lgpl.html
 *  <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.albedo.java.auth.endpoint;

import cn.hutool.core.util.StrUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.exception.BadRequestException;
import com.albedo.java.common.core.util.BeanUtil;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.core.util.StringUtil;
import com.albedo.java.common.security.annotation.Inner;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.common.security.util.SecurityUtil;
import com.albedo.java.common.util.RedisUtil;
import com.albedo.java.modules.sys.domain.dto.UserOnlineDto;
import com.albedo.java.modules.sys.domain.dto.UserOnlineQueryCriteria;
import com.albedo.java.modules.sys.domain.vo.TokenVo;
import com.albedo.java.modules.sys.domain.vo.UserOnlineVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.ConvertingCursor;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.provider.AuthorizationRequest;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author somowhere
 * @date 2019/2/1
 * 删除token端点
 */
@RestController
@AllArgsConstructor
@RequestMapping("/token")
@Slf4j
public class AlbedoTokenEndpoint {
	private final ClientDetailsService clientDetailsService;

	private final TokenStore tokenStore;
	private final RedisTemplate redisTemplate;

	/**
	 * 认证页面
	 * @param modelAndView
	 * @param error 表单登录失败处理回调的错误信息
	 * @return ModelAndView
	 */
	@GetMapping("/login")
	public ModelAndView require(ModelAndView modelAndView, @RequestParam(required = false) String error) {
		modelAndView.setViewName("ftl/login");
		modelAndView.addObject("error", error);
		return modelAndView;
	}

	/**
	 * 确认授权页面
	 * @param request
	 * @param session
	 * @param modelAndView
	 * @return
	 */
	@GetMapping("/confirm_access")
	public ModelAndView confirm(HttpServletRequest request, HttpSession session, ModelAndView modelAndView) {
		Map<String, Object> scopeList = (Map<String, Object>) request.getAttribute("scopes");
		modelAndView.addObject("scopeList", scopeList.keySet());

		Object auth = session.getAttribute("authorizationRequest");
		if (auth != null) {
			AuthorizationRequest authorizationRequest = (AuthorizationRequest) auth;
			ClientDetails clientDetails = clientDetailsService.loadClientByClientId(authorizationRequest.getClientId());
			modelAndView.addObject("app", clientDetails.getAdditionalInformation());
			modelAndView.addObject("user", SecurityUtil.getUser());
		}

		modelAndView.setViewName("ftl/confirm");
		return modelAndView;
	}
	/**
	 * 退出并删除tokenF
	 *
	 * @param authHeader Authorization
	 */
	@DeleteMapping("/logout")
	public Result<Boolean> logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String authHeader) {
		if (StrUtil.isBlank(authHeader)) {
			return Result.buildFailData(Boolean.FALSE, "退出失败，token 为空");
		}

		String tokenValue = authHeader.replace(OAuth2AccessToken.BEARER_TYPE, StrUtil.EMPTY).trim();
		OAuth2AccessToken accessToken = tokenStore.readAccessToken(tokenValue);
		if (accessToken == null || StrUtil.isBlank(accessToken.getValue())) {
			log.info("token 无效"+tokenValue);
			return Result.buildOkData(Boolean.TRUE);
		}
		tokenStore.removeAccessToken(accessToken);

		OAuth2RefreshToken refreshToken = accessToken.getRefreshToken();
		tokenStore.removeRefreshToken(refreshToken);

		return Result.buildOkData(Boolean.TRUE);
	}


	/**
	 * 令牌管理调用
	 *
	 * @param tokenVo
	 */
	@Inner
	@DeleteMapping
	public Result<Boolean> removeByTokens(@RequestBody TokenVo tokenVo) throws BadRequestException {
		if(tokenVo == null || StringUtil.isEmpty(tokenVo.getUserId())){
			throw new BadRequestException("当前登陆用户为空，无法操作");
		}
		tokenVo.getTokens().forEach(token -> {
			OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(token);
			Authentication authentication = tokenStore.readAuthentication(oAuth2AccessToken).getUserAuthentication();
			if (authentication.getPrincipal() instanceof UserDetail) {
				UserDetail userDetail = (UserDetail) authentication.getPrincipal();
				if(tokenVo.getUserId().equals(userDetail.getId())){
					throw new BadRequestException("当前登陆用户无法强退");
				}
				redisTemplate.delete(SecurityConstants.PROJECT_OAUTH_ONLINE + userDetail.getId());
			}
			redisTemplate.delete(SecurityConstants.PROJECT_OAUTH_ACCESS + token);
		});
		return Result.buildOk("操作成功");
	}


	/**
	 * 查询token
	 *
	 * @param userOnlineQueryCriteria 分页参数
	 */
	@Inner
	@PostMapping("/find-page")
	public Result findPage(@RequestBody UserOnlineQueryCriteria userOnlineQueryCriteria) {

		List<UserOnlineVo> list = new ArrayList<>();
		//根据分页参数获取对应数据
		List<String> tokenStrs = findKeysForPage(SecurityConstants.PROJECT_OAUTH_ACCESS + "*", userOnlineQueryCriteria.getUsername(),
			userOnlineQueryCriteria.getCurrent(), userOnlineQueryCriteria.getSize());

		for (String tokenStr : tokenStrs) {
			OAuth2AccessToken token = tokenStore.readAccessToken(tokenStr);
			OAuth2Authentication oAuth2Auth = tokenStore.readAuthentication(token);
			Authentication authentication = oAuth2Auth.getUserAuthentication();
			UserOnlineVo userOnlineVo = new UserOnlineVo();
			if (authentication.getPrincipal() instanceof UserDetail) {
				UserDetail userDetail = (UserDetail) authentication.getPrincipal();
				UserOnlineDto userOnlineDto = RedisUtil.getCacheObject(SecurityConstants.PROJECT_OAUTH_ONLINE + userDetail.getId());
				BeanUtil.copyProperties(userOnlineDto, userOnlineVo);
			}
			userOnlineVo.setTokenType(token.getTokenType());
			userOnlineVo.setAccessToken(token.getValue());
			userOnlineVo.setExpiresIn(token.getExpiration());
			userOnlineVo.setClientId(oAuth2Auth.getOAuth2Request().getClientId());
			userOnlineVo.setGrantType(oAuth2Auth.getOAuth2Request().getGrantType());
			list.add(userOnlineVo);
		}

		Page result = new Page(userOnlineQueryCriteria.getCurrent(), userOnlineQueryCriteria.getSize());
		result.setRecords(list);
		result.setTotal(Long.valueOf(redisTemplate.keys(SecurityConstants.PROJECT_OAUTH_ACCESS + "*").size()));
		return Result.buildOkData(result);

	}

	private List<String> findKeysForPage(String patternKey, String username, int pageNum, int pageSize) {
		ScanOptions options = ScanOptions.scanOptions().match(patternKey).build();
		RedisSerializer<String> redisSerializer = (RedisSerializer<String>) redisTemplate.getKeySerializer();
		Cursor cursor = (Cursor) redisTemplate.executeWithStickyConnection(redisConnection -> new ConvertingCursor<>(redisConnection.scan(options), redisSerializer::deserialize));
		List<String> result = new ArrayList<>();
		int tmpIndex = 0;
		int startIndex = (pageNum - 1) * pageSize;
		int end = pageNum * pageSize;

		assert cursor != null;
		while (cursor.hasNext()) {
			String token = cursor.next().toString(), targetName = "";
			String realToken = StrUtil.subAfter(token, SecurityConstants.PROJECT_OAUTH_ACCESS, true);
			OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(realToken);
			OAuth2Authentication oAuth2Auth = tokenStore.readAuthentication(oAuth2AccessToken);
			Authentication authentication = oAuth2Auth.getUserAuthentication();
			if (authentication.getPrincipal() instanceof UserDetail) {
				UserDetail user = (UserDetail) authentication.getPrincipal();
				targetName = user.getUsername();
			}
			if (tmpIndex >= startIndex && tmpIndex < end && (StringUtil.isEmpty(username) || targetName.indexOf(username) != -1)) {
				result.add(realToken);
				tmpIndex++;
				continue;
			}
			if (tmpIndex >= end) {
				break;
			}
			tmpIndex++;
			cursor.next();
		}
		return result;
	}

}
