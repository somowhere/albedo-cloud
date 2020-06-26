package com.albedo.java.common.core.config;

import com.albedo.java.common.core.util.SpringContextHolder;
import lombok.extern.slf4j.Slf4j;

/**
 * 系统配置类
 *
 * @author somewhere version 2014-1-20 下午4:06:33
 */
@Slf4j
public class ApplicationConfig {

	static ApplicationProperties applicationProperties = SpringContextHolder.getBean(ApplicationProperties.class);

	public static boolean isAddressEnabled() {
		return applicationProperties.getAddressEnabled();
	}


	/**
	 * 获取文件上传路径
	 */
	public static String getStaticFileDirectory() {
		String os = System.getProperty("os.name").toLowerCase();
		boolean win = os.startsWith("win");
		boolean mac = os.startsWith("mac");
		ApplicationProperties.StaticFileDirectory staticFileDirectory = applicationProperties.getStaticFileDirectory();
		if (win) {
			return staticFileDirectory.getWin();
		} else if (mac) {
			return staticFileDirectory.getMac();
		}
		return staticFileDirectory.getLinux();
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
