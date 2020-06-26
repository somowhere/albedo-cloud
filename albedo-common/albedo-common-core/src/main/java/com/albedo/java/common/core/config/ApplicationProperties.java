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
 * @author somewhere
 */
@Configuration
@ConfigurationProperties(prefix = "application", ignoreInvalidFields = true)
@Data
@RefreshScope
public class ApplicationProperties {

	private final CorsConfiguration cors = new CorsConfiguration();
	private String urlSuffix = ".html";
	private Boolean developMode = true;
	private Boolean addressEnabled = true;
	private StaticFileDirectory staticFileDirectory;
	private String logPath = "logs/";
	private Rsa rsa = new Rsa();
	@Data
	public static class StaticFileDirectory {

		private String mac;
		private String linux;
		private String win;

	}


	@Data
	public static class Rsa {

		private String publicKey;
		private String privateKey;

	}
}
