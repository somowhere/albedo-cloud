package com.albedo.java.common.security.service;

import cn.hutool.core.util.ArrayUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.sys.domain.vo.UserInfo;
import com.albedo.java.modules.sys.domain.vo.UserVo;
import org.springframework.core.Ordered;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * @author lengleng
 * @date 2021/12/21
 */
public interface AlbedoUserDetailsService extends UserDetailsService, Ordered {

	/**
	 * 是否支持此客户端校验
	 *
	 * @param clientId 目标客户端
	 * @return true/false
	 */
	default boolean support(String clientId, String grantType) {
		return true;
	}

	/**
	 * 排序值 默认取最大的
	 *
	 * @return 排序值
	 */
	default int getOrder() {
		return 0;
	}

	default UserDetails getUserDetails(Result<UserInfo> result) {
		return getUserDetails(result.getData());
	}

	/**
	 * 构建userdetails
	 *
	 * @param info 用户信息
	 * @return UserDetails
	 */
	default UserDetails getUserDetails(UserInfo info) {
		if (info == null || info == null) {
			throw new UsernameNotFoundException("用户不存在");
		}

		Set<String> dbAuthsSet = new HashSet<>();

		if (ArrayUtil.isNotEmpty(info.getRoles())) {
			// 获取角色
			Arrays.stream(info.getRoles()).forEach(role -> dbAuthsSet.add(SecurityConstants.ROLE + role));
			// 获取资源
			dbAuthsSet.addAll(Arrays.asList(info.getPermissions()));

		}

		Collection<GrantedAuthority> authorities = AuthorityUtils
			.createAuthorityList(dbAuthsSet.toArray(new String[0]));
		UserVo userVo = info.getUser();


		// 构造security用户
		return new UserDetail(userVo.getId(), userVo.getDeptId(), userVo.getDeptName(), userVo.getPhone(), userVo.getUsername(), SecurityConstants.BCRYPT + userVo.getPassword(),
			userVo.isAvailable(), true, true, true, authorities, info.getDataScope());
	}

	/**
	 * 通过用户实体查询
	 *
	 * @param userDetail
	 * @return
	 */
	default UserDetails loadUserByUser(UserDetail userDetail) {
		return this.loadUserByUsername(userDetail.getUsername());
	}

}
