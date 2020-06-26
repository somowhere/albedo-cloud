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
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.security.util.SecurityUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.CacheManager;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2RefreshToken;
import org.springframework.security.oauth2.provider.AuthorizationRequest;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

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

}
