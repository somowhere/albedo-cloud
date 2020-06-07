/**
 * Copyright &copy; 2020 <a href="https://github.com/somowhere/albedo">albedo</a> All rights reserved.
 */
package com.albedo.java.modules.test.web;

import cn.hutool.core.date.DateField;
import com.albedo.java.common.core.config.ApplicationProperties;
import com.albedo.java.common.core.exception.handler.GlobalExceptionHandler;
import com.albedo.java.common.core.util.ClassUtil;
import com.albedo.java.common.core.util.DateUtil;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.modules.TestUtil;
import com.albedo.java.modules.test.domain.TestBook;
import com.albedo.java.modules.test.domain.dto.TestBookDto;
import com.albedo.java.modules.test.domain.dto.TestBookQueryCriteria;
import com.albedo.java.modules.test.repository.TestBookRepository;
import com.albedo.java.modules.test.service.TestBookService;
import com.albedo.java.modules.test.web.TestBookResource;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
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

import java.util.Date;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the TestBookResource REST controller.
 *
 * @see TestBookResource
 */
@SpringBootTest(classes = com.albedo.java.modules.AlbedoGenApplication.class)
@Slf4j
public class TestBookResourceIntTest {

    private String DEFAULT_API_URL;
	/** DEFAULT_TITLE title_  :  标题 */
	private static final String DEFAULT_TITLE = "A";
	/** UPDATED_TITLE title_  :  标题 */
    private static final String UPDATED_TITLE = "B";
	/** DEFAULT_AUTHOR author_  :  作者 */
	private static final String DEFAULT_AUTHOR = "A";
	/** UPDATED_AUTHOR author_  :  作者 */
    private static final String UPDATED_AUTHOR = "B";
	/** DEFAULT_NAME name_  :  名称 */
	private static final String DEFAULT_NAME = "A";
	/** UPDATED_NAME name_  :  名称 */
    private static final String UPDATED_NAME = "B";
	/** DEFAULT_EMAIL email_  :  邮箱 */
	private static final String DEFAULT_EMAIL = "1@albedo.com";
	/** UPDATED_EMAIL email_  :  邮箱 */
    private static final String UPDATED_EMAIL = "2@albedo.com";
	/** DEFAULT_PHONE phone_  :  手机 */
	private static final String DEFAULT_PHONE = "A";
	/** UPDATED_PHONE phone_  :  手机 */
    private static final String UPDATED_PHONE = "B";
	/** DEFAULT_ACTIVATED activated_  :  activated_ */
	private static final int DEFAULT_ACTIVATED = 0;
	/** UPDATED_ACTIVATED activated_  :  activated_ */
    private static final int UPDATED_ACTIVATED = 1;
	/** DEFAULT_NUMBER number_  :  key */
	private static final Long DEFAULT_NUMBER = 0l;
	/** UPDATED_NUMBER number_  :  key */
    private static final Long UPDATED_NUMBER = 1l;
	/** DEFAULT_MONEY money_  :  money_ */
	private static final double DEFAULT_MONEY = 0;
	/** UPDATED_MONEY money_  :  money_ */
    private static final double UPDATED_MONEY = 1;
	/** DEFAULT_AMOUNT amount_  :  amount_ */
	private static final double DEFAULT_AMOUNT = 0;
	/** UPDATED_AMOUNT amount_  :  amount_ */
    private static final double UPDATED_AMOUNT = 1;
	/** DEFAULT_RESETDATE reset_date  :  reset_date */
	private static final Date DEFAULT_RESETDATE = DateUtil.parse(DateUtil.format(new Date(),DateUtil.TIME_FORMAT),DateUtil.TIME_FORMAT).toJdkDate();
	/** UPDATED_RESETDATE reset_date  :  reset_date */
    private static final Date UPDATED_RESETDATE = DateUtil.offset(DEFAULT_RESETDATE, DateField.DAY_OF_YEAR, 1);
	/** DEFAULT_DESCRIPTION description  :  备注 */
	private static final String DEFAULT_DESCRIPTION = "A";
	/** UPDATED_DESCRIPTION description  :  备注 */
    private static final String UPDATED_DESCRIPTION = "B";

