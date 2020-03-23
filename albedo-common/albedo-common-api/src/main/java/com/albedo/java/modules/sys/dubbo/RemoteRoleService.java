package com.albedo.java.modules.sys.dubbo;

import java.util.Collection;

public interface RemoteRoleService {
	Collection<? extends String> findRoleDeptIdList(String id);
}
