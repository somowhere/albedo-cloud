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

package com.albedo.java.modules.sys.web;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.log.annotation.Log;
import com.albedo.java.common.security.util.SecurityUtil;
import com.albedo.java.modules.sys.domain.dto.UserOnlineQueryCriteria;
import com.albedo.java.modules.sys.domain.vo.TokenVo;
import com.albedo.java.modules.sys.feign.RemoteUserOnlineService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

/**
 * @author somowhere
 * @date 2018/9/4
 * getTokenPage 管理
 */
@RestController
@RequestMapping("/user-online")
@RequiredArgsConstructor
public class UserOnlineResource {

	private final RemoteUserOnlineService remoteUserOnlineService;

	/**
	 *
	 * @param userOnlineQueryCriteria 参数集
	 * @return
	 */
	@Log(value = "在线用户查看")
	@GetMapping
	@PreAuthorize("@pms.hasPermission('sys_userOnline_del')")
	public Result findPage(UserOnlineQueryCriteria userOnlineQueryCriteria) {
		return remoteUserOnlineService.findPage(userOnlineQueryCriteria, SecurityConstants.FROM_IN);
	}

	/**
	 * 删除
	 *
	 * @param tokens
	 * @return Result
	 */
	@Log(value = "强退在线用户")
	@DeleteMapping
	@PreAuthorize("@pms.hasPermission('sys_userOnline_del')")
	public Result removeByTokens(@RequestBody Set<String> tokens) {
		return remoteUserOnlineService.removeByTokens(new TokenVo(tokens, SecurityUtil.getUser().getId()), SecurityConstants.FROM_IN);
	}
}
