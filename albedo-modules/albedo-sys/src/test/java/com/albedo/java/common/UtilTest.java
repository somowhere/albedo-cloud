package com.albedo.java.common;


import com.albedo.java.common.core.util.Json;
import com.albedo.java.common.persistence.datascope.DataScope;
import com.google.common.collect.Sets;
import org.apache.commons.text.StringEscapeUtils;

public class UtilTest {
	public static void main(String[] args) {
		String rs = "Webhook \u7684 payload POST \u65f6\u5fc5\u987b\u662f JSON \u5b57\u7b26\u4e32";
		System.out.println(StringEscapeUtils.escapeHtml4(rs));


		DataScope dataScope = new DataScope();
		dataScope.setUserId("1");
		dataScope.setDeptIds(Sets.newLinkedHashSet());
		System.out.println(Json.toJsonString(dataScope));
	}
}
