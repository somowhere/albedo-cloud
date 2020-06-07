package com.albedo.java.modules.sys.domain.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author somewhere
 * @description
 * @date 2020/5/30 11:24 下午
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GenSchemeDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private String schemeName;
	private String parentMenuId;
	private String url;
	private String className;

}
