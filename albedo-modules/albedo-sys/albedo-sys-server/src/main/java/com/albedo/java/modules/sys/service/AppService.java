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
 * Author: somewhere (somewhere0813@gmail.com)
 */

package com.albedo.java.modules.sys.service;


import com.albedo.java.common.core.util.Result;

/**
 * @author somewhere
 * @date 2018/11/14
 */
public interface AppService {

	/**
	 * 发送手机验证码
	 * @param mobile mobile
	 * @return code
	 */
	Result<Boolean> sendSmsCode(String mobile);

}
