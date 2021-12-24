/*
 *  Copyright (c) 2019-2020, somowhere (somewhere0813@gmail.com).
 *  <p>
 *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  <p>
 * https://www.gnu.org/licenses/lgpl.html
 *  <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.albedo.java.auth.handler;

import cn.hutool.http.HttpUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.AddressUtil;
import com.albedo.java.common.core.util.SpringContextHolder;
import com.albedo.java.common.core.util.WebUtil;
import com.albedo.java.common.log.event.SysLogLoginEvent;
import com.albedo.java.common.log.util.SysLogUtils;
import com.albedo.java.common.security.handler.AbstractAuthenticationSuccessEventHandler;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.common.util.RedisUtil;
import com.albedo.java.modules.sys.domain.LogLogin;
import com.albedo.java.modules.sys.domain.LogOperate;
import com.albedo.java.modules.sys.domain.dto.UserOnlineDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Objects;
import java.util.concurrent.Executor;

/**
 * @author somowhere
 * @date 2019/2/1
 */
@Slf4j
@Component
public class AuthenticationSuccessEventHandler extends AbstractAuthenticationSuccessEventHandler {


	private final Executor taskExecutor;

	public AuthenticationSuccessEventHandler(Executor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}

	/**
	 * 处理登录成功方法
	 * <p>
	 * 获取到登录的authentication 对象
	 *
	 * @param authentication 登录对象
	 */
	@Override
	public void handle(Authentication authentication) {
		log.info("用户：{} 登录成功", authentication.getPrincipal());
		HttpServletRequest request = ((ServletRequestAttributes) Objects
			.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
		LogLogin logLogin = SysLogUtils.getSysLogLogin();
		if (authentication.getPrincipal() instanceof String) {
			logLogin.setUsername((String) authentication.getPrincipal());
		} else if (authentication.getPrincipal() instanceof UserDetail) {
			UserDetail principal = (UserDetail) authentication.getPrincipal();
			logLogin.setUsername(principal.getUsername());
			logLogin.setCreatedBy(principal.getId());
			String ip = WebUtil.getIp(request);
			String userAgentStr = request.getHeader(HttpHeaders.USER_AGENT);
			taskExecutor.execute(() -> saveUserOnline(principal, ip, userAgentStr));
		}
		logLogin.setParams(HttpUtil.toParams(request.getParameterMap()));
		logLogin.setTitle("用户登录成功");
		// 发送异步日志事件
		SpringContextHolder.publishEvent(new SysLogLoginEvent(logLogin));
	}

	/**
	 * saveUserOnline 保存在线用户信息
	 *
	 * @param userDetail
	 * @param ip
	 * @param userAgentStr
	 */
	public void saveUserOnline(UserDetail userDetail, String ip, String userAgentStr) {
		UserAgent userAgent = UserAgentUtil.parse(userAgentStr);
		UserOnlineDto userOnlineDto = new UserOnlineDto(userDetail.getDeptId(),
			userDetail.getDeptName(), userDetail.getId(), userDetail.getUsername(), ip, AddressUtil.getRegion(ip),
			userAgentStr, userAgent.getBrowser().getName(), userAgent.getOs().getName(), new Date());
		RedisUtil.setCacheObject(SecurityConstants.PROJECT_OAUTH_ONLINE + userOnlineDto.getUserId(), userOnlineDto);
	}


}
