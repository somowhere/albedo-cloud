/*
 * Copyright (c) 2020 pig4cloud Authors. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.albedo.java.common.feign.handle;

import com.albedo.java.common.core.exception.BadRequestException;
import com.albedo.java.common.core.util.Json;
import com.albedo.java.common.core.exception.FeignBizException;
import com.albedo.java.common.core.util.Json;
import com.albedo.java.common.core.util.Result;
import com.alibaba.csp.sentinel.Tracer;
import feign.FeignException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.SpringSecurityMessageSource;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;

/**
 * <p>
 * 全局异常处理器结合sentinel 全局异常处理器不能作用在 oauth server https://gitee.com/log4j/pig/issues/I1M2TJ
 * </p>
 *
 * @author lengleng
 * @date 2020-06-29
 */
@Slf4j
@RestControllerAdvice
@ConditionalOnExpression("!'${security.oauth2.client.clientId}'.isEmpty()")
public class GlobalBizExceptionHandler {

	/**
	 * 全局异常.
	 *
	 * @param e the e
	 * @return Result
	 */
	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public Result handleGlobalException(Exception e) {
		log.error("全局异常信息 ex={}", e.getMessage(), e);

		// 业务异常交由 sentinel 记录
		Tracer.trace(e);
		return Result.buildFail(e.getLocalizedMessage());
	}

	/**
	 * FeignBizException
	 *
	 * @param e the e
	 * @return Result
	 */
	@ExceptionHandler(FeignBizException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public Result handleBizException(FeignBizException e) {
		log.warn("FeignBiz异常信息 ex={}", e.getMessage(), e);
		return Result.buildFail(e.getMessage());
	}

	/**
	 * FeignException.
	 *
	 * @param e the e
	 * @return Result
	 */
	@ExceptionHandler(FeignException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Result handleGlobalException(FeignException e) {
		log.warn("FeignException ex={}", e.getMessage());
		try {
			return Json.parseObject(e.contentUTF8(),Result.class);
		}catch (Exception ex) {
			return Result.buildFail("远程调用失败");
		}
	}

	/**
	 * FeignException.
	 *
	 * @param e the e
	 * @return Result
	 */
	@ExceptionHandler(BadRequestException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Result handleBadRequestException(BadRequestException e) {
		log.warn("BadRequestException ex={}", e.getMessage(), e);
		return Result.buildFail(e.getMessage());
	}

	/**
	 * AccessDeniedException
	 *
	 * @param e the e
	 * @return R
	 */
	@ExceptionHandler(AccessDeniedException.class)
	@ResponseStatus(HttpStatus.FORBIDDEN)
	public Result handleAccessDeniedException(AccessDeniedException e) {
		String msg = SpringSecurityMessageSource.getAccessor().getMessage("AbstractAccessDecisionManager.accessDenied",
			e.getMessage());
		log.error("拒绝授权异常信息 ex={}", msg, e);
		return Result.buildFail(e.getLocalizedMessage());
	}

	/**
	 * validation Exception
	 *
	 * @param exception
	 * @return R
	 */
	@ExceptionHandler({MethodArgumentNotValidException.class})
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Result handleBodyValidException(MethodArgumentNotValidException exception) {
		List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
		log.warn("参数绑定异常,ex = {}", fieldErrors.get(0).getDefaultMessage());
		return Result.buildFail(fieldErrors.get(0).getDefaultMessage());
	}

	/**
	 * validation Exception (以form-data形式传参)
	 *
	 * @param exception
	 * @return R
	 */
	@ExceptionHandler({BindException.class})
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public Result bindExceptionHandler(BindException exception) {
		List<FieldError> fieldErrors = exception.getBindingResult().getFieldErrors();
		log.warn("参数绑定异常,ex = {}", fieldErrors.get(0).getDefaultMessage());
		return Result.buildFail(fieldErrors.get(0).getDefaultMessage());
	}

}
