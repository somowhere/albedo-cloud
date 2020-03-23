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

package com.albedo.java.modules.sys.service.remote.impl;

import com.albedo.java.modules.sys.dubbo.RemoteDeptService;
import com.albedo.java.modules.sys.service.DeptService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;

import java.util.Collection;

/**
 * <p>
 * 日志表 服务实现类
 * </p>
 *
 * @author somowhere
 * @since 2019/2/1
 */
@Service(protocol = "dubbo")
@AllArgsConstructor
public class RemoteDeptServiceImpl implements RemoteDeptService {

	private final DeptService deptService;

	@Override
	public Collection<? extends String> findDescendantIdList(String deptId) {
		return deptService.findDescendantIdList(deptId);
	}
}
