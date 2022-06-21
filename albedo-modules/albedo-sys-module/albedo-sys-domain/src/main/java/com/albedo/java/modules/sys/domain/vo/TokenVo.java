package com.albedo.java.modules.sys.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.Instant;

/**
 * @author somewhere
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TokenVo implements Serializable {
	private String id;

	private Long userId;

	private String clientId;

	private String username;

	private String accessToken;

	private Instant issuedAt;

	private Instant expiresAt;
}
