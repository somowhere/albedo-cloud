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

package com.albedo.java.modules.sys.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.RandomUtil;
import com.albedo.java.common.core.cache.model.CacheKey;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.cache.UserCacheKeyBuilder;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.repository.UserRepository;
import com.albedo.java.modules.sys.service.AppService;
import com.albedo.java.plugins.cache.repository.CacheOps;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.List;

/**
 * @author somewhere
 * @date 2018/11/14
 * <p>
 * 手机登录相关业务实现
 */
@Slf4j
@Service
@AllArgsConstructor
public class AppServiceImpl implements AppService {

	private final CacheOps cacheOps;

	private final UserRepository userMapper;

	/**
	 * 发送手机验证码 TODO: 调用短信网关发送验证码,测试返回前端
	 * @param phone 手机号
	 * @return code
	 */
	@Override
	public Result<Boolean> sendSmsCode(String phone) {
		List<User> userList = userMapper.selectList(Wrappers.<User>query().lambda().eq(User::getPhone, phone));

		if (CollUtil.isEmpty(userList)) {
			log.info("手机号未注册:{}", phone);
			return Result.buildFail( "手机号未注册");
		}
		CacheKey key = new UserCacheKeyBuilder().key(CommonConstants.DEFAULT_CODE_KEY, phone);
		Object codeObj = cacheOps.get(key);

		if (codeObj != null) {
			log.info("手机号验证码未过期:{}，{}", phone, codeObj);
			return Result.buildFail("验证码发送过频繁");
		}

		String code = RandomUtil.randomNumbers(Integer.parseInt(SecurityConstants.CODE_SIZE));
		log.info("手机号生成验证码成功:{},{}", phone, code);
		key.setExpire(Duration.ofSeconds(SecurityConstants.CODE_TIME));
		cacheOps.set(key, code);
		return Result.buildOkData(code);
	}

}
