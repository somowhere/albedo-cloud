/*
 *  Copyright 2019-2020 somewhere
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.albedo.java.modules.tool.web;

import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.log.annotation.LogOperate;
import com.albedo.java.modules.tool.domain.EmailConfig;
import com.albedo.java.modules.tool.domain.vo.EmailVo;
import com.albedo.java.modules.tool.service.EmailService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 发送邮件
 *
 * @author 郑杰
 * @date 2018/09/28 6:55:53
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/email")
@Tag(name = "工具：邮件管理")
public class EmailResource {

	private final EmailService emailService;

	@GetMapping
	public Result<EmailConfig> get() {
		return Result.buildOkData(emailService.find());
	}

	@LogOperate("配置邮件")
	@PutMapping
	@Operation(summary = "配置邮件")
	public Result updateConfig(@Validated @RequestBody EmailConfig emailConfig) throws Exception {
		emailService.config(emailConfig, emailService.find());
		return Result.buildOk("操作成功");
	}

	@LogOperate("发送邮件")
	@PostMapping
	@Operation(summary = "发送邮件")
	public Result send(@Validated @RequestBody EmailVo emailVo) {
		emailService.send(emailVo, emailService.find());
		return Result.buildOk("发送成功");
	}

	@PostMapping("/send")
	public Result sendInner(@Validated @RequestBody EmailVo emailVo) {
		emailService.send(emailVo, emailService.find());
		return Result.buildOk("发送成功");
	}
}
