package com.albedo.java.modules.sys.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.constant.ServiceNameConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.feign.factory.RemoteDictServiceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

/**
* @description
* @author somewhere
* @date 2020/6/1 11:10
*/
@FeignClient(contextId = "remoteDictService", value = ServiceNameConstants.UMPS_SERVICE,
	fallbackFactory = RemoteDictServiceFallbackFactory.class)
public interface RemoteDictService {

	/**
	 * findAllOrderBySort
	 * @author somewhere
	 * @updateTime 2020/6/1 11:09
	 * @return java.lang.String
	 */
	@GetMapping("/dict/all")
	Result<String> findAllOrderBySort(@RequestHeader(SecurityConstants.FROM) String from);

}
