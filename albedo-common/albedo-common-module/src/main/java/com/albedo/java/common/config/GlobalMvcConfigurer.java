package com.albedo.java.common.config;

import com.albedo.java.common.filter.ThreadLocalContextFilter;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 公共配置类, 一些公共工具配置
 *
 * @author zuihou
 * @date 2018/8/25
 */
@Configuration
@AllArgsConstructor
public class GlobalMvcConfigurer implements WebMvcConfigurer {

	@Bean
	@Order(1)
	public ThreadLocalContextFilter threadLocalContextFilter() {
		return new ThreadLocalContextFilter();
	}
}
