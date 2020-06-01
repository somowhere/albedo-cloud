package com.albedo.java.modules.sys.dubbo;

import com.albedo.java.modules.sys.domain.Role;

import java.util.Collection;
import java.util.List;

/**
* @description
* @author somewhere
* @date 2020/6/1 11:18
*/
public interface RemoteRoleService {
	/**
	 * findDeptIdsByRoleId
	 * @author somewhere
	 * @param id
	 * @updateTime 2020/6/1 11:07
	 * @return java.util.Collection<? extends java.lang.String>
	 */
	Collection<? extends String> findDeptIdsByRoleId(String id);

	/**
	 * 通过部门ID，查询角色信息
	 *
	 * @param deptId
	 * @return
	 */
	List<Role> findListByDeptId(String deptId);

	/**
	 * 通过菜单ID，查询角色信息
	 *
	 * @param menuId
	 * @return
	 */
	List<Role> findListByMenuId(String menuId);
}
