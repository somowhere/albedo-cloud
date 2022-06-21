package com.albedo.java.modules.sys.web;

import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import com.albedo.java.common.core.config.ApplicationProperties;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.log.annotation.LogOperate;
import com.albedo.java.common.security.util.SecurityUtil;
import com.albedo.java.common.web.resource.BaseResource;
import com.albedo.java.modules.sys.domain.dto.UserEmailDto;
import com.albedo.java.modules.sys.domain.vo.account.PasswordChangeVo;
import com.albedo.java.modules.sys.domain.vo.account.PasswordRestVo;
import com.albedo.java.modules.sys.service.UserService;
import com.albedo.java.modules.tool.domain.vo.EmailVo;
import com.albedo.java.modules.tool.service.EmailService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 账户相关数据接口
 *
 * @author somewhere
 */
@RestController
@RequestMapping("/account")
@Slf4j
@AllArgsConstructor
public class AccoutResource extends BaseResource {

	private final UserService userService;
	private final ApplicationProperties applicationProperties;
	private final EmailService emailService;


	/**
	 * 修改密码
	 * POST  /account/changePassword : changes the current user's password
	 *
	 * @param passwordChangeVo the passwordVo
	 */
	@Operation(summary = "修改密码")
	@PostMapping(path = "/change-password")
	public Result changePassword(@Valid @RequestBody PasswordChangeVo passwordChangeVo) {
		// 密码解密
		RSA rsa = new RSA(applicationProperties.getRsa().getPrivateKey(), applicationProperties.getRsa().getPublicKey());
		String oldPass = new String(rsa.decrypt(passwordChangeVo.getOldPassword(), KeyType.PrivateKey));
		String newPass = new String(rsa.decrypt(passwordChangeVo.getNewPassword(), KeyType.PrivateKey));
		String confirmPass = new String(rsa.decrypt(passwordChangeVo.getConfirmPassword(), KeyType.PrivateKey));
		passwordChangeVo.setNewPassword(newPass);
		passwordChangeVo.setConfirmPassword(confirmPass);
		passwordChangeVo.setOldPassword(oldPass);
		userService.changePassword(SecurityUtil.getUser().getUsername(),
			passwordChangeVo);
		return Result.buildOk("密码修改成功，请重新登录");
	}

	@Operation(summary = "修改头像")
	@PostMapping(value = "/change-avatar")
	public Result<Object> updateAvatar(@RequestParam String avatar) {
		userService.updateAvatar(SecurityUtil.getUser().getUsername(), avatar);
		return Result.buildOk("头像修改成功");
	}

	@LogOperate("修改邮箱")
	@Operation(summary = "修改邮箱")
	@PostMapping(value = "/change-email/{code}")
	public ResponseEntity<Object> updateEmail(@PathVariable String code, @RequestBody UserEmailDto userEmailDto) {
		// 密码解密
		RSA rsa = new RSA(applicationProperties.getRsa().getPrivateKey(), applicationProperties.getRsa().getPublicKey());
		String password = new String(rsa.decrypt(userEmailDto.getPassword(), KeyType.PrivateKey));
		userEmailDto.setPassword(password);
		emailService.validated(CommonConstants.EMAIL_RESET_EMAIL_CODE + userEmailDto.getEmail(), code);
		userService.updateEmail(SecurityUtil.getUser().getUsername(), userEmailDto);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	/**
	 * 重置密码
	 *
	 * @param passwordRestVo
	 * @return
	 */
	@PostMapping("/reset/password")
	@Operation(summary = "重置密码")
	public Result resetPassword(@RequestBody @Valid PasswordRestVo passwordRestVo) {
		userService.resetPassword(passwordRestVo);
		return Result.buildOk("发送成功");
	}

	@PostMapping(value = "/reset/email-send")
	@Operation(summary = "重置邮箱，发送验证码")
	public Result<Object> resetEmail(@RequestParam String email) {
		EmailVo emailVo = emailService.sendEmail(email, CommonConstants.EMAIL_RESET_EMAIL_CODE);
		emailService.send(emailVo, emailService.find());
		return Result.buildOk("发送成功");
	}

	@PostMapping(value = "/reset/pass-send")
	@Operation(summary = "重置密码，发送验证码")
	public Result<Object> resetPass(@RequestParam String email) {
		EmailVo emailVo = emailService.sendEmail(email, CommonConstants.EMAIL_RESET_PWD_CODE);
		emailService.send(emailVo, emailService.find());
		return Result.buildOk("发送成功");
	}

	@GetMapping(value = "/validate-pass")
	@Operation(summary = "验证码验证重置密码")
	public Result<Object> validatedByPass(@RequestParam String email, @RequestParam String code) {
		emailService.validated(CommonConstants.EMAIL_RESET_PWD_CODE + email, code);
		return Result.buildOk("验证成功");
	}

	@GetMapping(value = "/validate-email")
	@Operation(summary = "验证码验证重置邮箱")
	public Result<Object> validatedByEmail(@RequestParam String email, @RequestParam String code) {
		emailService.validated(CommonConstants.EMAIL_RESET_EMAIL_CODE + email, code);
		return Result.buildOk("验证成功");
	}


}
