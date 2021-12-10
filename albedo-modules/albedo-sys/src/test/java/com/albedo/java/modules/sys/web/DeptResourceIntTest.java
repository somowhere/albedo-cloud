package com.albedo.java.modules.sys.web;

import com.albedo.java.common.core.config.ApplicationProperties;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.feign.handle.GlobalBizExceptionHandler;
import com.albedo.java.modules.AlbedoSysApplication;
import com.albedo.java.modules.TestUtil;
import com.albedo.java.modules.sys.domain.Dept;
import com.albedo.java.modules.sys.domain.dto.DeptDto;
import com.albedo.java.modules.sys.service.DeptService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

import static com.albedo.java.modules.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the DeptResource REST web.
 *
 * @see DeptResource
 */
@SpringBootTest(classes = AlbedoSysApplication.class)
@Slf4j
public class DeptResourceIntTest {


	private static final String DEFAULT_ANOTHER_NAME = "ANOTHER_NAME";
	private static final String DEFAULT_NAME = "NAME1";
	private static final String UPDATED_NAME = "NAME2";
	private static final Long DEFAULT_ANOTHER_PARENTID = 22L;
	//    private static final String DEFAULT_PARENTID = "PARENTID1";
	private static final Long UPDATED_PARENTID = 33L;
	private static final Integer DEFAULT_SORT = 10;
	private static final Integer UPDATED_SORT = 20;
	private static final String DEFAULT_DESCRIPTION = "DESCRIPTION1";
	private static final String UPDATED_DESCRIPTION = "DESCRIPTION2";
	private String DEFAULT_API_URL;
	@Resource
	private DeptService deptService;

	private MockMvc restDeptMockMvc;
	@Resource
	private MappingJackson2HttpMessageConverter jacksonMessageConverter;
	@Resource
	private GlobalBizExceptionHandler globalExceptionHandler;
	@Resource
	private ApplicationProperties applicationProperties;

	private DeptDto dept;

	private DeptDto anotherDept = new DeptDto();

	@BeforeEach
	public void setup() {
		DEFAULT_API_URL = "/dept/";
		MockitoAnnotations.initMocks(this);
		final DeptResource deptResource = new DeptResource(deptService);
		this.restDeptMockMvc = MockMvcBuilders.standaloneSetup(deptResource)
			.setControllerAdvice(globalExceptionHandler)
			.setConversionService(createFormattingConversionService())
			.setMessageConverters(jacksonMessageConverter)
			.build();
	}

	/**
	 * Create a Dept.
	 * <p>
	 * This is a static method, as tests for other entities might also need it,
	 * if they test an domain which has a required relationship to the Dept domain.
	 */
	public DeptDto createEntity() {
		DeptDto dept = new DeptDto();
		dept.setName(DEFAULT_NAME);
		dept.setSort(DEFAULT_SORT);
		dept.setDescription(DEFAULT_DESCRIPTION);
		return dept;
	}

	@BeforeEach
	public void initTest() {
		dept = createEntity();
		// Initialize the database

		anotherDept.setName(DEFAULT_ANOTHER_NAME);
		anotherDept.setParentId(DEFAULT_ANOTHER_PARENTID);
		anotherDept.setSort(DEFAULT_SORT);
		anotherDept.setDescription(DEFAULT_DESCRIPTION);
		deptService.saveOrUpdate(anotherDept);

		dept.setParentId(anotherDept.getId());
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void createDept() throws Exception {
		List<Dept> databaseSizeBeforeCreate = deptService.list();

		// Create the Dept
		restDeptMockMvc.perform(post(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(dept)))
			.andExpect(status().isOk());

		// Validate the Dept in the database
		List<Dept> deptList = deptService.list();
		assertThat(deptList).hasSize(databaseSizeBeforeCreate.size() + 1);
		Dept testDept = deptService.getOne(Wrappers.<Dept>query().lambda()
			.eq(Dept::getName, dept.getName()));
		assertThat(testDept.getName()).isEqualTo(DEFAULT_NAME);
		assertThat(testDept.getSort()).isEqualTo(DEFAULT_SORT);
		assertThat(testDept.getParentId()).isEqualTo(anotherDept.getId());
		assertThat(testDept.getParentIds()).contains(anotherDept.getId().toString());
		assertThat(testDept.isLeaf()).isEqualTo(true);
		assertThat(testDept.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
		assertThat(testDept.getDelFlag()).isEqualTo(Dept.FLAG_NORMAL);
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getDept() throws Exception {
		// Initialize the database
		deptService.saveOrUpdate(dept);

		// Get the dept
		restDeptMockMvc.perform(get(DEFAULT_API_URL + "{id}", dept.getId()))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
			.andExpect(jsonPath("$.data.name").value(DEFAULT_NAME))
			.andExpect(jsonPath("$.data.parentId").value(anotherDept.getId()))
			.andExpect(jsonPath("$.data.description").value(DEFAULT_DESCRIPTION));
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getNonExistingDept() throws Exception {
		restDeptMockMvc.perform(get("/sys/dept/ddd/unknown"))
			.andExpect(status().isNotFound());
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void updateDept() throws Exception {
		// Initialize the database
		deptService.saveOrUpdate(dept);
		int databaseSizeBeforeUpdate = deptService.list().size();

		// Update the dept
		Dept updatedDept = deptService.getById(dept.getId());


		DeptDto managedDeptVM = new DeptDto();
		managedDeptVM.setName(UPDATED_NAME);
		managedDeptVM.setSort(UPDATED_SORT);
		managedDeptVM.setParentId(UPDATED_PARENTID);
		managedDeptVM.setDescription(UPDATED_DESCRIPTION);

		managedDeptVM.setId(updatedDept.getId());
		restDeptMockMvc.perform(post(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(managedDeptVM)))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.code").value(CommonConstants.SUCCESS));

		// Validate the Dept in the database
		List<Dept> deptList = deptService.list();
		assertThat(deptList).hasSize(databaseSizeBeforeUpdate);
		Dept testDept = deptService.getById(updatedDept.getId());
		assertThat(testDept.getName()).isEqualTo(UPDATED_NAME);
		assertThat(testDept.getSort()).isEqualTo(UPDATED_SORT);
		assertThat(testDept.getParentId()).isEqualTo(UPDATED_PARENTID);
//		assertThat(testDept.getParentIds()).contains(UPDATED_PARENTID);
		assertThat(testDept.isLeaf()).isEqualTo(true);
		assertThat(testDept.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
		assertThat(testDept.getDelFlag()).isEqualTo(Dept.FLAG_NORMAL);
	}


	@Test
	@Transactional(rollbackFor = Exception.class)
	public void deleteDept() throws Exception {
		// Initialize the database
		deptService.saveOrUpdate(dept);
		long databaseSizeBeforeDelete = deptService.count();

		// Delete the dept
		restDeptMockMvc.perform(delete(DEFAULT_API_URL + "{id}", dept.getId())
				.accept(TestUtil.APPLICATION_JSON_UTF8))
			.andExpect(status().isOk());

		// Validate the database is empty
		long databaseSizeAfterDelete = deptService.count();
		assertThat(databaseSizeAfterDelete == databaseSizeBeforeDelete - 1);
	}


}
