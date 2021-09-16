package com.albedo.java.modules.gen.service.impl;

import cn.hutool.core.util.CharUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.CollUtil;
import com.albedo.java.common.core.util.FreeMarkers;
import com.albedo.java.common.core.util.StringUtil;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.data.util.QueryWrapperUtil;
import com.albedo.java.common.persistence.service.impl.DataServiceImpl;
import com.albedo.java.modules.gen.domain.Scheme;
import com.albedo.java.modules.gen.domain.Table;
import com.albedo.java.modules.gen.domain.TableColumn;
import com.albedo.java.modules.gen.domain.dto.SchemeDto;
import com.albedo.java.modules.gen.domain.dto.SchemeGenDto;
import com.albedo.java.modules.gen.domain.dto.SchemeQueryCriteria;
import com.albedo.java.modules.gen.domain.dto.TableDto;
import com.albedo.java.modules.gen.domain.vo.SchemeFormDataVo;
import com.albedo.java.modules.gen.domain.vo.SchemeVo;
import com.albedo.java.modules.gen.domain.vo.TemplateVo;
import com.albedo.java.modules.gen.domain.xml.GenConfig;
import com.albedo.java.modules.gen.repository.SchemeRepository;
import com.albedo.java.modules.gen.repository.TableRepository;
import com.albedo.java.modules.gen.service.SchemeService;
import com.albedo.java.modules.gen.service.TableColumnService;
import com.albedo.java.modules.gen.service.TableService;
import com.albedo.java.modules.gen.util.GenUtil;
import com.albedo.java.modules.sys.domain.Dict;
import com.albedo.java.modules.sys.domain.dto.GenSchemeDto;
import com.albedo.java.modules.sys.feign.RemoteMenuService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Service class for managing schemes.
 *
 * @author somewhere
 */
@Service
@RequiredArgsConstructor
public class SchemeServiceImpl extends DataServiceImpl<SchemeRepository, Scheme, SchemeDto, String> implements SchemeService {

	private final TableRepository tableRepository;
	private final TableService tableService;
	private final TableColumnService tableColumnService;
	private final RemoteMenuService remoteMenuService;


	@Override
	@Transactional(readOnly = true)
	public List<Scheme> findAllListIdNot(String id) {
		return super.list(Wrappers.<Scheme>query().ne(Table.F_ID, id == null ? "-1" : id));
	}


	@Override
	@Transactional(readOnly = true)
	public String generateCode(SchemeDto schemeDto) {
		StringBuilder result = new StringBuilder();

		// 查询主表及字段列
		TableDto tableDto = tableService.getOneDto(schemeDto.getTableId());
		tableDto.setColumnList(tableColumnService.list(Wrappers.<TableColumn>query().eq(TableColumn.F_SQL_GENTABLEID,
				tableDto.getId()))
			.stream().map(item -> tableColumnService.copyBeanToDto(item)).collect(Collectors.toList())
		);
		Collections.sort(tableDto.getColumnList());

		// 获取所有代码模板
		GenConfig config = GenUtil.getConfig();

		// 获取模板列表
		List<TemplateVo> templateList = GenUtil.getTemplateList(config, schemeDto.getCategory(), false);
		List<TemplateVo> childTableTemplateList = GenUtil.getTemplateList(config, schemeDto.getCategory(), true);

		// 如果有子表模板，则需要获取子表列表
		if (childTableTemplateList.size() > 0) {
			tableDto.setChildList(tableRepository.selectList(Wrappers.<Table>lambdaQuery().eq(Table::getParentTable, tableDto.getId()))
				.stream().map(item -> tableService.copyBeanToDto(item)).collect(Collectors.toList()));
		}

		// 生成子表模板代码
		if (tableDto.getChildList() == null) {
			tableDto.setChildList(Lists.newArrayList());
		}
		for (TableDto childTable : tableDto.getChildList()) {
			Collections.sort(childTable.getColumnList());
			childTable.setCategory(schemeDto.getCategory());
			schemeDto.setTableDto(childTable);
			Map<String, Object> childTableModel = GenUtil.getDataModel(schemeDto);
			for (TemplateVo tpl : childTableTemplateList) {
				result.append(GenUtil.generateToFile(tpl, childTableModel, schemeDto.getReplaceFile()));
			}
		}
		tableDto.setCategory(schemeDto.getCategory());
		// 生成主表模板代码
		schemeDto.setTableDto(tableDto);
		Map<String, Object> model = GenUtil.getDataModel(schemeDto);
		for (TemplateVo tpl : templateList) {
			result.append(GenUtil.generateToFile(tpl, model, schemeDto.getReplaceFile()));
		}
		return result.toString();
	}

