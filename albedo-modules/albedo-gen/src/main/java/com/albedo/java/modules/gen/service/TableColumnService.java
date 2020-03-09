package com.albedo.java.modules.gen.service;

import com.albedo.java.common.persistence.service.DataVoService;
import com.albedo.java.modules.gen.domain.TableColumn;
import com.albedo.java.modules.gen.domain.vo.TableColumnVo;
import com.albedo.java.modules.gen.repository.TableColumnRepository;

public interface TableColumnService extends DataVoService<TableColumnRepository, TableColumn, String, TableColumnVo> {
	void deleteByTableId(String id, String currentAuditor);
}
