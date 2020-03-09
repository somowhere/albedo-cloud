package com.albedo.java.modules.web.rest;

import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.exception.GlobalExceptionHandler;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.modules.AlbedoGenApplication;
import com.albedo.java.modules.gen.domain.Table;
import com.albedo.java.modules.gen.domain.vo.TableDataVo;
import com.albedo.java.modules.gen.service.impl.TableServiceImpl;
import com.albedo.java.modules.gen.web.TableResource;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;

import static com.albedo.java.modules.TestUtil.createFormattingConversionService;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the TableResource REST web.
 *
 * @see com.albedo.java.modules.gen.web.TableResource
 */
@SpringBootTest(classes = AlbedoGenApplication.class)
@Slf4j
public class TableResourceIntTest {


	private static final String DEFAULT_ANOTHER_USERNAME = "johndoeddd";
	private static final String DEFAULT_USERNAME = "johndoe";
	private static final String UPDATED_USERNAME = "jhipster";
	private static final String DEFAULT_PASSWORD = "passjohndoe";
	private static final String UPDATED_PASSWORD = "passjhipster";
	private static final String DEFAULT_PHONE = "13258812456";
	private static final String UPDATED_PHONE = "13222222222";
	private static final String DEFAULT_ANOTHER_EMAIL = "23423432@localhost";
	private static final String DEFAULT_EMAIL = "johndoe@localhost";
	private static final String UPDATED_EMAIL = "jhipster@localhost";
	private static final String DEFAULT_QQOPENID = "QQOPENID1";
	private static final String UPDATED_QQOPENID = "QQOPENID2";
	private static final String DEFAULT_LOCKFLAG = CommonConstants.STR_YES;
	private static final String UPDATED_LOCKFLAG = CommonConstants.STR_NO;
	TableDataVo anotherTable = new TableDataVo();
	private String DEFAULT_API_URL;
	@Autowired
	private TableServiceImpl tableServiceImpl;
	private MockMvc restTableMockMvc;
	@Autowired
	private MappingJackson2HttpMessageConverter jacksonMessageConverter;
	@Autowired
	private GlobalExceptionHandler globalExceptionHandler;
	private TableDataVo table;

	@BeforeEach
	public void setup() {
		DEFAULT_API_URL = "/table/";
		MockitoAnnotations.initMocks(this);
		final TableResource tableResource = new TableResource(tableServiceImpl);
		this.restTableMockMvc = MockMvcBuilders.standaloneSetup(tableResource)
			.setControllerAdvice(globalExceptionHandler)
			.setConversionService(createFormattingConversionService())
			.setMessageConverters(jacksonMessageConverter)
			.build();
	}

	@Test
	@Transactional
	public void getTablePage() throws Exception {
		// Initialize the database
//        tableService.save(table);
		// Get all the tables
		restTableMockMvc.perform(get(DEFAULT_API_URL)
			.param(PageModel.F_DESC, Table.F_SQL_CREATEDDATE)
			.accept(MediaType.APPLICATION_JSON))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
//			.andExpect(jsonPath("$.data").isNotEmpty())
//			.andExpect(jsonPath("$.data.records.[*].status").value(hasItem(DictUtil.getCode("sys_status", table.getStatus()))))
		;
	}


	@Test
	@Transactional
	public void getTableInfo() throws Exception {
		// Initialize the database
//		tableService.save(table);

		// Get the table
		restTableMockMvc.perform(get(DEFAULT_API_URL + "/table-list"))
			.andExpect(status().isOk())
			.andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
			.andExpect(jsonPath("$.data").isNotEmpty())
		;
	}


}
