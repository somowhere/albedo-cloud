/**
 * Copyright &copy; 2020 <a href="https://github.com/somowhere/albedo">albedo</a> All rights reserved.
 */
package com.albedo.java.modules.test.web;


import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.data.util.QueryWrapperUtil;
import com.albedo.java.common.log.annotation.Log;
import com.albedo.java.common.log.enums.BusinessType;
import com.albedo.java.common.web.resource.BaseResource;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.modules.test.domain.dto.TestBookDto;
import com.albedo.java.modules.test.domain.dto.TestBookQueryCriteria;
import com.albedo.java.modules.test.service.TestBookService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import lombok.AllArgsConstructor;

import javax.validation.Valid;
import java.util.Set;

/**
 * 测试书籍Controller 测试书籍
 * @author admin
 * @version 2020-06-07 12:26:34
 */
@RestController
@RequestMapping(value = "/test/test-book")
@AllArgsConstructor
public class TestBookResource extends BaseResource {

	private final TestBookService service;

	/**
	 * @param id
	 * @return
	 */
	@GetMapping(CommonConstants.URL_ID_REGEX)
	@PreAuthorize("@pms.hasPermission('test_testBook_view')")
	public Result get(@PathVariable String id) {
		log.debug("REST request to get Entity : {}", id);
		return  Result.buildOkData(service.getOneDto(id));
	}
	/**
	 * GET / : get all testBook.
	 *
	 * @param pm the pagination information
	 * @return the Result with status 200 (OK) and with body all testBook
	 */

	@PreAuthorize("@pms.hasPermission('test_testBook_view')")
	@GetMapping
	@Log(value = "测试书籍查看")
	public Result getPage(PageModel pm, TestBookQueryCriteria testBookQueryCriteria) {
		QueryWrapper wrapper = QueryWrapperUtil.getWrapper(pm, testBookQueryCriteria);
		return Result.buildOkData(service.page(pm, wrapper));
	}

	/**
	 * POST / : Save a testBookDto.
	 *
	 * @param testBookDto the HTTP testBook
	 */
	@PreAuthorize("@pms.hasPermission('test_testBook_edit')")
	@Log(value = "测试书籍编辑")
	@PostMapping
	public Result save(@Valid @RequestBody TestBookDto testBookDto) {
		log.debug("REST request to save TestBookDto : {}", testBookDto);
		service.saveOrUpdate(testBookDto);
		return Result.buildOk("保存测试书籍成功");

	}

	/**
	 * DELETE //:ids : delete the "ids" TestBook.
	 *
	 * @param ids the id of the testBook to delete
	 * @return the Result with status 200 (OK)
	 */
	@PreAuthorize("@pms.hasPermission('test_testBook_del')")
	@Log(value = "测试书籍删除")
	@DeleteMapping
	public Result delete(@RequestBody Set<String> ids) {
		log.debug("REST request to delete TestBook: {}", ids);
		service.removeByIds(ids);
		return Result.buildOk("删除测试书籍成功");
	}
}