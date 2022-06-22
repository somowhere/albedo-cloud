package com.albedo.java.modules.sys.web;

import com.albedo.java.common.core.config.ApplicationProperties;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.domain.vo.PageModel;
import com.albedo.java.common.core.util.CollUtil;
import com.albedo.java.common.core.exception.handler.GlobalExceptionHandler;
import com.albedo.java.modules.TestUtil;
import com.albedo.java.modules.base.SimulationRuntimeIntegrationTest;
import com.albedo.java.modules.sys.domain.*;
import com.albedo.java.modules.sys.domain.dto.RoleDto;
import com.albedo.java.modules.sys.domain.enums.DataScopeType;
import com.albedo.java.modules.sys.service.*;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

import static com.albedo.java.modules.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the RoleResource REST web.
 *
 * @see RoleResource
 */
@Slf4j
public class RoleResourceIntTest extends SimulationRuntimeIntegrationTest {


	private static final String DEFAULT_ANOTHER_NAME = "ANOTHER_NAME";
	private static final String DEFAULT_NAME = "NAME1";
	private static final String UPDATED_NAME = "NAME2";
	private static final String DEFAULT_ANOTHER_CODE = "ANOTHER_CODE";
	private static final String DEFAULT_CODE = "CODE1";
	private static final String UPDATED_CODE = "CODE2";
	private static final Integer DEFAULT_AVAILABLE = CommonConstants.YES;
	private static final Integer UPDATED_AVAILABLE = CommonConstants.NO;
	private static final DataScopeType DEFAULT_DATASCOPE = DataScopeType.ALL;
	private static final DataScopeType UPDATED_DATASCOPE = DataScopeType.CUSTOMIZE;
	private static final Integer DEFAULT_LEVEL = 1;
	private static final Integer UPDATED_LEVEL = 2;
	private static final String DEFAULT_DESCRIPTION = "DESCRIPTION1";
	private static final String UPDATED_DESCRIPTION = "DESCRIPTION2";
	private String DEFAULT_API_URL;
	@Resource
	private RoleService roleService;
	@Resource
	private UserService userService;
	@Resource
	private MenuService menuService;
	@Resource
	private DeptService deptService;
	@Resource
	private RoleMenuService roleMenuService;
	@Resource
	private RoleDeptService roleDeptService;

	private MockMvc restRoleMockMvc;
	@Resource
	private MappingJackson2HttpMessageConverter jacksonMessageConverter;
	@Resource
	private GlobalExceptionHandler globalExceptionHandler;
	@Resource
	private ApplicationProperties applicationProperties;

	private RoleDto role;

	private RoleDto anotherRole = new RoleDto();

	@BeforeEach
	public void setup() {
		DEFAULT_API_URL = "/role/";
		MockitoAnnotations.openMocks(this);
		final RoleResource roleResource = new RoleResource(roleService, roleMenuService, userService);
		this.restRoleMockMvc = MockMvcBuilders.standaloneSetup(roleResource)
			.setControllerAdvice(globalExceptionHandler)
			.setConversionService(createFormattingConversionService())
			.setMessageConverters(jacksonMessageConverter)
			.build();
	}

	/**
	 * Create a Role.
	 * <p>
	 * This is a static method, as tests for other entities might also need it,
	 * if they test an domain which has a required relationship to the Role domain.
	 */
	public RoleDto createEntity() {
		RoleDto role = new RoleDto();
		role.setName(DEFAULT_NAME);
		role.setDataScope(DEFAULT_DATASCOPE);
		role.setCode(DEFAULT_CODE);
		role.setLevel(DEFAULT_LEVEL);
		role.setDescription(DEFAULT_DESCRIPTION);
		return role;
	}

