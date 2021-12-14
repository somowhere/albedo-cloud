package com.albedo.java.gateway.config;

import com.albedo.java.gateway.filter.AlbedoRequestGlobalFilter;
import com.albedo.java.gateway.filter.ApiLoggingFilter;
import com.albedo.java.gateway.filter.PasswordDecoderFilter;
import com.albedo.java.gateway.filter.ValidateCodeGatewayFilter;
import com.albedo.java.gateway.handler.AssetFileHandler;
import com.albedo.java.gateway.handler.GlobalGatewayExceptionHandler;
import com.albedo.java.gateway.handler.ImageCodeHandler;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

/**
 * 网关配置
 *
 * @author L.cm
 */
@Configuration(proxyBeanMethods = false)
@EnableConfigurationProperties(GatewayConfigProperties.class)
public class GatewayConfiguration {

	@Bean
	public PasswordDecoderFilter passwordDecoderFilter(GatewayConfigProperties configProperties) {
		return new PasswordDecoderFilter(configProperties);
	}

	@Bean
	public AlbedoRequestGlobalFilter albedoRequestGlobalFilter() {
		return new AlbedoRequestGlobalFilter();
	}

	@Bean
	public ApiLoggingFilter apiLoggingFilter() {
		return new ApiLoggingFilter();
	}
	@Bean
	public ValidateCodeGatewayFilter validateCodeGatewayFilter(GatewayConfigProperties configProperties,
															   ObjectMapper objectMapper, RedisTemplate redisTemplate) {
		return new ValidateCodeGatewayFilter(configProperties, objectMapper, redisTemplate);
	}

	@Bean
	public GlobalGatewayExceptionHandler globalGatewayExceptionHandler(ObjectMapper objectMapper) {
		return new GlobalGatewayExceptionHandler(objectMapper);
	}

	@Bean
	public ImageCodeHandler imageCodeHandler(RedisTemplate redisTemplate) {
		return new ImageCodeHandler(redisTemplate);
	}


	@Bean
	public AssetFileHandler assetFileHandler() {
		return new AssetFileHandler();
	}

}
