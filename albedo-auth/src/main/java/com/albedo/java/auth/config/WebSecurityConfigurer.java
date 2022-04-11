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

import com.albedo.java.common.security.grant.CustomAppAuthenticationProvider;
import com.albedo.java.common.security.handler.FormAuthenticationFailureHandler;
import com.albedo.java.common.security.handler.SsoLogoutSuccessHandler;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

/**
 * @author somowhere
 * @date 2019/2/1
 * 认证相关配置
 */
@Primary
@Order(90)
@Configuration
@AllArgsConstructor
public class WebSecurityConfigurer extends WebSecurityConfigurerAdapter {
	private final UserDetailsService userDetailsService;

	@Override
	@SneakyThrows
	protected void configure(HttpSecurity http) {
		http.authenticationProvider(phoneAuthenticationProvider()).formLogin().loginPage("/token/login")
			.loginProcessingUrl("/token/form").failureHandler(authenticationFailureHandler()).and().logout()
			.logoutSuccessHandler(logoutSuccessHandler()).deleteCookies("JSESSIONID").invalidateHttpSession(true)
			.and().authorizeRequests().antMatchers("/token/**", "/actuator/**", "/mobile/**", "/v2/api-docs").permitAll()
			.anyRequest().authenticated().and().csrf().disable();
	}

	/**
	 * 不要直接使用@Bean注入 会导致默认的提供者无法注入（DaoAuthenticationProvider）
	 */
	private CustomAppAuthenticationProvider phoneAuthenticationProvider() {
		CustomAppAuthenticationProvider phoneAuthenticationProvider = new CustomAppAuthenticationProvider();
		phoneAuthenticationProvider.setUserDetailsService(userDetailsService);
		return phoneAuthenticationProvider;
	}

	@Override
	public void configure(WebSecurity web) {
		web.ignoring().antMatchers("/static/css/css/**");
	}

	@Bean
	@Override
	@SneakyThrows
	public AuthenticationManager authenticationManagerBean() {
		return super.authenticationManagerBean();
	}

	@Bean
	public AuthenticationFailureHandler authenticationFailureHandler() {
		return new FormAuthenticationFailureHandler();
	}

	/**
	 * 支持SSO 退出
	 *
	 * @return LogoutSuccessHandler
	 */
	@Bean
	public LogoutSuccessHandler logoutSuccessHandler() {
		return new SsoLogoutSuccessHandler();
	}

	/**
	 * https://spring.io/blog/2017/11/01/spring-security-5-0-0-rc1-released#password-storage-updated
	 * Encoded password does not look like BCrypt
	 *
	 * @return PasswordEncoder
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

}