    @Autowired
	private TestBookService testBookService;

	private MockMvc restTestBookMockMvc;
	@Autowired
	private MappingJackson2HttpMessageConverter jacksonMessageConverter;
	@Autowired
	private GlobalExceptionHandler globalExceptionHandler;
	@Autowired
	private ApplicationProperties applicationProperties;

	private TestBookDto testBookDto;

	private TestBookDto anotherTestBookDto = new TestBookDto();
	@BeforeEach
	public void setup() {
		DEFAULT_API_URL = "/test/test-book/";
		MockitoAnnotations.initMocks(this);
		final TestBookResource testBookResource = new TestBookResource(testBookService);
		this.restTestBookMockMvc = MockMvcBuilders.standaloneSetup(testBookResource)
			.setControllerAdvice(globalExceptionHandler)
			.setConversionService(TestUtil.createFormattingConversionService())
			.setMessageConverters(jacksonMessageConverter)
			.build();
	}

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static TestBookDto createEntity() {
        TestBookDto testBookDto = ClassUtil.createObj(TestBookDto.class, Lists.newArrayList(
		 TestBookDto.F_TITLE
		,TestBookDto.F_AUTHOR
		,TestBookDto.F_NAME
		,TestBookDto.F_EMAIL
		,TestBookDto.F_PHONE
		,TestBookDto.F_ACTIVATED
		,TestBookDto.F_NUMBER
		,TestBookDto.F_MONEY
		,TestBookDto.F_AMOUNT
		,TestBookDto.F_RESETDATE
		,TestBookDto.F_DESCRIPTION
        ),

         DEFAULT_TITLE

        ,DEFAULT_AUTHOR

        ,DEFAULT_NAME

        ,DEFAULT_EMAIL

        ,DEFAULT_PHONE

        ,DEFAULT_ACTIVATED

        ,DEFAULT_NUMBER

        ,DEFAULT_MONEY

        ,DEFAULT_AMOUNT

        ,DEFAULT_RESETDATE





        ,DEFAULT_DESCRIPTION


        	);
        return testBookDto;
    }

    @BeforeEach
    public void initTest() {
        testBookDto = createEntity();
    }

