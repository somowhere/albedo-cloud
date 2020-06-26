package com.albedo.java.modules.sys.component;


import com.albedo.java.modules.sys.dubbo.*;
import lombok.Getter;
import org.apache.dubbo.config.annotation.Reference;

@Getter
public class RemoteServiceComponent {
	@Reference(check = false)
	private RemoteDictService remoteDictService;
	@Reference(check = false)
	private RemoteDeptService remoteDeptService;
	@Reference(check = false)
	private RemoteLogOperateService remoteLogOperateService;
	@Reference(check = false)
	private RemoteMenuService remoteMenuService;
	@Reference(check = false)
	private RemoteRoleService remoteRoleService;
	@Reference(check = false)
	private RemoteUserService remoteUserService;

}
