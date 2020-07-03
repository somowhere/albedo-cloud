package com.albedo.java.modules.sys.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.constant.ServiceNameConstants;
import com.albedo.java.modules.sys.domain.dto.GenSchemeDto;
import com.albedo.java.modules.sys.feign.factory.RemoteMenuServiceFallbackFactory;
import com.baomidou.mybatisplus.extension.api.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

/**
* @description
* @author somewhere
* @date 2020/6/1 11:10
*/
@FeignClient(contextId = "remoteMenuService", value = ServiceNameConstants.UMPS_SERVICE,
	fallbackFactory = RemoteMenuServiceFallbackFactory.class)
public interface RemoteMenuService {

	/**
	 * saveByGenScheme
	 * @author somewhere
	 * @param schemeDto
	 * @updateTime 2020/6/1 11:10
	 * @return boolean
	 */
	@PostMapping("/menu/save-gen-scheme")
	R<Boolean> saveByGenScheme(@RequestBody GenSchemeDto schemeDto, @RequestHeader(SecurityConstants.FROM) String from);

}
