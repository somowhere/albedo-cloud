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

package com.albedo.java.modules.sys.dubbo;

import com.albedo.java.common.core.exception.BadRequestException;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.domain.dto.UserOnlineQueryCriteria;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;
import java.util.Set;

/**
 * @author somowhere
 * @date 2019/2/1
 */

public interface RemoteUserOnlineService {
	/**
	 * 分页查询 信息
	 *
	 * @param userOnlineQueryCriteria 分页参数
	 * @return page
	 */
	Result findPage(UserOnlineQueryCriteria userOnlineQueryCriteria);

	/**
	 * 删除
	 *
	 * @param tokens
	 * @param userId
	 * @return
	 */
	Result<Boolean> removeByTokens(Set<String> tokens, String userId) throws BadRequestException;
}
