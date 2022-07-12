/*
 * Copyright (c) 2019-2022, somewhere (somewhere0813@gmail.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.albedo.java.auth.support.handler;

import cn.hutool.http.HttpUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.context.ContextConstants;
import com.albedo.java.common.core.util.AddressUtil;
import com.albedo.java.common.core.util.RequestHolder;
import com.albedo.java.common.core.util.SpringContextHolder;
import com.albedo.java.common.core.util.WebUtil;
import com.albedo.java.common.log.event.SysLogLoginEvent;
import com.albedo.java.common.log.util.SysLogUtils;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.modules.sys.domain.LogLoginDo;
import com.albedo.java.modules.sys.domain.dto.UserOnlineDto;
import com.albedo.java.plugins.cache.utils.RedisUtil;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.security.oauth2.core.OAuth2RefreshToken;
import org.springframework.security.oauth2.core.endpoint.OAuth2AccessTokenResponse;
import org.springframework.security.oauth2.core.http.converter.OAuth2AccessTokenResponseHttpMessageConverter;
import org.springframework.security.oauth2.server.authorization.authentication.OAuth2AccessTokenAuthenticationToken;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.util.CollectionUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.Map;

/**
 * @author lengleng
 * @date 2022-06-02
 */
@Slf4j
public class AlbedoAuthenticationSuccessEventHandler implements AuthenticationSuccessHandler {

	private final HttpMessageConverter<OAuth2AccessTokenResponse> accessTokenHttpResponseConverter = new OAuth2AccessTokenResponseHttpMessageConverter();

	/**
	 * Called when a user has been successfully authenticated.
	 *
	 * @param request        the request which caused the successful authentication
	 * @param response       the response
	 * @param authentication the <tt>Authentication</tt> object which was created during
	 *                       the authentication process.
	 */
	@SneakyThrows
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) {
		log.info("用户：{} 登录成功", authentication.getPrincipal());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		LogLoginDo logLoginDo = SysLogUtils.getSysLogLogin();
		if (authentication.getPrincipal() instanceof String) {
			logLoginDo.setUsername((String) authentication.getPrincipal());
		} else if (authentication.getPrincipal() instanceof UserDetail) {
			UserDetail principal = (UserDetail) authentication.getPrincipal();
			logLoginDo.setUsername(principal.getUsername());
			logLoginDo.setCreatedBy(principal.getId());
			String ip = WebUtil.getIp(request);
			String userAgentStr = request.getHeader(HttpHeaders.USER_AGENT);
			saveUserOnline(principal, ip, userAgentStr);
		} else if (authentication instanceof OAuth2AccessTokenAuthenticationToken) {
			Object userInfo = ((OAuth2AccessTokenAuthenticationToken) authentication).getAdditionalParameters().get("user_info");
			if (userInfo instanceof UserDetail) {
				UserDetail principal = (UserDetail) userInfo;
				logLoginDo.setUsername(principal.getUsername());
				logLoginDo.setCreatedBy(principal.getId());
				String ip = WebUtil.getIp(request);
				String userAgentStr = request.getHeader(HttpHeaders.USER_AGENT);
				saveUserOnline(principal, ip, userAgentStr);
			}
		}
		logLoginDo.setParams(HttpUtil.toParams(request.getParameterMap()));
		logLoginDo.setTitle("用户登录成功");
		// 发送异步日志事件
		SpringContextHolder.publishEvent(new SysLogLoginEvent(logLoginDo));

		// 输出token
		sendAccessTokenResponse(request, response, authentication);
	}

	private void sendAccessTokenResponse(HttpServletRequest request, HttpServletResponse response,
										 Authentication authentication) throws IOException {

		OAuth2AccessTokenAuthenticationToken accessTokenAuthentication = (OAuth2AccessTokenAuthenticationToken) authentication;

		OAuth2AccessToken accessToken = accessTokenAuthentication.getAccessToken();
		OAuth2RefreshToken refreshToken = accessTokenAuthentication.getRefreshToken();
		Map<String, Object> additionalParameters = accessTokenAuthentication.getAdditionalParameters();

		OAuth2AccessTokenResponse.Builder builder = OAuth2AccessTokenResponse.withToken(accessToken.getTokenValue())
			.tokenType(accessToken.getTokenType()).scopes(accessToken.getScopes());
		if (accessToken.getIssuedAt() != null && accessToken.getExpiresAt() != null) {
			builder.expiresIn(ChronoUnit.SECONDS.between(accessToken.getIssuedAt(), accessToken.getExpiresAt()));
		}
		if (refreshToken != null) {
			builder.refreshToken(refreshToken.getTokenValue());
		}
		if (!CollectionUtils.isEmpty(additionalParameters)) {
			builder.additionalParameters(additionalParameters);
		}
		OAuth2AccessTokenResponse accessTokenResponse = builder.build();
		ServletServerHttpResponse httpResponse = new ServletServerHttpResponse(response);

		// 无状态 注意删除 context 上下文的信息
		SecurityContextHolder.clearContext();
		this.accessTokenHttpResponseConverter.write(accessTokenResponse, null, httpResponse);
	}


	/**
	 * saveUserOnline 保存在线用户信息
	 *
	 * @param userDetail
	 * @param ip
	 * @param userAgentStr
	 */
	public void saveUserOnline(UserDetail userDetail, String ip, String userAgentStr) {
		UserAgent userAgent = UserAgentUtil.parse(userAgentStr);
		UserOnlineDto userOnlineDto = new UserOnlineDto(userDetail.getDeptId(),
			userDetail.getDeptName(), userDetail.getId(), userDetail.getUsername(), ip, AddressUtil.getRegion(ip),
			userAgentStr, userAgent.getBrowser().getName(), userAgent.getOs().getName(), new Date());
		String tenant = WebUtil.getHeader(RequestHolder.getHttpServletRequest(), ContextConstants.KEY_TENANT);
		RedisUtil.setCacheObject(tenant + SecurityConstants.PROJECT_OAUTH_ONLINE + userOnlineDto.getUsername(), userOnlineDto);
	}

}
