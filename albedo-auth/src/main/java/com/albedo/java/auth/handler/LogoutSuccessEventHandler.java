/*
 * Copyright (c) 2020 pig4cloud Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.albedo.java.auth.handler;

import com.albedo.java.common.core.util.SpringContextHolder;
import com.albedo.java.common.core.util.WebUtil;
import com.albedo.java.common.log.event.SysLogOperateEvent;
import com.albedo.java.common.log.util.SysLogUtils;
import com.albedo.java.common.security.handler.AbstractLogoutSuccessEventHandler;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.modules.sys.domain.LogOperate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.stereotype.Component;

/**
 * @author zhangran
 * @date 2021/6/23
 */
@Slf4j
@Component
public class LogoutSuccessEventHandler extends AbstractLogoutSuccessEventHandler {

	/**
	 * 处理退出成功方法
	 * <p>
	 * 获取到登录的authentication 对象
	 * @param authentication 登录对象
	 */
	@Override
	public void handle(Authentication authentication) {
		log.info("用户：{} 退出成功", authentication.getPrincipal());
		SecurityContextHolder.getContext().setAuthentication(authentication);

		LogOperate logOperate = SysLogUtils.getSysLogOperate();
		logOperate.setTitle("退出成功");
		// 发送异步日志事件
		Long startTime = System.currentTimeMillis();
		Long endTime = System.currentTimeMillis();
		logOperate.setTime(endTime - startTime);

		// 设置对应的token
		logOperate.setParams(WebUtil.getRequest().getHeader(HttpHeaders.AUTHORIZATION));

		// 这边设置ServiceId
		if (authentication instanceof OAuth2Authentication) {
			OAuth2Authentication auth2Authentication = (OAuth2Authentication) authentication;
			logOperate.setServiceId(auth2Authentication.getOAuth2Request().getClientId());
		}
		if (authentication.getPrincipal() instanceof UserDetail) {
			UserDetail userDetail = (UserDetail) authentication.getPrincipal();
			logOperate.setCreatedBy(userDetail.getId());
		SpringContextHolder.publishEvent(new SysLogOperateEvent(logOperate));
	}

}
}
