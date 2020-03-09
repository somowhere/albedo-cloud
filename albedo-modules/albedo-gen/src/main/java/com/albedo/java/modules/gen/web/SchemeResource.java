package com.albedo.java.modules.gen.web;

import cn.hutool.core.lang.Assert;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.util.ResultBuilder;
import com.albedo.java.common.core.util.StringUtil;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.log.annotation.Log;
import com.albedo.java.common.log.enums.BusinessType;
import com.albedo.java.common.security.util.SecurityUtil;
import com.albedo.java.common.web.resource.DataVoResource;
import com.albedo.java.modules.gen.domain.vo.GenCodeVo;
import com.albedo.java.modules.gen.domain.vo.SchemeDataVo;
import com.albedo.java.modules.gen.domain.vo.SchemeGenDataVo;
import com.albedo.java.modules.gen.service.SchemeService;
import com.google.common.collect.Lists;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

/**
 * 生成方案Controller
 *
 * @author somowhere
 */
@Controller
@RequestMapping(value = "/scheme")
public class SchemeResource extends DataVoResource<SchemeService, SchemeDataVo> {


	public SchemeResource(SchemeService schemeService) {
		super(schemeService);
	}

	/**
	 * @param pm
	 * @return
	 */
	@GetMapping(value = "/")
	@PreAuthorize("@pms.hasPermission('gen_scheme_view')")
	public ResponseEntity getPage(PageModel pm) {
		return ResultBuilder.buildOk(service.getSchemeVoPage(pm));
	}

	@GetMapping(value = "/preview" + CommonConstants.URL_ID_REGEX)
	@PreAuthorize("@pms.hasPermission('gen_scheme_view')")
	public ResponseEntity preview(@PathVariable String id) {
		String username = SecurityUtil.getUser().getUsername();
		Map<String, Object> formData = service.previewCode(id, username);
		return ResultBuilder.buildOkData(formData);
	}

	@GetMapping(value = "/form-data")
	@PreAuthorize("@pms.hasPermission('gen_scheme_view')")
	public ResponseEntity formData(SchemeDataVo schemeDataVo) {
		String username = SecurityUtil.getUser().getUsername();
		Map<String, Object> formData = service.findFormData(schemeDataVo, username);
		return ResultBuilder.buildOk(formData);
	}

	@Log(value = "生成方案", businessType = BusinessType.GENCODE)
	@PutMapping(value = "/gen-code")
	@PreAuthorize("@pms.hasPermission('gen_scheme_code')")
	public ResponseEntity genCode(@Valid @RequestBody GenCodeVo genCodeVo) {
		SchemeDataVo genSchemeDataVo = service.findOneVo(genCodeVo.getId());
		Assert.isTrue(genSchemeDataVo != null, "无法获取代码生成方案信息");
		genSchemeDataVo.setReplaceFile(genCodeVo.getReplaceFile());
		service.generateCode(genSchemeDataVo);
		return ResultBuilder.buildOk("生成", genSchemeDataVo.getName(), "代码成功");
	}

	@Log(value = "生成方案", businessType = BusinessType.EDIT)
	@PostMapping("/")
	@PreAuthorize("@pms.hasPermission('gen_scheme_edit')")
	public ResponseEntity save(@Valid @RequestBody SchemeDataVo schemeDataVo) {
		service.save(schemeDataVo);
		// 生成代码
		if (schemeDataVo.getGenCode()) {
			service.generateCode(schemeDataVo);
		}
		return ResultBuilder.buildOk("保存", schemeDataVo.getName(), "成功");
	}

	@Log(value = "生成方案", businessType = BusinessType.EDIT)
	@PostMapping("/gen-menu")
	@PreAuthorize("@pms.hasPermission('gen_scheme_menu')")
	public ResponseEntity genMenu(@Valid @RequestBody SchemeGenDataVo schemeGenDataVo) {
		SchemeDataVo schemeDataVo = service.genMenu(schemeGenDataVo);

		return ResultBuilder.buildOk("生成", schemeDataVo.getName(), "菜单成功");
	}


	@Log(value = "生成方案", businessType = BusinessType.DELETE)
	@DeleteMapping(CommonConstants.URL_IDS_REGEX)
	@PreAuthorize("@pms.hasPermission('gen_scheme_del')")
	public ResponseEntity delete(@PathVariable String ids) {
		log.debug("REST request to delete User: {}", ids);
		service.deleteBatchIds(Lists.newArrayList(ids.split(StringUtil.SPLIT_DEFAULT)));
		return ResultBuilder.buildOk("删除成功");
	}


}
