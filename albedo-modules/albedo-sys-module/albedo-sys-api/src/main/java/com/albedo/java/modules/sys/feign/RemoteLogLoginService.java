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

package com.albedo.java.modules.sys.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.constant.ServiceNameConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.domain.LogLoginDo;
import com.albedo.java.modules.sys.feign.factory.RemoteLogLoginServiceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * @author somowhere
 * @date 2019/2/1
 */
@FeignClient(contextId = "remoteLogLoginService", value = ServiceNameConstants.SYS_SERVICE,
	fallbackFactory = RemoteLogLoginServiceFallbackFactory.class)
public interface RemoteLogLoginService {
	/**
	 * 保存日志
	 *
	 * @param logLoginDo 日志实体
	 * @param from       内部调用标志
	 * @return succes、false
	 */
	@PostMapping("/log-login/inner/save")
	Result<Boolean> save(@RequestBody LogLoginDo logLoginDo, @RequestHeader(SecurityConstants.FROM) String from);
}
