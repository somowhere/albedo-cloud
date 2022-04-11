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

package com.albedo.java.gateway.handler;

import com.albedo.java.common.core.config.ApplicationConfig;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.HandlerFunction;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Mono;

/**
 * @author somowhere
 * @date 2019/2/1
 * 验证码生成逻辑处理类
 */
@Slf4j
@AllArgsConstructor
public class AssetFileHandler implements HandlerFunction<ServerResponse> {

	@Override
	public Mono<ServerResponse> handle(ServerRequest serverRequest) {
		String pathUtl = ApplicationConfig.getStaticFileDirectory().replace("\\", "/");
		return ServerResponse
			.status(HttpStatus.OK)
			.contentType(MediaType.MULTIPART_FORM_DATA)
			.body(BodyInserters.fromResource(new FileSystemResource(pathUtl + serverRequest.uri().getPath().replace("/file", ""))));
	}
}