	@BeforeEach
	public void initTest() {
		role = createEntity();
		// Initialize the database
		List<MenuDo> allMenuEntityDos = menuService.list();
		List<DeptDo> allDeptDo = deptService.list();
		anotherRole.setName(DEFAULT_ANOTHER_NAME);
		anotherRole.setDataScope(DEFAULT_DATASCOPE);
		anotherRole.setCode(DEFAULT_ANOTHER_CODE);
		anotherRole.setLevel(DEFAULT_LEVEL);
		anotherRole.setDescription(DEFAULT_DESCRIPTION);
		anotherRole.setMenuIdList(CollUtil.extractToList(allMenuEntityDos, MenuDo.F_ID));
		anotherRole.setDeptIdList(CollUtil.extractToList(allDeptDo, MenuDo.F_ID));
		roleService.saveOrUpdate(anotherRole);
		role.setMenuIdList(anotherRole.getMenuIdList());
		role.setDeptIdList(anotherRole.getDeptIdList());
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void createRole() throws Exception {
		List<RoleDo> databaseSizeBeforeCreate = roleService.list();

		// Create the Role
		restRoleMockMvc.perform(post(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(role)))
			.andExpect(status().isOk());

		// Validate the Role in the database
		List<RoleDo> roleList = roleService.list();
		assertThat(roleList).hasSize(databaseSizeBeforeCreate.size() + 1);
		RoleDo testRoleDoDo = roleService.getOne(Wrappers.<RoleDo>query().lambda()
			.eq(RoleDo::getName, role.getName()));
		assertThat(testRoleDoDo.getName()).isEqualTo(DEFAULT_NAME);
		assertThat(testRoleDoDo.getLevel()).isEqualTo(DEFAULT_LEVEL);
		assertThat(testRoleDoDo.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
		assertThat(testRoleDoDo.getDelFlag()).isEqualTo(RoleDo.FLAG_NORMAL);
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getRolePage() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(role);
		// Get all the roles
		restRoleMockMvc.perform(get(DEFAULT_API_URL)
				.param(PageModel.F_DESC, RoleDo.F_SQL_CREATED_DATE)
				.accept(MediaType.APPLICATION_JSON))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
			.andExpect(jsonPath("$.data.records.[*].name").value(hasItem(DEFAULT_NAME)))
			.andExpect(jsonPath("$.data.records.[*].code").value(hasItem(DEFAULT_CODE)))
			.andExpect(jsonPath("$.data.records.[*].level").value(hasItem(DEFAULT_LEVEL)))
			.andExpect(jsonPath("$.data.records.[*].description").value(hasItem(DEFAULT_DESCRIPTION)));
		;
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getRole() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(role);

		// Get the role
		restRoleMockMvc.perform(get(DEFAULT_API_URL + "{id}", role.getId()))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
			.andExpect(jsonPath("$.data.name").value(DEFAULT_NAME))
			.andExpect(jsonPath("$.data.code").value(DEFAULT_CODE))
			.andExpect(jsonPath("$.data.level").value(DEFAULT_LEVEL))
			.andExpect(jsonPath("$.data.description").value(DEFAULT_DESCRIPTION));
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getNonExistingRole() throws Exception {
		restRoleMockMvc.perform(get("/sys/role/ddd/unknown"))
			.andExpect(status().isNotFound());
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void updateRole() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(role);
		int databaseSizeBeforeUpdate = roleService.list().size();

		// Update the role
		RoleDo updatedRoleDo = roleService.getById(role.getId());


		RoleDto managedRoleVM = new RoleDto();
		managedRoleVM.setName(UPDATED_NAME);
		managedRoleVM.setLevel(UPDATED_LEVEL);
		managedRoleVM.setCode(UPDATED_CODE);
		managedRoleVM.setDataScope(UPDATED_DATASCOPE);
		managedRoleVM.setDescription(UPDATED_DESCRIPTION);
		managedRoleVM.setMenuIdList(Lists.newArrayList(anotherRole.getMenuIdList().get(0)));
		managedRoleVM.setDeptIdList(Lists.newArrayList(anotherRole.getDeptIdList().get(0)));
		managedRoleVM.setId(updatedRoleDo.getId());
		restRoleMockMvc.perform(post(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(managedRoleVM)))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.code").value(CommonConstants.SUCCESS));

		// Validate the Role in the database
		List<RoleDo> roleList = roleService.list();
		assertThat(roleList).hasSize(databaseSizeBeforeUpdate);
		RoleDo testRoleDoDo = roleService.getById(updatedRoleDo.getId());
		List<RoleMenuDo> listRoleMenuDoEntities = roleMenuService.list(Wrappers.<RoleMenuDo>query().lambda()
			.eq(RoleMenuDo::getRoleId, testRoleDoDo.getId()));
		assertThat(listRoleMenuDoEntities.size()).isEqualTo(1);
		assertThat(listRoleMenuDoEntities.get(0).getMenuId()).isEqualTo(anotherRole.getMenuIdList().get(0));
		List<RoleDeptDo> listRoleDeptDo = roleDeptService.list(Wrappers.<RoleDeptDo>query().lambda()
			.eq(RoleDeptDo::getRoleId, testRoleDoDo.getId()));
		assertThat(listRoleDeptDo.size()).isEqualTo(1);
		assertThat(listRoleDeptDo.get(0).getDeptId()).isEqualTo(anotherRole.getDeptIdList().get(0));
		assertThat(testRoleDoDo.getName()).isEqualTo(UPDATED_NAME);
//		assertThat(testRoleDoDo.getParentIds()).contains(UPDATED_PARENT_ID);
		assertThat(testRoleDoDo.getLevel()).isEqualTo(UPDATED_LEVEL);
		assertThat(testRoleDoDo.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
		assertThat(testRoleDoDo.getDelFlag()).isEqualTo(RoleDo.FLAG_NORMAL);
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void deleteRole() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(role);
		long databaseSizeBeforeDelete = roleService.count();

		// Delete the role
		restRoleMockMvc.perform(delete(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(Lists.newArrayList(role.getId())))
				.accept(TestUtil.APPLICATION_JSON_UTF8))
			.andExpect(status().isOk());

		// Validate the database is empty
		long databaseSizeAfterDelete = roleService.count();
		assertThat(databaseSizeAfterDelete == databaseSizeBeforeDelete - 1);
	}

}
