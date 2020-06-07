/**
 * Copyright &copy; 2020 <a href="https://github.com/somowhere/albedo">albedo</a> All rights reserved.
 */
package com.albedo.java.modules.test.service;

import com.albedo.java.common.persistence.service.DataService;
import com.albedo.java.modules.test.domain.TestBook;
import com.albedo.java.modules.test.domain.dto.TestBookDto;

/**
 * 测试书籍Service 测试书籍
 * @author admin
 * @version 2020-06-07 12:26:34
 */
public interface TestBookService extends DataService<TestBook, TestBookDto, String>{

}