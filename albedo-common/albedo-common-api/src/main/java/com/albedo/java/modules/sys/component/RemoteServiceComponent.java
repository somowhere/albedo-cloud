package com.albedo.java.modules.sys.component;


import com.albedo.java.modules.sys.dubbo.RemoteDictService;
import com.albedo.java.modules.sys.dubbo.RemoteTokenService;
import org.apache.dubbo.config.annotation.Reference;

public class RemoteServiceComponent {
	@Reference(check = false)
	private RemoteDictService remoteDictService;
	@Reference(check = false)
	private RemoteTokenService remoteTokenService;

	public RemoteDictService getRemoteDictService() {
		return remoteDictService;
	}

	public RemoteTokenService getRemoteTokenService() {
		return remoteTokenService;
	}
}
