package com.albedo.java.modules.base;

import com.albedo.java.common.core.constant.CacheNameConstants;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.context.ContextUtil;
import com.albedo.java.common.security.service.AlbedoUserDetailsService;
import com.albedo.java.modules.AlbedoSysApplication;
import com.albedo.java.modules.sys.cache.DictCacheKeyBuilder;
import com.albedo.java.modules.sys.domain.DictDo;
import com.albedo.java.modules.sys.service.DictService;
import com.albedo.java.modules.sys.service.UserService;
import com.albedo.java.plugins.cache.repository.CacheOps;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

@Slf4j
@SpringBootTest(classes = AlbedoSysApplication.class)
public class SimulationRuntimeIntegrationTest {

	@Autowired
	public CacheOps cacheOps;

	@Autowired
	private DictService dictService;
	@Autowired
	private UserService userService;

	@Autowired
	private AlbedoUserDetailsService albedoUserDetailsService;

	@BeforeEach
	public void initBeforeTest() {
		ContextUtil.setTenant(CommonConstants.TENANT_CODE_ADMIN);
		setAuth("admin");
		getDictList();
	}

	public void setAuth(String username) {
		UserDetails principal = albedoUserDetailsService.getUserDetails(userService.getInfo(userService.findVoByUsername(username)));
		Authentication authentication = UsernamePasswordAuthenticationToken.authenticated(principal,
			principal.getPassword(), principal.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}

	public List<DictDo> getDictList() {
		return cacheOps.get(new DictCacheKeyBuilder().key(CacheNameConstants.DICT_ALL), (k) -> dictService.findAllOrderBySort());
	}

}
