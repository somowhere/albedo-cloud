package com.albedo.java.common.core.config;

import com.albedo.java.common.core.util.SpringContextHolder;
import lombok.extern.slf4j.Slf4j;

/**
 * 系统配置类
 *
 * @author somewhere version 2014-1-20 下午4:06:33
 */
@Slf4j
public class ApplicationConfiguration {

	static ApplicationProperties applicationProperties = SpringContextHolder.getBean(ApplicationProperties.class);

	/**
	 * 获取文件上传路径
	 */
	public static String getStaticFileDirectory() {
		return applicationProperties.getFile().getLocal().getStoragePath();
	}

}
