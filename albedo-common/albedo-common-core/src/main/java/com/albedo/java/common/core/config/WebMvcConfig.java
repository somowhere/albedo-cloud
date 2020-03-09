/*
 *    Copyright (c) 2018-2025, somewhere All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: somewhere (wangiegie@gmail.com)
 */

package com.albedo.java.common.core.config;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author somowhere
 * @date 2019-06-24
 * <p>
 * 注入自自定义SQL 过滤
 */
@Configuration
@Slf4j
@ConditionalOnClass(WebMvcConfigurer.class)
@AllArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer {

//	@Override
//	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
//		argumentResolvers.add(new SqlFilterArgumentResolver());
//	}

	private final ApplicationProperties applicationProperties;

	@Bean
	public CorsFilter corsFilter() {
		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		CorsConfiguration config = applicationProperties.getCors();
		if (config.getAllowedOrigins() != null && !config.getAllowedOrigins().isEmpty()) {
			log.debug("Registering CORS filter");
			source.registerCorsConfiguration("/**", config);
//			source.registerCorsConfiguration("/oauth/**", config);
//			source.registerCorsConfiguration("/management/**", config);
//			source.registerCorsConfiguration("/v2/api-docs", config);
		}
		return new CorsFilter(source);
	}

}
