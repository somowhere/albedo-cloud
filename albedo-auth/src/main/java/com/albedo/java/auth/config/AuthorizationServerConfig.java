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

package com.albedo.java.auth.config;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.security.component.WebResponseExceptionExtendTranslator;
import com.albedo.java.common.security.grant.ResourceOwnerCustomeAppTokenGranter;
import com.albedo.java.common.security.service.CustomClientDetailsService;
import com.albedo.java.common.security.service.CustomTokenServices;
import com.albedo.java.common.security.service.UserDetail;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.core.userdetails.UserDetailsByNameServiceWrapper;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.CompositeTokenGranter;
import org.springframework.security.oauth2.provider.TokenGranter;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationProvider;

import javax.sql.DataSource;
import java.util.*;

/**
 * @author somowhere
 * @date 2019/2/1
 * 认证服务器配置
 */
@Configuration
@RequiredArgsConstructor
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {

	private final DataSource dataSource;

	private final UserDetailsService userDetailsService;

	private final AuthenticationManager authenticationManager;

	private final TokenStore redisTokenStore;

	@Override
	@SneakyThrows
	public void configure(ClientDetailsServiceConfigurer clients) {
		clients.withClientDetails(customClientDetailsService());
	}

	@Override
	public void configure(AuthorizationServerSecurityConfigurer oauthServer) {
		oauthServer.allowFormAuthenticationForClients().checkTokenAccess("permitAll()");
	}

	@Override
	public void configure(AuthorizationServerEndpointsConfigurer endpoints) {
		endpoints.allowedTokenEndpointRequestMethods(HttpMethod.GET, HttpMethod.POST).tokenServices(tokenServices())
			.tokenStore(redisTokenStore).tokenEnhancer(tokenEnhancer()).userDetailsService(userDetailsService)
			.authenticationManager(authenticationManager).reuseRefreshTokens(false)
			.pathMapping("/oauth/confirm_access", "/token/confirm_access")
			.exceptionTranslator(new WebResponseExceptionExtendTranslator());
		setTokenGranter(endpoints);
	}

	private void setTokenGranter(AuthorizationServerEndpointsConfigurer endpoints) {
		// 获取默认授权类型
		TokenGranter tokenGranter = endpoints.getTokenGranter();
		ArrayList<TokenGranter> tokenGranters = new ArrayList<>(Arrays.asList(tokenGranter));
		ResourceOwnerCustomeAppTokenGranter resourceOwnerCustomeAppTokenGranter = new ResourceOwnerCustomeAppTokenGranter(
			authenticationManager, endpoints.getTokenServices(), endpoints.getClientDetailsService(),
			endpoints.getOAuth2RequestFactory());
		tokenGranters.add(resourceOwnerCustomeAppTokenGranter);
		CompositeTokenGranter compositeTokenGranter = new CompositeTokenGranter(tokenGranters);
		endpoints.tokenGranter(compositeTokenGranter);
	}

	@Bean
	public TokenEnhancer tokenEnhancer() {
		return (accessToken, authentication) -> {
			final Map<String, Object> additionalInfo = new HashMap<>(4);
			additionalInfo.put(SecurityConstants.DETAILS_LICENSE, SecurityConstants.PROJECT_LICENSE);
			String clientId = authentication.getOAuth2Request().getClientId();
			additionalInfo.put(SecurityConstants.CLIENT_ID, clientId);

			// 客户端模式不返回具体用户信息
			if (SecurityConstants.CLIENT_CREDENTIALS.equals(authentication.getOAuth2Request().getGrantType())) {
				((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
				return accessToken;
			}

			UserDetail userDetail = (UserDetail) authentication.getUserAuthentication().getPrincipal();
			additionalInfo.put(SecurityConstants.DETAILS_USER, userDetail);
			((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
			return accessToken;
		};
	}

	@Bean
	public CustomClientDetailsService customClientDetailsService() {
		CustomClientDetailsService customClientDetailsService = new CustomClientDetailsService(dataSource);
		customClientDetailsService.setSelectClientDetailsSql(SecurityConstants.DEFAULT_SELECT_STATEMENT);
		customClientDetailsService.setFindClientDetailsSql(SecurityConstants.DEFAULT_FIND_STATEMENT);
		return customClientDetailsService;
	}

	@Bean
	public CustomTokenServices tokenServices() {
		CustomTokenServices tokenServices = new CustomTokenServices();
		tokenServices.setTokenStore(redisTokenStore);
		tokenServices.setSupportRefreshToken(true);
		tokenServices.setReuseRefreshToken(false);
		tokenServices.setClientDetailsService(customClientDetailsService());
		tokenServices.setTokenEnhancer(tokenEnhancer());
		addUserDetailsService(tokenServices, userDetailsService);
		return tokenServices;
	}

	private void addUserDetailsService(CustomTokenServices tokenServices, UserDetailsService userDetailsService) {
		if (userDetailsService != null) {
			PreAuthenticatedAuthenticationProvider provider = new PreAuthenticatedAuthenticationProvider();
			provider.setPreAuthenticatedUserDetailsService(new UserDetailsByNameServiceWrapper<>(userDetailsService));
			tokenServices.setAuthenticationManager(new ProviderManager(Collections.singletonList(provider)));
		}
	}
}
