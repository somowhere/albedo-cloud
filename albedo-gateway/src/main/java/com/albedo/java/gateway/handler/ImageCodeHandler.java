/*
 * Copyright (c) 2019-2022, somewhere (somewhere0813@gmail.com).
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

package com.albedo.java.gateway.handler;

import cn.hutool.json.JSONUtil;
import com.albedo.java.common.core.constant.CommonConstants;
import com.pig4cloud.captcha.ArithmeticCaptcha;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

import java.util.concurrent.TimeUnit;

/**
 * @author somewhere
 * @date 2018/7/5 验证码生成逻辑处理类
 */
@Slf4j
@AllArgsConstructor
public class ImageCodeHandler implements HandlerFunction<ServerResponse> {

	private static final Integer DEFAULT_IMAGE_WIDTH = 100;

	private static final Integer DEFAULT_IMAGE_HEIGHT = 40;

	private final RedisTemplate redisTemplate;

	@Override
	public Mono<ServerResponse> handle(ServerRequest serverRequest) {
		ArithmeticCaptcha captcha = new ArithmeticCaptcha(DEFAULT_IMAGE_WIDTH, DEFAULT_IMAGE_HEIGHT);

		String result = captcha.text();
		// 保存验证码信息
		String randomStr = serverRequest.queryParam("randomStr").get();

		redisTemplate.setKeySerializer(new StringRedisSerializer());
		redisTemplate.opsForValue().set(CommonConstants.DEFAULT_CODE_KEY + randomStr, result,
			CommonConstants.DEFAULT_IMAGE_EXPIRE, TimeUnit.SECONDS);

		// 转换流信息写出
		FastByteArrayOutputStream os = new FastByteArrayOutputStream();
		captcha.out(os);
		Mono<ServerResponse> body = ServerResponse.status(HttpStatus.OK).contentType(MediaType.IMAGE_JPEG)
			.body(BodyInserters.fromResource(new ByteArrayResource(os.toByteArray())));
		log.info("body {}", JSONUtil.toJsonStr(body));
		return body;
	}

}
