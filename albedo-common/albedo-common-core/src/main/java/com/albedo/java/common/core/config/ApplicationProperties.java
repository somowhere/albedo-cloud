package com.albedo.java.common.core.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;

/**
 * Properties specific to albedo.
 * <p>
 * <p>
 * Properties are configured in the application.yml file.
 * </p>
 */
@Configuration
@ConfigurationProperties(prefix = "application", ignoreInvalidFields = true)
@Data
@RefreshScope
public class ApplicationProperties {

	private final CorsConfiguration cors = new CorsConfiguration();
	private String urlSuffix = ".html";
	private Boolean developMode = true;
	private String staticFileDirectory = "";
	private String logPath = ".logs/";

}
