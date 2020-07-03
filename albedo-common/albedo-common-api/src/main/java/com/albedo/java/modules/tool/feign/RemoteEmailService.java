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

package com.albedo.java.modules.tool.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.modules.tool.domain.vo.EmailVo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

import javax.validation.Valid;

/**
 * @author somowhere
 * @date 2019/2/1
 */
public interface RemoteEmailService {

	/**
	 * send
	 * @author somewhere
	 * @param emailVo
	 * @updateTime 2020/6/1 11:54
	 */
	@PostMapping("/email/send")
	void send(@Valid @RequestBody EmailVo emailVo, @RequestHeader(SecurityConstants.FROM) String from);
}
