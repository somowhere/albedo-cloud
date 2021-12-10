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
import com.albedo.java.modules.sys.domain.dto.UserOnlineQueryCriteria;
import com.albedo.java.modules.sys.domain.vo.TokenVo;
import com.albedo.java.modules.sys.feign.factory.RemoteUserOnlineServiceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * @author somowhere
 * @date 2019/2/1
 */
@FeignClient(contextId = "remoteUserOnlineService", value = ServiceNameConstants.AUTH_SERVICE,
	fallbackFactory = RemoteUserOnlineServiceFallbackFactory.class)
public interface RemoteUserOnlineService {
	/**
	 * 分页查询 信息
	 *
	 * @param userOnlineQueryCriteria 分页参数
	 * @param form
	 * @return page
	 */
	@PostMapping("/token/find-page")
	Result findPage(@RequestBody UserOnlineQueryCriteria userOnlineQueryCriteria, @RequestHeader(SecurityConstants.FROM) String form);

	/**
	 * 删除
	 *
	 * @param tokenVo
	 * @param form
	 * @return
	 */
	@DeleteMapping("/token")
	Result removeByTokens(@RequestBody TokenVo tokenVo, @RequestHeader(SecurityConstants.FROM) String form);

	void reset();
}
