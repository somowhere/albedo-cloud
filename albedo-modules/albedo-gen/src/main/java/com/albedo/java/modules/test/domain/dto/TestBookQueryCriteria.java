/**
 * Copyright &copy; 2020 <a href="https://github.com/somowhere/albedo">albedo</a> All rights reserved.
 */
package com.albedo.java.modules.test.domain.dto;

import com.albedo.java.common.core.annotation.Query;
import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.*;

/**
 * 测试书籍QueryCriteria 测试书籍
 * @author admin
 * @version 2020-06-07 12:26:34
 */
@Data
public class TestBookQueryCriteria implements Serializable {

	private static final long serialVersionUID = 1L;
	/** F_TITLE title_  :  标题 */
	@Query(propName = "title_", operator = Query.Operator.like)
	private String title;
	/** F_NAME name_  :  名称 */
	@Query(propName = "name_", operator = Query.Operator.like)
	private String name;

}