	@Override
	@Transactional(readOnly = true)
	public SchemeFormDataVo findFormData(SchemeDto schemeDto, String loginId) {
		SchemeFormDataVo schemeFormDataVo = new SchemeFormDataVo();

		if (StringUtil.isNotEmpty(schemeDto.getId())) {
			schemeDto = super.getOneDto(schemeDto.getId());
		}
		if (StringUtil.isBlank(schemeDto.getPackageName())) {
			schemeDto.setPackageName("com.albedo.java.modules");
		}
		if (StringUtil.isBlank(schemeDto.getFunctionAuthor())) {
			schemeDto.setFunctionAuthor(loginId);
		}
		schemeFormDataVo.setSchemeVo(schemeDto);
		GenConfig config = GenUtil.getConfig();
		schemeFormDataVo.setConfig(config);

		schemeFormDataVo.setCategoryList(CollUtil.convertSelectVoList(config.getCategoryList(), Dict.F_VAL, Dict.F_NAME));
		schemeFormDataVo.setViewTypeList(CollUtil.convertSelectVoList(config.getViewTypeList(), Dict.F_VAL, Dict.F_NAME));

		List<Table> tableList = tableService.list(), list = Lists.newArrayList();
		List<String> tableIds = Lists.newArrayList();
		if (StringUtil.isNotEmpty(schemeDto.getId())) {
			List<Scheme> schemeList = findAllListIdNot(schemeDto.getId());
			tableIds = CollUtil.extractToList(schemeList, "tableId");
		}
		for (Table table : tableList) {
			if (!tableIds.contains(table.getId())) {
				list.add(table);
			}
		}
		schemeFormDataVo.setTableList(CollUtil.convertSelectVoList(list, Table.F_ID, Table.F_NAMESANDTITLE));
		return schemeFormDataVo;
	}

	@Override
	@Transactional(readOnly = true)
	public IPage getSchemeVoPage(PageModel pm, SchemeQueryCriteria schemeQueryCriteria) {
		QueryWrapper wrapper = QueryWrapperUtil.getWrapper(pm, schemeQueryCriteria);
		wrapper.eq("a.del_flag", Scheme.FLAG_NORMAL);
		pm.addOrder(OrderItem.desc("a." + Scheme.F_SQL_CREATEDDATE));
		IPage<List<SchemeVo>> userVosPage = repository.getSchemeVoPage(pm, wrapper);
		return userVosPage;
	}


	@Override
	@Transactional(readOnly = true)
	public Map<String, Object> previewCode(String id, String username) {
		Map<String, Object> result = Maps.newHashMap();
		SchemeDto schemeDto = super.getOneDto(id);
		// 查询主表及字段列
		TableDto tableDto = tableService.getOneDto(schemeDto.getTableId());
		tableDto.setColumnList(tableColumnService.list(Wrappers.<TableColumn>query().eq(TableColumn.F_SQL_GENTABLEID,
				tableDto.getId()))
			.stream().map(item -> tableColumnService.copyBeanToDto(item)).collect(Collectors.toList())
		);
		Collections.sort(tableDto.getColumnList());

		// 获取所有代码模板
		GenConfig config = GenUtil.getConfig();

		// 获取模板列表
		List<TemplateVo> templateList = GenUtil.getTemplateList(config, schemeDto.getCategory(), false);
		List<TemplateVo> childTableTemplateList = GenUtil.getTemplateList(config, schemeDto.getCategory(), true);

		// 如果有子表模板，则需要获取子表列表
		if (childTableTemplateList.size() > 0) {
			tableDto.setChildList(tableRepository.selectList(Wrappers.<Table>lambdaQuery().eq(Table::getParentTable, tableDto.getId()))
				.stream().map(item -> tableService.copyBeanToDto(item)).collect(Collectors.toList()));
		}

		// 生成子表模板代码
		if (tableDto.getChildList() == null) {
			tableDto.setChildList(Lists.newArrayList());
		}
		for (TableDto childTable : tableDto.getChildList()) {
			Collections.sort(childTable.getColumnList());
			childTable.setCategory(schemeDto.getCategory());
			schemeDto.setTableDto(childTable);
			Map<String, Object> childTableModel = GenUtil.getDataModel(schemeDto);
			for (TemplateVo tpl : childTableTemplateList) {
				String content = FreeMarkers.renderString(StringUtil.trimToEmpty(tpl.getContent()), childTableModel);
				result.put(FreeMarkers.renderString(tpl.getFileName(), childTableModel), content);
			}
		}
		tableDto.setCategory(schemeDto.getCategory());
		// 生成主表模板代码
		schemeDto.setTableDto(tableDto);
		Map<String, Object> model = GenUtil.getDataModel(schemeDto);
		for (TemplateVo tpl : templateList) {
			String content = FreeMarkers.renderString(StringUtil.trimToEmpty(tpl.getContent()), model);
			result.put(FreeMarkers.renderString(tpl.getFileName(), model), content);
		}
		return result;


	}

	@Override
	public SchemeDto genMenu(SchemeGenDto schemeGenDataVo) {
		SchemeDto SchemeDto = super.getOneDto(schemeGenDataVo.getId());
		TableDto tableDataVo = SchemeDto.getTableDto();
		if (tableDataVo == null) {
			tableDataVo = tableService.getOneDto(SchemeDto.getTableId());
		}
		String url = StringUtil.toAppendStr("/", StringUtil.lowerCase(SchemeDto.getModuleName()), (StringUtil.isNotBlank(SchemeDto.getSubModuleName()) ? "/" + StringUtil.lowerCase(SchemeDto.getSubModuleName()) : ""), "/",
			StringUtil.toRevertCamelCase(StringUtil.lowerFirst(tableDataVo.getClassName()), CharUtil.DASHED), "/");
		remoteMenuService.saveByGenScheme(new GenSchemeDto(SchemeDto.getName(),
			schemeGenDataVo.getParentMenuId(), url, tableDataVo.getClassName()), SecurityConstants.FROM_IN);
		return SchemeDto;
	}

}
