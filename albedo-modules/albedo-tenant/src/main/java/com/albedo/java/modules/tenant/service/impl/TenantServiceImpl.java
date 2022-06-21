package com.albedo.java.modules.tenant.service.impl;

import cn.hutool.core.convert.Convert;
import com.albedo.java.common.core.cache.model.CacheKey;
import com.albedo.java.common.core.cache.model.CacheKeyBuilder;
import com.albedo.java.common.core.util.BeanUtil;
import com.albedo.java.modules.file.service.AppendixService;
import com.albedo.java.modules.tenant.TenantCacheKeyBuilder;
import com.albedo.java.modules.tenant.TenantCodeCacheKeyBuilder;
import com.albedo.java.modules.tenant.domain.TenantDo;
import com.albedo.java.modules.tenant.domain.dto.TenantConnectDto;
import com.albedo.java.modules.tenant.domain.dto.TenantDto;
import com.albedo.java.modules.tenant.enumeration.TenantStatusEnum;
import com.albedo.java.modules.tenant.enumeration.TenantTypeEnum;
import com.albedo.java.modules.tenant.repository.TenantRepository;
import com.albedo.java.modules.tenant.service.TenantService;
import com.albedo.java.modules.tenant.strategy.InitSystemContext;
import com.albedo.java.plugins.database.mybatis.conditions.Wraps;
import com.albedo.java.plugins.database.mybatis.service.impl.DataCacheServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;
import java.util.function.Function;

/**
 * <p>
 * 业务实现类
 * 企业
 * </p>
 *
 * @author somewhere
 * @date 2019-10-24
 */
@Slf4j
@Service

@RequiredArgsConstructor
public class TenantServiceImpl extends DataCacheServiceImpl<TenantRepository, TenantDo, TenantDto> implements TenantService {

	private final InitSystemContext initSystemContext;
	private final AppendixService appendixService;

	@Override
	protected CacheKeyBuilder cacheKeyBuilder() {
		return new TenantCacheKeyBuilder();
	}


	/**
	 * tenant_name:{tenantCode} -> id 只存租户的id，然后根据id再次查询缓存，这样子的好处是，删除或者修改租户信息时，只需要根据id淘汰缓存即可
	 * 缺点就是 每次查询，需要多查一次缓存
	 *
	 * @param tenant
	 * @return
	 */
	@Override
	public TenantDo getByCode(String tenant) {
		Function<CacheKey, Object> loader = (k) ->
			getObj(Wraps.<TenantDo>lbQ().select(TenantDo::getId).eq(TenantDo::getCode, tenant), Convert::toLong);
		CacheKey cacheKey = new TenantCodeCacheKeyBuilder().key(tenant);
		return getByKey(cacheKey, loader);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void saveOrUpdate(TenantDto tenantDto) {
		// defaults 库
		Assert.isTrue(check(tenantDto.getCode()), "编码重复，请重新输入");
		TenantDo tenantDo = BeanUtil.toBean(tenantDto, TenantDo.class);
		if (tenantDto.getId() == null) {
			// 1， 保存租户 (默认库)
			tenantDo.setStatus(TenantStatusEnum.WAIT_INIT);
			tenantDo.setType(TenantTypeEnum.CREATE);
			// defaults 库
			save(tenantDo);
		} else {
			updateById(tenantDo);
		}

		appendixService.save(tenantDo.getId(), tenantDto.getLogos());

		CacheKey cacheKey = new TenantCodeCacheKeyBuilder().key(tenantDo.getCode());
		super.cacheOps.set(cacheKey, tenantDo.getId());
	}

	@Override
	public boolean check(String tenantCode) {
		return count(Wraps.<TenantDo>lbQ().eq(TenantDo::getCode, tenantCode)) < 1;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean connect(TenantConnectDto tenantConnect) {
		return initSystemContext.initConnect(tenantConnect) && updateTenantStatus(tenantConnect);
	}

	private Boolean updateTenantStatus(TenantConnectDto tenantConnect) {
		Boolean flag = this.update(Wraps.<TenantDo>lbU()
			.set(TenantDo::getStatus, TenantStatusEnum.NORMAL)
			.set(TenantDo::getConnectType, tenantConnect.getConnectType())
			.eq(TenantDo::getId, tenantConnect.getId()));
		delCache(tenantConnect.getId());
		return flag;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean delete(List<Long> ids) {
		List<String> tenantCodeList = listObjs(Wraps.<TenantDo>lbQ().select(TenantDo::getCode).in(TenantDo::getId, ids), Convert::toStr);
		if (tenantCodeList.isEmpty()) {
			return true;
		}
		appendixService.removeByBizId(ids);
		return removeByIds(ids);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean deleteAll(List<Long> ids) {
		List<String> tenantCodeList = listObjs(Wraps.<TenantDo>lbQ().select(TenantDo::getCode).in(TenantDo::getId, ids), Convert::toStr);
		if (tenantCodeList.isEmpty()) {
			return true;
		}
		appendixService.removeByBizId(ids);
		removeByIds(ids);
		return initSystemContext.delete(ids, tenantCodeList);
	}

	@Override
	public List<TenantDo> find() {
		return list(Wraps.<TenantDo>lbQ().eq(TenantDo::getStatus, TenantStatusEnum.NORMAL));
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean updateStatus(List<Long> ids, TenantStatusEnum status) {
		boolean update = super.update(Wraps.<TenantDo>lbU().set(TenantDo::getStatus, status)
			.in(TenantDo::getId, ids));

		delCache(ids);
		return update;
	}
}
