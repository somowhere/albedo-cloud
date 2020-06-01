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

import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.domain.vo.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * @author somowhere
 * @date 2019/2/1
 */
public interface RemoteUserService {
	/**
	 * 通过用户名查询用户、角色信息
	 *
	 * @param username 用户名
	 * @return R
	 */
	UserInfo getUserInfo(String username);

	/**
	 * findListByDeptId
	 * @author somewhere
	 * @param deptId
	 * @updateTime 2020/6/1 11:08
	 * @return java.util.List<com.albedo.java.modules.sys.domain.User>
	 */
	List<User> findListByDeptId(String deptId);
	/**
	 * findListByRoleId
	 *
	 * @param roleId
	 * @return java.util.List<com.albedo.java.modules.sys.domain.User>
	 * @author somewhere
	 * @updateTime 2020/5/31 17:35
	 */
	List<User> findListByRoleId(String roleId);

	/**
	 * findListByMenuId
	 *
	 * @param menuId
	 * @return java.util.List<com.albedo.java.modules.sys.domain.User>
	 * @author somewhere
	 * @updateTime 2020/5/31 17:35
	 */
	List<User> findListByMenuId(String menuId);
}
