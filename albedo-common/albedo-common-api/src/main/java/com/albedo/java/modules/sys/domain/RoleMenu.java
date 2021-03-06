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

package com.albedo.java.modules.sys.domain;

import com.albedo.java.common.persistence.domain.GeneralEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 角色菜单表
 * </p>
 *
 * @author somowhere
 * @since 2019/2/1
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sys_role_menu")
public class RoleMenu extends GeneralEntity<RoleMenu> {

	private static final long serialVersionUID = 1L;

	/**
	 * 角色ID
	 */
	private String roleId;
	/**
	 * 菜单ID
	 */
	private String menuId;
}
