package com.albedo.java.modules.sys.feign;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.constant.ServiceNameConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.feign.factory.RemoteRoleServiceFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.List;

/**
 * @author somewhere
 * @description
 * @date 2020/6/1 11:18
 */
@FeignClient(contextId = "remoteRoleService", value = ServiceNameConstants.UMPS_SERVICE,
	fallbackFactory = RemoteRoleServiceFallbackFactory.class)
public interface RemoteRoleService {
	/**
	 * findDescendantIdList
	 *
	 * @param roleId
	 * @return List<java.lang.String>
	 * @author somewhere
	 * @updateTime 2020/6/1 11:09
	 */
	@GetMapping("/role/dept-ids/{roleId}")
	Result<List<String>> findDeptIdsByRoleId(@PathVariable("roleId") String roleId, @RequestHeader(SecurityConstants.FROM) String from);

}
