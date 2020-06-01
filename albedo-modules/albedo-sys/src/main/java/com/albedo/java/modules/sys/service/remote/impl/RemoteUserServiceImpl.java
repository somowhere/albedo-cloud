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

import cn.hutool.core.lang.Assert;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.domain.vo.UserInfo;
import com.albedo.java.modules.sys.domain.vo.UserVo;
import com.albedo.java.modules.sys.dubbo.RemoteUserService;
import com.albedo.java.modules.sys.service.UserService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.List;

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
public class RemoteUserServiceImpl implements RemoteUserService {

	private final UserService userService;

	@Override
	public UserInfo getUserInfo(String username) {
		UserVo userVo = userService.findVoByUsername(username);
		if (userVo == null) {
			throw new UsernameNotFoundException("用户不存在");
		}
		Assert.isTrue(userVo.isAvailable(), "用户【" + username + "】已被锁定，无法登录");
		return userService.getInfo(userVo);
	}

	@Override
	public List<User> findListByDeptId(String deptId) {
		return userService.findListByDeptId(deptId);
	}

	@Override
	public List<User> findListByRoleId(String roleId) {
		return userService.findListByRoleId(roleId);
	}

	@Override
	public List<User> findListByMenuId(String menuId) {
		return userService.findListByMenuId(menuId);
	}
}
