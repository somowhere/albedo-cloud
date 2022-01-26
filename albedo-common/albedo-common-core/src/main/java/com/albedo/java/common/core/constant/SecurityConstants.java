/*
 *  Copyright (c) 2019-2021  <a href="https://github.com/somowhere/albedo">Albedo</a>, somewhere (somewhere0813@gmail.com).
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

/*
 *  Copyright (c) 2019-2021  <a href="https://github.com/somowhere/albedo">Albedo</a>, somewhere (somewhere0813@gmail.com).
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

package com.albedo.java.common.core.constant;

/**
 * @author somewhere
 * @date 2019/2/1
 */
public interface SecurityConstants {

	/**
	 * 角色前缀
	 */
	String ROLE = "ROLE_";

	/**
	 * 前缀
	 */
	String PROJECT_PREFIX = "albedo_";

	/**
	 * oauth 相关前缀
	 */
	String OAUTH_PREFIX = "oauth:";
	String PROJECT_OAUTH_ACCESS = SecurityConstants.PROJECT_PREFIX + SecurityConstants.OAUTH_PREFIX + "access:";
	String PROJECT_OAUTH_ONLINE = SecurityConstants.PROJECT_PREFIX + SecurityConstants.OAUTH_PREFIX + "online:";
	/**
	 * 项目的license
	 */
	String PROJECT_LICENSE = "made by albedo";

	/**
	 * 内部
	 */
	String FROM_IN = "Y";

	/**
	 * 标志
	 */
	String FROM = "from";

	/**
	 * 默认登录URL
	 */
	String OAUTH_TOKEN_URL = "/oauth/token";
	/**
	 *
	 */
	String OAUTH_URL = "/oauth";
	/**
	 * grant_type
	 */
	String REFRESH_TOKEN = "refresh_token";

	/**
	 * oauth 客户端信息
	 */
	String CLIENT_DETAILS_KEY = PROJECT_PREFIX + OAUTH_PREFIX + "client:details";

	/**
	 * {bcrypt} 加密的特征码
	 */
	String BCRYPT = "{bcrypt}";

	/**
	 * sys_oauth_client_detail 表的字段，不包括client_id、client_secret
	 */
	String CLIENT_FIELDS = "client_id, CONCAT('{noop}',client_secret) as client_secret, resource_ids, scope, "
		+ "authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, "
		+ "refresh_token_validity, additional_information, autoapprove";

	/**
	 * JdbcClientDetailsService 查询语句
	 */
	String BASE_FIND_STATEMENT = "select " + CLIENT_FIELDS + " from sys_oauth_client_detail";

	/**
	 * 默认的查询语句
	 */
	String DEFAULT_FIND_STATEMENT = BASE_FIND_STATEMENT + " order by client_id";

	/**
	 * 按条件client_id 查询
	 */
	String DEFAULT_SELECT_STATEMENT = BASE_FIND_STATEMENT + " where client_id = ?";

	/***
	 * 资源服务器默认bean名称
	 */
	String RESOURCE_SERVER_CONFIGURER = "resourceServerConfigurerAdapter";

	/**
	 * 用户信息
	 */
	String DETAILS_USER = "user_info";

	/**
	 * 协议字段
	 */
	String DETAILS_LICENSE = "license";

	/**
	 * 客户端模式
	 */
	String CLIENT_CREDENTIALS = "client_credentials";

	/**
	 * 客户端ID
	 */
	String CLIENT_ID = "clientId";


	/**
	 * 验证码有效期,默认 60秒
	 */
	long CODE_TIME = 60;

	/**
	 * 验证码长度
	 */
	String CODE_SIZE = "6";

	String USER_ID = "user_id";
	String DEPT_ID = "dept_id";
	String DEPT_NAME = "dept_name";
	String TENANT_ID = "tenant_id";
	String DATA_SCOPE = "data_scope";

}
