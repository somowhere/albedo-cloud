package com.albedo.java.modules.sys.dubbo;

import com.albedo.java.modules.sys.domain.dto.GenSchemeDto;

/**
* @description
* @author somewhere
* @date 2020/6/1 11:10
*/
public interface RemoteMenuService {

	/**
	 * saveByGenScheme
	 * @author somewhere
	 * @param schemeDto
	 * @updateTime 2020/6/1 11:10
	 * @return boolean
	 */
	boolean saveByGenScheme(GenSchemeDto schemeDto) throws IllegalArgumentException ;

}
