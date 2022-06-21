package com.albedo.java.modules.sys.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Set;

/**
 * @author somewhere
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TokenDto implements Serializable {
	private Set<String> tokens;
	private Long userId;
}
