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

package com.albedo.java.common.log.config;

import com.albedo.java.common.log.aspect.RequestLogAspect;
import com.albedo.java.common.log.aspect.SysLogAspect;
import com.albedo.java.common.log.event.SysLogOperateListener;
import com.albedo.java.modules.sys.feign.RemoteLogOperateService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author somowhere
 * @date 2019/2/1
 * 日志自动配置
 */
@ConditionalOnWebApplication
@Configuration(proxyBeanMethods = false)
@RequiredArgsConstructor
public class LogAutoConfiguration {
	private final RemoteLogOperateService remoteLogOperateService;

	@Bean
	public SysLogOperateListener sysLogListener() {
		return new SysLogOperateListener(remoteLogOperateService);
	}

	@Bean
	public SysLogAspect sysLogAspect() {
		return new SysLogAspect();
	}

	@Bean
	public RequestLogAspect requestLogAspect() {
		return new RequestLogAspect();
	}
}
