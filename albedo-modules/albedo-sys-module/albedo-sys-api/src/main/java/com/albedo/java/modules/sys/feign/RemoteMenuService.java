package com.albedo.java.modules.sys.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.constant.ServiceNameConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.domain.dto.GenSchemeDto;
import com.albedo.java.modules.sys.feign.factory.RemoteMenuServiceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * @author somewhere
 * @description
 * @date 2020/6/1 11:10
 */
@FeignClient(contextId = "remoteMenuService", value = ServiceNameConstants.SYS_SERVICE,
	fallbackFactory = RemoteMenuServiceFallbackFactory.class)
public interface RemoteMenuService {

	/**
	 * saveByGenScheme
	 *
	 * @param schemeDto
	 * @return boolean
	 * @author somewhere
	 * @updateTime 2020/6/1 11:10
	 */
	@PostMapping("/menu/save-gen-scheme")
	Result<Boolean> saveByGenScheme(@RequestBody GenSchemeDto schemeDto, @RequestHeader(SecurityConstants.FROM) String from);

}
