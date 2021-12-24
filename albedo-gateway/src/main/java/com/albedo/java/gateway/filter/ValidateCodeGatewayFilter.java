/*
 *  Copyright (c) 2019-2020, somowhere (somewhere0813@gmail.com).
 *  <p>
 *  Licensed under the GNU Lesser General Public License 3.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  <p>
 * https://www.gnu.org/licenses/lgpl.html
 *  <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.albedo.java.gateway.filter;


import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.exception.ValidateCodeException;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.core.util.WebUtil;
import com.albedo.java.gateway.config.GatewayConfigProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.web.util.WebUtils;
import reactor.core.publisher.Mono;

/**
 * The type Validate code gateway filter.
 *
 * @author lengleng
 * @date 2018 /7/4 验证码处理
 */
@Slf4j
@RequiredArgsConstructor
public class ValidateCodeGatewayFilter extends AbstractGatewayFilterFactory<Object> {

	private final GatewayConfigProperties configProperties;

	private final ObjectMapper objectMapper;

	private final RedisTemplate<String, Object> redisTemplate;

	@Override
	public GatewayFilter apply(Object config) {
		return (exchange, chain) -> {
			ServerHttpRequest request = exchange.getRequest();
			boolean isAuthToken = CharSequenceUtil.containsAnyIgnoreCase(request.getURI().getPath(),
				SecurityConstants.OAUTH_TOKEN_URL);

			// 不是登录请求，直接向下执行
			if (!isAuthToken) {
				return chain.filter(exchange);
			}

			// 刷新token，手机号登录（也可以这里进行校验） 直接向下执行
			String grantType = request.getQueryParams().getFirst("grant_type");
			if (StrUtil.equals(SecurityConstants.REFRESH_TOKEN, grantType)) {
				return chain.filter(exchange);
			}

			boolean isIgnoreClient = configProperties.getIgnoreClients().contains(WebUtil.getClientId(request));
			try {
				// only oauth and the request not in ignore clients need check code.
				if (!isIgnoreClient) {
					checkCode(request);
				}
			}
			catch (Exception e) {
				ServerHttpResponse response = exchange.getResponse();
				response.setStatusCode(HttpStatus.PRECONDITION_REQUIRED);
				response.getHeaders().setContentType(MediaType.APPLICATION_JSON);

				final String errMsg = e.getMessage();
				return response.writeWith(Mono.create(monoSink -> {
					try {
						byte[] bytes = objectMapper.writeValueAsBytes(Result.buildFail(errMsg));
						DataBuffer dataBuffer = response.bufferFactory().wrap(bytes);

						monoSink.success(dataBuffer);
					}
					catch (JsonProcessingException jsonProcessingException) {
						log.error("对象输出异常", jsonProcessingException);
						monoSink.error(jsonProcessingException);
					}
				}));
			}

			return chain.filter(exchange);
		};
	}

	@SneakyThrows
	private void checkCode(ServerHttpRequest request) {
		String code = request.getQueryParams().getFirst("code");

		if (CharSequenceUtil.isBlank(code)) {
			throw new ValidateCodeException("验证码不能为空");
		}

		String randomStr = request.getQueryParams().getFirst("randomStr");
		if (CharSequenceUtil.isBlank(randomStr)) {
			randomStr = request.getQueryParams().getFirst("mobile");
		}

		String key = CommonConstants.DEFAULT_CODE_KEY + randomStr;

		Object codeObj = redisTemplate.opsForValue().get(key);


		if (ObjectUtil.isEmpty(codeObj) || !code.equals(codeObj)) {
			throw new ValidateCodeException("验证码不合法");
		}

		redisTemplate.delete(key);
	}

}
