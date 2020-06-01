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

import cn.hutool.core.exceptions.ExceptionUtil;
import cn.hutool.http.HttpUtil;
import com.albedo.java.common.core.util.SpringContextHolder;
import com.albedo.java.common.log.enums.LogType;
import com.albedo.java.common.log.enums.OperatorType;
import com.albedo.java.common.log.event.SysLogEvent;
import com.albedo.java.common.log.util.SysLogUtils;
import com.albedo.java.common.security.handler.AbstractAuthenticationFailureEvenHandler;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.modules.sys.domain.LogOperate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * @author somowhere
 * @date 2019/2/1
 */
@Slf4j
@Component
public class AuthenticationFailureEvenHandler extends AbstractAuthenticationFailureEvenHandler {

	/**
	 * 处理登录失败方法
	 * <p>
	 *
	 * @param exception 登录的authentication 对象
	 * @param authentication          登录的authenticationException 对象
	 */
	@Override
	public void handle(AuthenticationException exception, Authentication authentication) {
		log.info("用户：{} 登录失败，异常：{}", authentication.getPrincipal(), exception.getLocalizedMessage());
		String useruame = null;
		if(authentication.getPrincipal() instanceof String){
			useruame = (String) authentication.getPrincipal();
		}

		String message = exception instanceof BadCredentialsException && "Bad credentials".equals(exception.getMessage()) ? "密码填写错误！" : exception.getMessage();

		HttpServletRequest request = ((ServletRequestAttributes) Objects
			.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
		LogOperate logOperate = SysLogUtils.getSysLog();
		logOperate.setParams(HttpUtil.toParams(request.getParameterMap()));
		logOperate.setUsername(useruame);
		logOperate.setLogType(LogType.WARN.name());
		logOperate.setTitle("用户登录失败");
		logOperate.setDescription(message);
		logOperate.setException(ExceptionUtil.stacktraceToString(exception));
		logOperate.setOperatorType(OperatorType.MANAGE.name());
		// 发送异步日志事件
		SpringContextHolder.publishEvent(new SysLogEvent(logOperate));
	}
}
