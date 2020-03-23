package com.albedo.java.modules.sys.dubbo;

import java.util.Collection;

public interface RemoteDeptService {
	Collection<? extends String> findDescendantIdList(String deptId);
}
