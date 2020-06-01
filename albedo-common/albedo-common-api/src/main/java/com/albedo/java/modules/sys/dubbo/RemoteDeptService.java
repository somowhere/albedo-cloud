package com.albedo.java.modules.sys.dubbo;

import java.util.Collection;

/**
* @description
* @author somewhere
* @date 2020/6/1 11:10
*/
public interface RemoteDeptService {
	/**
	 * findDescendantIdList
	 * @author somewhere
	 * @param deptId
	 * @updateTime 2020/6/1 11:09
	 * @return java.util.Collection<? extends java.lang.String>
	 */
	Collection<? extends String> findDescendantIdList(String deptId);
}