    @Test
    @Transactional
    public void createTestBook() throws Exception {
        int databaseSizeBeforeCreate = testBookService.list().size();
        // Create the TestBook
        restTestBookMockMvc.perform(post(DEFAULT_API_URL)
			.param(PageModel.F_DESC, TestBook.F_SQL_CREATEDDATE)
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(testBookDto)))
            .andExpect(status().isOk());
        ;
        // Validate the TestBook in the database
        List<TestBook> testBookList = testBookService.list(
            Wrappers.<TestBook>query().lambda().orderByAsc(
				TestBook::getCreatedDate
			)
        );
        assertThat(testBookList).hasSize(databaseSizeBeforeCreate + 1);
        TestBook testTestBook = testBookList.get(testBookList.size() - 1);
		assertThat(testTestBook.getTitle()).isEqualTo(DEFAULT_TITLE);
		assertThat(testTestBook.getAuthor()).isEqualTo(DEFAULT_AUTHOR);
		assertThat(testTestBook.getName()).isEqualTo(DEFAULT_NAME);
		assertThat(testTestBook.getEmail()).isEqualTo(DEFAULT_EMAIL);
		assertThat(testTestBook.getPhone()).isEqualTo(DEFAULT_PHONE);
		assertThat(testTestBook.getActivated()).isEqualTo(DEFAULT_ACTIVATED);
		assertThat(testTestBook.getNumber()).isEqualTo(DEFAULT_NUMBER);
		assertThat(testTestBook.getMoney()).isEqualTo(DEFAULT_MONEY);
		assertThat(testTestBook.getAmount()).isEqualTo(DEFAULT_AMOUNT);
		assertThat(testTestBook.getResetDate()).isEqualTo(DEFAULT_RESETDATE);
		assertThat(testTestBook.getDescription()).isEqualTo(DEFAULT_DESCRIPTION);
    }

    @Test
    @Transactional
    public void checkAuthorIsRequired() throws Exception {
        int databaseSizeBeforeTest = testBookService.list().size();
        // set the field null
        testBookDto.setAuthor(null);

        // Create the TestBook, which fails.

        restTestBookMockMvc.perform(post(DEFAULT_API_URL)
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(testBookDto)))
            .andExpect(status().isBadRequest());

        List<TestBook> testBookList = testBookService.list();
        assertThat(testBookList).hasSize(databaseSizeBeforeTest);
    }
    @Test
    @Transactional
    public void checkActivatedIsRequired() throws Exception {
        int databaseSizeBeforeTest = testBookService.list().size();
        // set the field null
        testBookDto.setActivated(null);

        // Create the TestBook, which fails.

        restTestBookMockMvc.perform(post(DEFAULT_API_URL)
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(testBookDto)))
            .andExpect(status().isBadRequest());

        List<TestBook> testBookList = testBookService.list();
        assertThat(testBookList).hasSize(databaseSizeBeforeTest);
    }


    @Test
    @Transactional
    public void getAllTestBooks() throws Exception {
        // Initialize the database
        testBookService.saveOrUpdate(testBookDto);

        // Get all the testBookList
        restTestBookMockMvc.perform(get(DEFAULT_API_URL))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.data.records.[*].id").value(hasItem(testBookDto.getId())))
                .andExpect(jsonPath("$.data.records.[*].title").value(hasItem(DEFAULT_TITLE)))
                    .andExpect(jsonPath("$.data.records.[*].name").value(hasItem(DEFAULT_NAME)))
                .andExpect(jsonPath("$.data.records.[*].email").value(hasItem(DEFAULT_EMAIL)))
                .andExpect(jsonPath("$.data.records.[*].phone").value(hasItem(DEFAULT_PHONE)))
                    .andExpect(jsonPath("$.data.records.[*].number").value(hasItem(DEFAULT_NUMBER.intValue())))
                .andExpect(jsonPath("$.data.records.[*].money").value(hasItem(DEFAULT_MONEY)))
                .andExpect(jsonPath("$.data.records.[*].amount").value(hasItem(DEFAULT_AMOUNT)))
                .andExpect(jsonPath("$.data.records.[*].resetDate").value(hasItem(DateUtil.formatDateTime(DEFAULT_RESETDATE))))
                                .andExpect(jsonPath("$.data.records.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
            ;
    }

    @Test
    @Transactional
    public void getTestBook() throws Exception {
        // Initialize the database
        testBookService.saveOrUpdate(testBookDto);

        // Get the testBook
        restTestBookMockMvc.perform(get(DEFAULT_API_URL+"{id}", testBookDto.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.data.id").value(testBookDto.getId()))
                .andExpect(jsonPath("$.data.title").value(DEFAULT_TITLE))
                    .andExpect(jsonPath("$.data.name").value(DEFAULT_NAME))
                .andExpect(jsonPath("$.data.email").value(DEFAULT_EMAIL))
                .andExpect(jsonPath("$.data.phone").value(DEFAULT_PHONE))
                    .andExpect(jsonPath("$.data.number").value(DEFAULT_NUMBER))
                .andExpect(jsonPath("$.data.money").value(DEFAULT_MONEY))
                .andExpect(jsonPath("$.data.amount").value(DEFAULT_AMOUNT))
                .andExpect(jsonPath("$.data.resetDate").value(DateUtil.formatDateTime(DEFAULT_RESETDATE)))
                                .andExpect(jsonPath("$.data.description").value(DEFAULT_DESCRIPTION))
            ;
    }
    @Test
    @Transactional
    public void getAllTestBooksByTitleSearch() throws Exception {
        // Initialize the database
        testBookService.saveOrUpdate(testBookDto);

		TestBookQueryCriteria testBookQueryCriteria = new TestBookQueryCriteria();
		testBookQueryCriteria.setTitle(DEFAULT_TITLE);
        // Get all the testBookList where title equals to DEFAULT_TITLE
        defaultTestBookShouldBeFound(testBookQueryCriteria);

		testBookQueryCriteria.setTitle(UPDATED_TITLE);
        // Get all the testBookList where title equals to UPDATED_TITLE
        defaultTestBookShouldNotBeFound(testBookQueryCriteria);
    }
    @Test
    @Transactional
    public void getAllTestBooksByNameSearch() throws Exception {
        // Initialize the database
        testBookService.saveOrUpdate(testBookDto);

		TestBookQueryCriteria testBookQueryCriteria = new TestBookQueryCriteria();
		testBookQueryCriteria.setName(DEFAULT_NAME);
        // Get all the testBookList where name equals to DEFAULT_NAME
        defaultTestBookShouldBeFound(testBookQueryCriteria);

		testBookQueryCriteria.setName(UPDATED_NAME);
        // Get all the testBookList where name equals to UPDATED_NAME
        defaultTestBookShouldNotBeFound(testBookQueryCriteria);
    }

    /**
     * Executes the search, and checks that the default entity is returned
     */
    private void defaultTestBookShouldBeFound(TestBookQueryCriteria testBookQueryCriteria) throws Exception {
		restTestBookMockMvc.perform(get(DEFAULT_API_URL+"?"+TestUtil.convertObjectToUrlParams(testBookQueryCriteria)))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.data.records").isArray())
            .andExpect(jsonPath("$.data.records.[*].id").value(hasItem(testBookDto.getId())))
                .andExpect(jsonPath("$.data.records.[*].title").value(hasItem(DEFAULT_TITLE)))
                    .andExpect(jsonPath("$.data.records.[*].name").value(hasItem(DEFAULT_NAME)))
                .andExpect(jsonPath("$.data.records.[*].email").value(hasItem(DEFAULT_EMAIL)))
                .andExpect(jsonPath("$.data.records.[*].phone").value(hasItem(DEFAULT_PHONE)))
                    .andExpect(jsonPath("$.data.records.[*].number").value(hasItem(DEFAULT_NUMBER.intValue())))
                .andExpect(jsonPath("$.data.records.[*].money").value(hasItem(DEFAULT_MONEY)))
                .andExpect(jsonPath("$.data.records.[*].amount").value(hasItem(DEFAULT_AMOUNT)))
                .andExpect(jsonPath("$.data.records.[*].resetDate").value(hasItem(DateUtil.formatDateTime(DEFAULT_RESETDATE))))
                                .andExpect(jsonPath("$.data.records.[*].description").value(hasItem(DEFAULT_DESCRIPTION)))
            ;
    }

    /**
     * Executes the search, and checks that the default entity is not returned
     */
    private void defaultTestBookShouldNotBeFound(TestBookQueryCriteria testBookQueryCriteria) throws Exception {
		restTestBookMockMvc.perform(get(DEFAULT_API_URL+"?"+TestUtil.convertObjectToUrlParams(testBookQueryCriteria)))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.data.records").isArray())
            .andExpect(jsonPath("$.data.records").isEmpty());
    }


    @Test
    @Transactional
    public void getNonExistingTestBook() throws Exception {
        // Get the testBook
        restTestBookMockMvc.perform(get(DEFAULT_API_URL+"{id}", Long.MAX_VALUE))
            .andExpect(status().isOk())
			.andExpect(jsonPath("$.data").isEmpty());
    }

    @Test
    @Transactional
    public void updateTestBook() throws Exception {
        // Initialize the database
        testBookService.saveOrUpdate(testBookDto);

        int databaseSizeBeforeUpdate = testBookService.list().size();

        // Update the testBook
        TestBook updatedTestBook = testBookService.getById(testBookDto.getId());
        // Disconnect from session so that the updates on updatedTestBook are not directly saved in db
        ClassUtil.updateObj(updatedTestBook, Lists.newArrayList(
		 TestBook.F_TITLE
		,TestBook.F_AUTHOR
		,TestBook.F_NAME
		,TestBook.F_EMAIL
		,TestBook.F_PHONE
		,TestBook.F_ACTIVATED
		,TestBook.F_NUMBER
		,TestBook.F_MONEY
		,TestBook.F_AMOUNT
		,TestBook.F_RESETDATE
		,TestBook.F_DESCRIPTION
        ),

		 UPDATED_TITLE

		,UPDATED_AUTHOR

		,UPDATED_NAME

		,UPDATED_EMAIL

		,UPDATED_PHONE

		,UPDATED_ACTIVATED

		,UPDATED_NUMBER

		,UPDATED_MONEY

		,UPDATED_AMOUNT

		,UPDATED_RESETDATE





		,UPDATED_DESCRIPTION


	);

        TestBookDto testBookVo = testBookService.copyBeanToDto(updatedTestBook);
        restTestBookMockMvc.perform(post(DEFAULT_API_URL)
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(testBookVo)))
            .andExpect(status().isOk());

        // Validate the TestBook in the database
        List<TestBook> testBookList = testBookService.list();
        assertThat(testBookList).hasSize(databaseSizeBeforeUpdate);

        TestBook testTestBook = testBookList.stream().filter(item->testBookDto.getId().equals(item.getId())).findAny().get();
		assertThat(testTestBook.getTitle()).isEqualTo(UPDATED_TITLE);
		assertThat(testTestBook.getAuthor()).isEqualTo(UPDATED_AUTHOR);
		assertThat(testTestBook.getName()).isEqualTo(UPDATED_NAME);
		assertThat(testTestBook.getEmail()).isEqualTo(UPDATED_EMAIL);
		assertThat(testTestBook.getPhone()).isEqualTo(UPDATED_PHONE);
		assertThat(testTestBook.getActivated()).isEqualTo(UPDATED_ACTIVATED);
		assertThat(testTestBook.getNumber()).isEqualTo(UPDATED_NUMBER);
		assertThat(testTestBook.getMoney()).isEqualTo(UPDATED_MONEY);
		assertThat(testTestBook.getAmount()).isEqualTo(UPDATED_AMOUNT);
		assertThat(testTestBook.getResetDate()).isEqualTo(UPDATED_RESETDATE);
		assertThat(testTestBook.getDescription()).isEqualTo(UPDATED_DESCRIPTION);
    }


    @Test
    @Transactional
    public void deleteTestBook() throws Exception {
        // Initialize the database
        testBookService.saveOrUpdate(testBookDto);
        int databaseSizeBeforeDelete = testBookService.list().size();

        // Get the testBook
        restTestBookMockMvc.perform(delete(DEFAULT_API_URL)
			.contentType(TestUtil.APPLICATION_JSON_UTF8)
			.content(TestUtil.convertObjectToJsonBytes(Lists.newArrayList(testBookDto.getId())))
            .accept(TestUtil.APPLICATION_JSON_UTF8))
            .andExpect(status().isOk());

        // Validate the database is empty
        List<TestBook> testBookList = testBookService.list();
        assertThat(testBookList).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(TestBook.class);
        TestBook testBook1 = new TestBook();
        testBook1.setId("id1");
        TestBook testBook2 = new TestBook();
        testBook2.setId(testBook1.getId());
        assertThat(testBook1).isEqualTo(testBook2);
        testBook2.setId("id2");
        assertThat(testBook1).isNotEqualTo(testBook2);
        testBook1.setId(null);
        assertThat(testBook1).isNotEqualTo(testBook2);
    }

}
