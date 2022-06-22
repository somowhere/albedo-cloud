package com.albedo.java.modules.base;

import com.albedo.java.common.core.constant.CacheNameConstants;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.context.ContextUtil;
import com.albedo.java.common.security.service.AlbedoUserDetailsService;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.modules.AlbedoGenApplication;
import com.albedo.java.modules.sys.cache.DictCacheKeyBuilder;
import com.albedo.java.modules.sys.domain.DictDo;
import com.albedo.java.plugins.cache.repository.CacheOps;
import com.google.common.collect.Lists;
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
@SpringBootTest(classes = AlbedoGenApplication.class)
	public class SimulationRuntimeIntegrationTest {

		@Autowired
		public CacheOps cacheOps;

		@Autowired
		private AlbedoUserDetailsService albedoUserDetailsService;

		@BeforeEach
		public void initBeforeTest() {
			ContextUtil.setTenant(CommonConstants.TENANT_CODE_ADMIN);
			setAuth("admin");
			getDictList();
		}

		public void setAuth(String username) {
			UserDetails principal = new UserDetail(1l, 1l, "dept", "1325818654", "admin", SecurityConstants.BCRYPT + "password",
				true, true, true, true, Lists.newArrayList(), null);
			Authentication authentication = UsernamePasswordAuthenticationToken.authenticated(principal,
				principal.getPassword(), principal.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}

		public List<DictDo> getDictList() {
			return cacheOps.get(new DictCacheKeyBuilder().key(CacheNameConstants.DICT_ALL), (k) -> Lists.newArrayList());
		}

	}

