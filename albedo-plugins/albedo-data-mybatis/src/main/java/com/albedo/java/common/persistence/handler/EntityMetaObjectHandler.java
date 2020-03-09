package com.albedo.java.common.persistence.handler;

import com.albedo.java.common.persistence.domain.DataEntity;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.data.domain.AuditorAware;
import org.springframework.util.Assert;

import java.time.LocalDateTime;

public class EntityMetaObjectHandler implements MetaObjectHandler {

	private final AuditorAware auditorAware;

	public EntityMetaObjectHandler(AuditorAware auditorAware) {
		Assert.isTrue(auditorAware != null, "auditorAware is not defined");
		this.auditorAware = auditorAware;
	}


	@Override
	public void insertFill(MetaObject metaObject) {
		setFieldValByName(DataEntity.F_CREATEDBY, auditorAware.getCurrentAuditor().get(), metaObject);
		LocalDateTime date = LocalDateTime.now();
		setFieldValByName(DataEntity.F_CREATEDDATE, date, metaObject);
		setFieldValByName(DataEntity.F_LASTMODIFIEDBY, auditorAware.getCurrentAuditor().get(), metaObject);
		setFieldValByName(DataEntity.F_LASTMODIFIEDDATE, date, metaObject);

	}

	@Override
	public void updateFill(MetaObject metaObject) {
		LocalDateTime date = LocalDateTime.now();
		setFieldValByName(DataEntity.F_LASTMODIFIEDBY, auditorAware.getCurrentAuditor().get(), metaObject);
		setFieldValByName(DataEntity.F_LASTMODIFIEDDATE, date, metaObject);
	}
}
