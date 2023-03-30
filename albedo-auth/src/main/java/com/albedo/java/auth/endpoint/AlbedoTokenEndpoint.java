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

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.context.ContextUtil;
import com.albedo.java.common.core.exception.BadRequestException;
import com.albedo.java.common.core.util.ObjectUtil;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.core.util.SpringContextHolder;
import com.albedo.java.common.security.annotation.Inner;
import com.albedo.java.common.security.util.OAuth2EndpointUtils;
import com.albedo.java.common.security.util.OAuth2ErrorCodesExpand;
import com.albedo.java.modules.sys.domain.OauthClientDetailDo;
import com.albedo.java.modules.sys.domain.dto.TokenDto;
import com.albedo.java.modules.sys.domain.dto.UserOnlineDto;
import com.albedo.java.modules.sys.domain.vo.UserOnlineVo;
import com.albedo.java.modules.sys.feign.RemoteClientDetailService;
import com.albedo.java.plugins.cache.utils.RedisUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.authentication.event.LogoutSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.OAuth2Error;
import org.springframework.security.oauth2.core.endpoint.OAuth2AccessTokenResponse;
import org.springframework.security.oauth2.core.endpoint.OAuth2ParameterNames;
import org.springframework.security.oauth2.core.http.converter.OAuth2AccessTokenResponseHttpMessageConverter;
import org.springframework.security.oauth2.core.http.converter.OAuth2ErrorHttpMessageConverter;
import org.springframework.security.oauth2.server.authorization.OAuth2Authorization;
import org.springframework.security.oauth2.server.authorization.OAuth2AuthorizationService;
import org.springframework.security.oauth2.server.authorization.OAuth2TokenType;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

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

	private final HttpMessageConverter<OAuth2AccessTokenResponse> accessTokenHttpResponseConverter = new OAuth2AccessTokenResponseHttpMessageConverter();

	private final HttpMessageConverter<OAuth2Error> errorHttpResponseConverter = new OAuth2ErrorHttpMessageConverter();

	private final OAuth2AuthorizationService authorizationService;

	private final RemoteClientDetailService clientDetailsService;

	private final RedisTemplate<String, Object> redisTemplate;

	/**
	 * 认证页面
	 *
	 * @param modelAndView
	 * @param error        表单登录失败处理回调的错误信息
	 * @return ModelAndView
	 */
	@GetMapping("/login")
	public ModelAndView require(ModelAndView modelAndView, @RequestParam(required = false) String error) {
		modelAndView.setViewName("ftl/login");
		modelAndView.addObject("error", error);
		return modelAndView;
	}

	@GetMapping("/confirm-access")
	public ModelAndView confirm(Principal principal, ModelAndView modelAndView,
								@RequestParam(OAuth2ParameterNames.CLIENT_ID) String clientId,
								@RequestParam(OAuth2ParameterNames.SCOPE) String scope,
								@RequestParam(OAuth2ParameterNames.STATE) String state) {

		Result<OauthClientDetailDo> r = clientDetailsService.getClientDetailsById(clientId, SecurityConstants.FROM_IN);
		OauthClientDetailDo clientDetails = r.getData();
		Set<String> authorizedScopes = StringUtils.commaDelimitedListToSet(clientDetails.getScope());
		modelAndView.addObject("clientId", clientId);
		modelAndView.addObject("state", state);
		modelAndView.addObject("scopeList", authorizedScopes);
		modelAndView.addObject("principalName", principal.getName());
		modelAndView.setViewName("ftl/confirm");
		return modelAndView;
	}

	/**
	 * 退出并删除token
	 *
	 * @param authHeader Authorization
	 */
	@DeleteMapping("/logout")
	public Result<Boolean> logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String authHeader) {
		if (StrUtil.isBlank(authHeader)) {
			return Result.buildOk();
		}

		String tokenValue = authHeader.replace(OAuth2AccessToken.TokenType.BEARER.getValue(), StrUtil.EMPTY).trim();
		return removeToken(tokenValue);
	}

	/**
	 * 校验token
	 *
	 * @param token 令牌
	 */
	@SneakyThrows
	@GetMapping("/check-token")
	public void checkToken(String token, HttpServletResponse response) {
		ServletServerHttpResponse httpResponse = new ServletServerHttpResponse(response);

		if (StrUtil.isBlank(token)) {
			httpResponse.setStatusCode(HttpStatus.UNAUTHORIZED);
			this.errorHttpResponseConverter.write(new OAuth2Error(OAuth2ErrorCodesExpand.TOKEN_MISSING), null,
				httpResponse);
		}
		OAuth2Authorization authorization = authorizationService.findByToken(token, OAuth2TokenType.ACCESS_TOKEN);

		// 如果令牌不存在 返回401
		if (authorization == null) {
			httpResponse.setStatusCode(HttpStatus.UNAUTHORIZED);
			this.errorHttpResponseConverter.write(new OAuth2Error(OAuth2ErrorCodesExpand.TOKEN_MISSING), null,
				httpResponse);
		}

		Map<String, Object> claims = authorization.getAccessToken().getClaims();
		OAuth2AccessTokenResponse sendAccessTokenResponse = OAuth2EndpointUtils.sendAccessTokenResponse(authorization,
			claims);
		this.accessTokenHttpResponseConverter.write(sendAccessTokenResponse, MediaType.APPLICATION_JSON, httpResponse);
	}

	/**
	 * 令牌管理调用
	 *
	 * @param tokenDto
	 */
	@Inner
	@Operation(hidden = true)
	@DeleteMapping("/remove-tokens")
	public Result removeByTokens(@RequestBody TokenDto tokenDto) throws BadRequestException {
		if (tokenDto == null || ObjectUtil.isNull(tokenDto.getUsername())) {
			throw new BadRequestException("当前登陆用户为空，无法操作");
		}
		tokenDto.getTokens().forEach(token -> {
			OAuth2Authorization authorization = authorizationService.findByToken(token, OAuth2TokenType.ACCESS_TOKEN);
			if (tokenDto.getUsername().equals(authorization.getPrincipalName())) {
				throw new BadRequestException("当前登陆用户无法强退");
			}
			removeToken(token);
		});
		return Result.buildOk("操作成功");
	}

	/**
	 * 令牌管理调用
	 *
	 * @param token token
	 */
	@DeleteMapping("/{token}")
	public Result removeToken(@PathVariable("token") String token) {
		OAuth2Authorization authorization = authorizationService.findByToken(token, OAuth2TokenType.ACCESS_TOKEN);
		OAuth2Authorization.Token<OAuth2AccessToken> accessToken = authorization.getAccessToken();
		if (accessToken == null || StrUtil.isBlank(accessToken.getToken().getTokenValue())) {
			return Result.buildOk();
		}
		// 清空access token
		authorizationService.remove(authorization);
		// 处理自定义退出事件，保存相关日志
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		SpringContextHolder.publishEvent(new LogoutSuccessEvent(authentication));
		return Result.buildOk();
	}

	/**
	 * 查询token
	 *
	 * @param params 分页参数
	 * @return
	 */
	@PostMapping("/page")
	public Result tokenList(@RequestBody Map<String, Object> params) {
		// 根据分页参数获取对应数据
		String key = String.format("%s::*", ContextUtil.getTenant() + SecurityConstants.PROJECT_OAUTH_ACCESS);
		int current = MapUtil.getInt(params, CommonConstants.CURRENT);
		int size = MapUtil.getInt(params, CommonConstants.SIZE);
		Set<String> keys = redisTemplate.keys(key);
		assert keys != null;
		List<String> pages = keys.stream().skip((long) (current - 1) * size).limit(size).collect(Collectors.toList());
		Page result = new Page(current, size);
		List<UserOnlineVo> userOnlineVoList = Objects.requireNonNull(redisTemplate.opsForValue().multiGet(pages)).stream().map(obj -> {
			OAuth2Authorization authorization = (OAuth2Authorization) obj;
			UserOnlineVo.UserOnlineVoBuilder builder = UserOnlineVo.builder();
			OAuth2AccessToken oAuth2AccessToken = authorization.getAccessToken().getToken();
			builder.username(authorization.getPrincipalName())
				.tokenType(oAuth2AccessToken.getTokenType().getValue())
				.accessToken(oAuth2AccessToken.getTokenValue())
				.expiresIn(oAuth2AccessToken.getExpiresAt())
				.clientId(authorization.getRegisteredClientId())
				.grantType(authorization.getAuthorizationGrantType().getValue());
			UserOnlineDto userOnlineDto = RedisUtil.getCacheObject(ContextUtil.getTenant() + SecurityConstants.PROJECT_OAUTH_ONLINE + authorization.getPrincipalName());
			Optional.ofNullable(userOnlineDto).map(item -> builder.userId(item.getUserId())
				.browser(item.getBrowser())
				.deptId(item.getDeptId())
				.deptName(item.getDeptName())
				.loginTime(item.getLoginTime())
				.ipAddress(item.getIpAddress())
				.ipLocation(item.getIpLocation())
				.os(item.getOs())
				.userAgent(item.getUserAgent()));
			return builder.build();
		}).collect(Collectors.toList());

		result.setRecords(userOnlineVoList);
		result.setTotal(keys.size());
		return Result.buildOkData(result);
	}


}
