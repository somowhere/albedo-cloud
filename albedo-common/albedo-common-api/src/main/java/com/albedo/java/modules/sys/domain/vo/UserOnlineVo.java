package com.albedo.java.modules.sys.domain.vo;

import com.albedo.java.common.core.vo.GeneralDto;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.Date;

/**
 * 当前在线会话 sys_user_online
 *
 * @author somewhere
 */
@Data
public class UserOnlineVo extends GeneralDto {

	/**
	 * 部门ID
	 */
	private String deptId;

	/**
	 * 部门名称
	 */
	private String deptName;

	/**
	 * 登录ID
	 */
	private String userId;

	/**
	 * 登录名称
	 */
	private String username;

	/**
	 * 登录IP地址
	 */
	private String ipAddress;

	/**
	 * 登录地址
	 */
	private String ipLocation;

	/**
	 * 操作系统
	 */
	private String userAgent;
	/**
	 * 浏览器类型
	 */
	private String browser;

	/**
	 * 操作系统
	 */
	private String os;

	/**
	 * 登录时间
	 */
	private Date loginTime;

	private String tokenType;

	private String accessToken;

	private Date expiresIn;

	private String clientId;

	private String grantType;





}
