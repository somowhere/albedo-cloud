package com.albedo.java.common.core.exception;
/**
 * @author somewhere
 * @date 2018-11-23
 */
public class FeignException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public FeignException(String message) {
		super(message);
	}

	public FeignException(Throwable cause) {
		super(cause);
	}

	public FeignException(String message, Throwable cause) {
		super(message, cause);
	}

	public FeignException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
