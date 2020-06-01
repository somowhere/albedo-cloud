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

package com.albedo.java.common.security.service;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.CollUtil;
import com.albedo.java.common.persistence.datascope.DataScope;
import com.albedo.java.modules.sys.domain.Role;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.domain.vo.UserInfo;
import com.albedo.java.modules.sys.domain.vo.UserVo;
import com.albedo.java.modules.sys.dubbo.RemoteDeptService;
import com.albedo.java.modules.sys.dubbo.RemoteRoleService;
import com.albedo.java.modules.sys.dubbo.RemoteUserService;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * 用户详细信息
 *
 * @author somowhere
 */
@Slf4j
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Reference(check = false)
	private RemoteUserService remoteUserService;
	@Reference(check = false)
	private RemoteRoleService remoteRoleService;
	@Reference(check = false)
	private RemoteDeptService remoteDeptService;
	@Resource
	private CacheManager cacheManager;


	/**
	 * 用户密码登录
	 *
	 * @param username 用户名
	 * @return
	 */
	@Override
	@SneakyThrows
	public UserDetails loadUserByUsername(String username) {
		UserDetails userDetails = getUserDetails(remoteUserService.getUserInfo(username));
		return userDetails;
	}

	/**
	 * 构建userdetails
	 *
	 * @param info 用户信息
	 * @return
	 */
	private UserDetails getUserDetails(UserInfo info) {
		if (info == null) {
			throw new UsernameNotFoundException("用户不存在");
		}

		Set<String> dbAuthsSet = new HashSet<>();
		if (ArrayUtil.isNotEmpty(info.getRoles())) {
			// 获取角色
			Arrays.stream(info.getRoles()).forEach(role -> dbAuthsSet.add(SecurityConstants.ROLE + role));
			// 获取资源
			dbAuthsSet.addAll(Arrays.asList(info.getPermissions()));

		}
		Collection<? extends GrantedAuthority> authorities
			= AuthorityUtils.createAuthorityList(dbAuthsSet.toArray(new String[0]));
		UserVo userVo = info.getUser();
		DataScope dataScope = new DataScope();
		dataScope.setUserId(userVo.getId());
		if(CollUtil.isNotEmpty(userVo.getRoleList())){
			for(Role role: userVo.getRoleList()){
				if(SecurityConstants.ROLE_DATA_SCOPE_ALL.equals(role.getDataScope())){
					dataScope.setAll(true);
					break;
				}else if(SecurityConstants.ROLE_DATA_SCOPE_DEPT_ALL.equals(role.getDataScope())){
					dataScope.getDeptIds().addAll(remoteDeptService.findDescendantIdList(userVo.getDeptId()));
				}else if(SecurityConstants.ROLE_DATA_SCOPE_DEPT.equals(role.getDataScope())){
					dataScope.getDeptIds().add(userVo.getDeptId());
				}else if(SecurityConstants.ROLE_DATA_SCOPE_SELF.equals(role.getDataScope())){
					dataScope.setSelf(true);
				}else if(SecurityConstants.ROLE_DATA_SCOPE_CUSTOM.equals(role.getDataScope())){
					dataScope.getDeptIds().addAll(remoteRoleService.findDeptIdsByRoleId(role.getId()));
				}
			}
		}
		// 构造security用户
		return new UserDetail(userVo.getId(), userVo.getDeptId(), userVo.getDeptName(), userVo.getUsername(), SecurityConstants.BCRYPT + userVo.getPassword(),
			userVo.isAvailable(), true, true, true, authorities, dataScope);
	}
}
