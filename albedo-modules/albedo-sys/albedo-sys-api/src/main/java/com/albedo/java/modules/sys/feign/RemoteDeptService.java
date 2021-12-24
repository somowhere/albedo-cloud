package com.albedo.java.modules.sys.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.constant.ServiceNameConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.feign.factory.RemoteDeptServiceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.List;

/**
 * @author somewhere
 * @description
 * @date 2020/6/1 11:10
 */
@FeignClient(contextId = "remoteDeptService", value = ServiceNameConstants.SYS_SERVICE,
	fallbackFactory = RemoteDeptServiceFallbackFactory.class)
public interface RemoteDeptService {
	/**
	 * findDescendantIdList
	 *
	 * @param deptId
	 * @return List<java.lang.String>
	 * @author somewhere
	 * @updateTime 2020/6/1 11:09
	 */
	@GetMapping("/dept/descendant-ids/{deptId}")
	Result<List<Long>> findDescendantIdList(@PathVariable("deptId") Long deptId, @RequestHeader(SecurityConstants.FROM) String from);
}
