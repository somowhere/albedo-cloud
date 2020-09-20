/*
 *
 *  *  Copyright (c) 2019-2020, 冷冷 (wangiegie@gmail.com).
 *  *  <p>
 *  *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  *  you may not use this file except in compliance with the License.
 *  *  You may obtain a copy of the License at
 *  *  <p>
 *  * https://www.gnu.org/licenses/lgpl.html
 *  *  <p>
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 *
 */

package com.albedo.java.modules.sys.feign.fallback;

import com.albedo.java.common.core.exception.FeignException;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.feign.RemoteDictService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author somewhere
 * @date 2019/2/1
 */
@Slf4j
@Component
public class RemoteDictServiceFallbackImpl implements RemoteDictService {

	@Setter
	private Throwable cause;

	/**
	 * 通过所有字典数据信息
	 *
	 * @param from 内外标志
	 * @return R
	 */
	@Override
	public Result<String> findAllOrderBySort(String from) {
		log.error("feign findAllOrderBySort失败:{}", from, cause);
		throw new FeignException(cause);
	}
}
