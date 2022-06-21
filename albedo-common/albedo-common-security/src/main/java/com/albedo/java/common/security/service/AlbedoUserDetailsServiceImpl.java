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

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.modules.sys.feign.RemoteUserService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * 用户详细信息
 *
 * @author somowhere
 */
@Slf4j
@Primary
@RequiredArgsConstructor
public class AlbedoUserDetailsServiceImpl implements AlbedoUserDetailsService {

	private final RemoteUserService remoteUserService;

	/**
	 * 用户密码登录
	 *
	 * @param username 用户名
	 * @return
	 */
	@Override
	@SneakyThrows
	public UserDetails loadUserByUsername(String username) {
		UserDetails userDetails = getUserDetails(remoteUserService.getInfoByUsername(username, SecurityConstants.FROM_IN));
		return userDetails;
	}


	/**
	 * 手机号码登录
	 *
	 * @param phone 手机号码
	 * @return 用户信息
	 */
	public UserDetails loadUserByPhone(String phone) {
		UserDetails userDetails = getUserDetails(remoteUserService.getInfoByPhone(phone, SecurityConstants.FROM_IN));
		return userDetails;
	}

	@Override
	public int getOrder() {
		return Integer.MIN_VALUE;
	}
}
