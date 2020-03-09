package com.albedo.java.common.core.config;

import com.albedo.java.common.core.util.SpringContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;

/**
 * 系统配置类
 *
 * @author somewhere version 2014-1-20 下午4:06:33
 */
@Slf4j
public class ApplicationConfig {

	private static Environment environment;

	/**
	 * 将构造函数私有化，不能new实例
	 */
	private ApplicationConfig() {

	}

	public static Environment getEnvironment() {
		if (environment == null) {
			environment = SpringContextHolder.getBean(Environment.class);
		}
		return environment;
	}

	/**
	 * 获取配置信息的静态方法。
	 *
	 * @param name - 要获取的配置信息的名称
	 * @return - 配置信息。如果不存在，返回null
	 */
	public static String get(String name) {
		return getEnvironment().getProperty(name);
	}


	public static boolean isAddressEnabled() {
		return Boolean.valueOf(get("application.address-enabled"));
	}


	/**
	 * 获取文件上传路径
	 */
	public static String getStaticFileDirectory() {
		return get("application.static-file-directory");
	}

	/**
	 * 获取头像上传路径
	 */
	public static String getAvatarPath() {
		return getStaticFileDirectory() + "/avatar";
	}

	/**
	 * 获取下载路径
	 */
	public static String getDownloadPath() {
		return getStaticFileDirectory() + "/download";
	}

	/**
	 * 获取上传路径
	 */
	public static String getUploadPath() {
		return getStaticFileDirectory() + "/upload";
	}


}
