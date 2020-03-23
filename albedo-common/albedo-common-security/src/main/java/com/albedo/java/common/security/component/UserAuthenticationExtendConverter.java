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

package com.albedo.java.common.security.component;

import com.albedo.java.common.core.util.Json;
import com.albedo.java.common.persistence.datascope.DataScope;
import com.albedo.java.common.security.service.UserDetail;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.provider.token.UserAuthenticationConverter;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author somowhere
 * @date 2019-03-07
 * <p>
 * 根据checktoken 的结果转化用户信息
 */
public class UserAuthenticationExtendConverter implements UserAuthenticationConverter {
	private static final String USER_ID = "user_id";
	private static final String DEPT_ID = "dept_id";
	private static final String PARENT_DEPT_ID = "parent_dept_id";
	private static final String DEPT_NAME = "dept_name";
	private static final String TENANT_ID = "tenant_id";
	private static final String DATA_SCOPE = "data_scope";
	private static final String N_A = "N/A";

	/**
	 * Extract information about the user to be used in an access token (i.e. for web servers).
	 *
	 * @param authentication an authentication representing a user
	 * @return a map of key values representing the unique information about the user
	 */
	@Override
	public Map<String, ?> convertUserAuthentication(Authentication authentication) {
		Map<String, Object> response = new LinkedHashMap<>();
		response.put(USERNAME, authentication.getName());
		if (authentication.getPrincipal() instanceof UserDetail) {
			UserDetail userDetail = (UserDetail) authentication.getPrincipal();
			response.put(USER_ID, userDetail.getId());
			response.put(DEPT_ID, userDetail.getDeptId());
			response.put(PARENT_DEPT_ID, userDetail.getParentDeptId());
			response.put(DEPT_NAME, userDetail.getDeptName());
			response.put(DATA_SCOPE, Json.toJsonString(userDetail.getDataScope()));
		}
		if (authentication.getAuthorities() != null && !authentication.getAuthorities().isEmpty()) {
			response.put(AUTHORITIES, AuthorityUtils.authorityListToSet(authentication.getAuthorities()));
		}
		return response;
	}

	/**
	 * Inverse of {@link #convertUserAuthentication(Authentication)}. Extracts an Authentication from a map.
	 *
	 * @param map a map of user information
	 * @return an Authentication representing the user or null if there is none
	 */
	@Override
	public Authentication extractAuthentication(Map<String, ?> map) {
		if (map.containsKey(USERNAME)) {
			Collection<? extends GrantedAuthority> authorities = getAuthorities(map);

			String username = (String) map.get(USERNAME);
			String id = (String) map.get(USER_ID);
			String deptId = (String) map.get(DEPT_ID);
			String parentDeptId = (String) map.get(PARENT_DEPT_ID);
			String deptName = (String) map.get(DEPT_NAME);
			DataScope dataScope = Json.parseObject((String) map.get(DATA_SCOPE), DataScope.class);
			UserDetail user = new UserDetail(id, deptId, parentDeptId,deptName, username, N_A, true
				, true, true, true, authorities, dataScope);
			return new UsernamePasswordAuthenticationToken(user, N_A, authorities);
		}
		return null;
	}

	private Collection<? extends GrantedAuthority> getAuthorities(Map<String, ?> map) {
		Object authorities = map.get(AUTHORITIES);
		if (authorities instanceof String) {
			return AuthorityUtils.commaSeparatedStringToAuthorityList((String) authorities);
		}
		if (authorities instanceof Collection) {
			return AuthorityUtils.commaSeparatedStringToAuthorityList(StringUtils
				.collectionToCommaDelimitedString((Collection<?>) authorities));
		}
		throw new IllegalArgumentException("Authorities must be either a String or a Collection");
	}
}
