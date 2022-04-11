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

package com.albedo.java.common.security.component;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.provider.token.ResourceServerTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;

/**
 * @author somowhere
 * @date 2019/03/08
 */
@EnableConfigurationProperties(PermitAllUrlProperties.class)
public class AlbedoResourceServerAutoConfiguration {
	@Bean("pms")
	public PermissionService permissionService() {
		return new PermissionService();
	}

	@Bean
	public AlbedoAccessDeniedHandler albedoAccessDeniedHandler(ObjectMapper objectMapper) {
		return new AlbedoAccessDeniedHandler(objectMapper);
	}

	@Bean
	public AlbedoBearerTokenExtractor albedoBearerTokenExtractor(PermitAllUrlProperties urlProperties) {
		return new AlbedoBearerTokenExtractor(urlProperties);
	}

	@Bean
	public ResourceAuthExceptionEntryPoint resourceAuthExceptionEntryPoint(ObjectMapper objectMapper) {
		return new ResourceAuthExceptionEntryPoint(objectMapper);
	}

	@Bean
	@Primary
	public ResourceServerTokenServices resourceServerTokenServices(TokenStore tokenStore,
																   UserDetailsService userDetailsService) {
		return new AlbedoLocalResourceServerTokenServices(tokenStore, userDetailsService);
	}

}
