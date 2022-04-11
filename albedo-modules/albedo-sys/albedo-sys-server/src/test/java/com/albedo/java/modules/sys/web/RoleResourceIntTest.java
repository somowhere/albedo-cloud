package com.albedo.java.modules.sys.web;

import com.albedo.java.common.core.config.ApplicationProperties;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.util.CollUtil;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.feign.handle.GlobalExceptionHandler;
import com.albedo.java.modules.AlbedoSysServerApplication;
import com.albedo.java.modules.TestUtil;
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
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the RoleResource REST web.
 *
 * @see RoleResource
 */
@SpringBootTest(classes = AlbedoSysServerApplication.class)
@Slf4j
public class RoleResourceIntTest {


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

	private RoleDto roleDto;

	private RoleDto anotherRole = new RoleDto();

	@BeforeEach
	public void setup() {
		DEFAULT_API_URL = "/role/";
		MockitoAnnotations.initMocks(this);
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
		RoleDto roleDto = new RoleDto();
		roleDto.setName(DEFAULT_NAME);
		roleDto.setDataScope(DEFAULT_DATASCOPE);
		roleDto.setLevel(DEFAULT_LEVEL);
		roleDto.setDescription(DEFAULT_DESCRIPTION);
		return roleDto;
	}

	@BeforeEach
	public void initTest() {
		roleDto = createEntity();
		// Initialize the database
		List<Menu> allMenuEntities = menuService.list();
		List<Dept> allDept = deptService.list();
		anotherRole.setName(DEFAULT_ANOTHER_NAME);
		anotherRole.setDataScope(DEFAULT_DATASCOPE);
		anotherRole.setLevel(DEFAULT_LEVEL);
		anotherRole.setDescription(DEFAULT_DESCRIPTION);
		anotherRole.setMenuIdList(CollUtil.extractToList(allMenuEntities, Menu.F_ID));
		anotherRole.setDeptIdList(CollUtil.extractToList(allDept, Menu.F_ID));
		roleService.saveOrUpdate(anotherRole);
		roleDto.setMenuIdList(anotherRole.getMenuIdList());
		roleDto.setDeptIdList(anotherRole.getDeptIdList());
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void createRole() throws Exception {
		List<Role> databaseSizeBeforeCreate = roleService.list();

		// Create the Role
		restRoleMockMvc.perform(post(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(roleDto)))
			.andExpect(status().isOk());

		// Validate the Role in the database
		List<Role> roleList = roleService.list();
		assertThat(roleList).hasSize(databaseSizeBeforeCreate.size() + 1);
		Role testRole = roleService.getOne(Wrappers.<Role>query().lambda()
			.eq(Role::getName, roleDto.getName()));
		assertThat(testRole.getName()).isEqualTo(DEFAULT_NAME);
		assertThat(testRole.getLevel()).isEqualTo(DEFAULT_LEVEL);
		assertThat(testRole.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
		assertThat(testRole.getDelFlag()).isEqualTo(Role.FLAG_NORMAL);
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getRolePage() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(roleDto);
		// Get all the roles
		restRoleMockMvc.perform(get(DEFAULT_API_URL)
				.param(PageModel.F_DESC, Role.F_SQL_CREATED_DATE)
				.accept(MediaType.APPLICATION_JSON))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
			.andExpect(jsonPath("$.data.records.[*].name").value(hasItem(DEFAULT_NAME)))
			.andExpect(jsonPath("$.data.records.[*].code").value(hasItem(DEFAULT_CODE)))
			.andExpect(jsonPath("$.data.records.[*].remark").value(hasItem(DEFAULT_LEVEL)))
			.andExpect(jsonPath("$.data.records.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
		;
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void getRole() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(roleDto);

		// Get the role
		restRoleMockMvc.perform(get(DEFAULT_API_URL + "{id}", roleDto.getId()))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
			.andExpect(jsonPath("$.data.name").value(DEFAULT_NAME))
			.andExpect(jsonPath("$.data.code").value(DEFAULT_CODE))
			.andExpect(jsonPath("$.data.remark").value(DEFAULT_LEVEL))
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
		roleService.saveOrUpdate(roleDto);
		int databaseSizeBeforeUpdate = roleService.list().size();

		// Update the role
		Role updatedRole = roleService.getById(roleDto.getId());


		RoleDto managedRoleVM = new RoleDto();
		managedRoleVM.setName(UPDATED_NAME);
		managedRoleVM.setLevel(UPDATED_LEVEL);
		managedRoleVM.setDataScope(UPDATED_DATASCOPE);
		managedRoleVM.setDescription(UPDATED_DESCRIPTION);
		managedRoleVM.setMenuIdList(Lists.newArrayList(anotherRole.getMenuIdList().get(0)));
		managedRoleVM.setDeptIdList(Lists.newArrayList(anotherRole.getDeptIdList().get(0)));
		managedRoleVM.setId(updatedRole.getId());
		restRoleMockMvc.perform(post(DEFAULT_API_URL)
				.contentType(TestUtil.APPLICATION_JSON_UTF8)
				.content(TestUtil.convertObjectToJsonBytes(managedRoleVM)))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.code").value(CommonConstants.SUCCESS));

		// Validate the Role in the database
		List<Role> roleList = roleService.list();
		assertThat(roleList).hasSize(databaseSizeBeforeUpdate);
		Role testRole = roleService.getById(updatedRole.getId());
		List<RoleMenu> listRoleMenuEntities = roleMenuService.list(Wrappers.<RoleMenu>query().lambda()
			.eq(RoleMenu::getRoleId, testRole.getId()));
		assertThat(listRoleMenuEntities.size()).isEqualTo(1);
		assertThat(listRoleMenuEntities.get(0).getMenuId()).isEqualTo(anotherRole.getMenuIdList().get(0));
		List<RoleDept> listRoleDept = roleDeptService.list(Wrappers.<RoleDept>query().lambda()
			.eq(RoleDept::getRoleId, testRole.getId()));
		assertThat(listRoleDept.size()).isEqualTo(1);
		assertThat(listRoleDept.get(0).getDeptId()).isEqualTo(anotherRole.getDeptIdList().get(0));
		assertThat(testRole.getName()).isEqualTo(UPDATED_NAME);
//		assertThat(testRole.getParentIds()).contains(UPDATED_PARENTID);
		assertThat(testRole.getLevel()).isEqualTo(UPDATED_LEVEL);
		assertThat(testRole.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
		assertThat(testRole.getDelFlag()).isEqualTo(Role.FLAG_NORMAL);
	}

	@Test
	@Transactional(rollbackFor = Exception.class)
	public void deleteRole() throws Exception {
		// Initialize the database
		roleService.saveOrUpdate(roleDto);
		long databaseSizeBeforeDelete = roleService.count();

		// Delete the role
		restRoleMockMvc.perform(delete(DEFAULT_API_URL + "{id}", roleDto.getId())
				.accept(TestUtil.APPLICATION_JSON_UTF8))
			.andExpect(status().isOk());

		// Validate the database is empty
		long databaseSizeAfterDelete = roleService.count();
		assertThat(databaseSizeAfterDelete == databaseSizeBeforeDelete - 1);
	}

}
