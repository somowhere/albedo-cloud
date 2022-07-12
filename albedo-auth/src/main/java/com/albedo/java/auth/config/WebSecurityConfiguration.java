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

package com.albedo.java.auth.config;

import com.albedo.java.auth.support.core.AlbedoDaoAuthenticationProvider;
import com.albedo.java.auth.support.core.FormIdentityLoginConfigurer;
import com.albedo.java.common.core.filter.ThreadLocalContextFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

/**
 * 服务安全相关配置
 *
 * @author lengleng
 * @date 2022/1/12
 */
@EnableWebSecurity(debug = true)
public class WebSecurityConfiguration {

	/**
	 * spring security 默认的安全策略
	 *
	 * @param http security注入点
	 * @return SecurityFilterChain
	 * @throws Exception
	 */
	@Bean
	SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
		http.authorizeRequests(authorizeRequests -> authorizeRequests.antMatchers("/token/*", "/v3/api-docs").permitAll()// 开放自定义的部分端点
				.anyRequest().authenticated()).headers().frameOptions().sameOrigin()// 避免iframe同源无法登录
			.and().apply(new FormIdentityLoginConfigurer()); // 表单登录个性化
		// 处理 UsernamePasswordAuthenticationToken
		http.authenticationProvider(new AlbedoDaoAuthenticationProvider());
		return http.build();
	}

	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
		return (web) -> web.ignoring().antMatchers("/actuator/**", "/css/**", "/error");
	}
	@Bean
	@Order(1)
	public ThreadLocalContextFilter threadLocalContextFilter() {
		return new ThreadLocalContextFilter();
	}
}
