package com.albedo.java.modules.gen.service.impl;

import com.albedo.java.common.persistence.service.impl.DataServiceImpl;
import com.albedo.java.modules.gen.domain.TableColumn;
import com.albedo.java.modules.gen.domain.dto.TableColumnDto;
import com.albedo.java.modules.gen.repository.TableColumnRepository;
import com.albedo.java.modules.gen.service.TableColumnService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Service class for managing tables.
 *
 * @author somewhere
 */
@Service
public class TableColumnServiceImpl extends
	DataServiceImpl<TableColumnRepository, TableColumn, TableColumnDto, String> implements TableColumnService {

	@Transactional(readOnly = true)
	List<TableColumn> findAllByGenTableIdOrderBySort(String id) {
		return list(Wrappers.<TableColumn>query().eq(TableColumn.F_SQL_GENTABLEID, id)
			.orderByAsc(TableColumn.F_SORT));
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteByTableId(String id) {
		List<TableColumn> tableColumnList = findAllByGenTableIdOrderBySort(id);
		Assert.notNull(tableColumnList, "id " + id + " tableColumn 不能为空");
		super.removeByIds(tableColumnList.stream().map(item -> item.getId()).collect(Collectors.toList()));

	}


}
