/**
 * Copyright &copy; 2020 <a href="https://github.com/somowhere/albedo">albedo</a> All rights reserved.
 */
package com.albedo.java.modules.test.service.impl;

import com.albedo.java.common.core.exception.EntityExistException;
import com.albedo.java.common.core.util.StringUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.albedo.java.common.persistence.service.impl.DataServiceImpl;
import com.albedo.java.modules.test.service.TestBookService;
import com.albedo.java.modules.test.domain.TestBook;
import com.albedo.java.modules.test.domain.dto.TestBookDto;
import com.albedo.java.modules.test.repository.TestBookRepository;

/**
 * 测试书籍ServiceImpl 测试书籍
 * @author admin
 * @version 2020-06-07 12:26:34
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class TestBookServiceImpl extends DataServiceImpl<TestBookRepository, TestBook, TestBookDto, String> implements TestBookService{
	@Override
	public void saveOrUpdate(TestBookDto testBookDto) {
																				super.saveOrUpdate(testBookDto);
	}

}