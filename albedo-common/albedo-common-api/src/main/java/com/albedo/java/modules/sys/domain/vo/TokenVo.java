package com.albedo.java.modules.sys.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Set;

/**
 * @author Li Jie
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TokenVo implements Serializable {
	private Set<String> tokens;
	private String userId;
}
