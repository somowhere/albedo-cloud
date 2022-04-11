package com.albedo.java.modules.sys.web;

import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.security.annotation.Inner;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.domain.vo.UserVo;
import com.albedo.java.modules.sys.service.AppService;
import com.albedo.java.modules.sys.service.UserService;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author somewhere
 * @date 2021/9/16 移动端登录
 */
@RestController
@AllArgsConstructor
@RequestMapping("/app")
@Api(value = "app", tags = "手机管理模块")
public class AppController {

	private final AppService appService;

	private final UserService userService;

	@Inner(value = false)
	@GetMapping("/{mobile}")
	public Result sendSmsCode(@PathVariable String mobile) {
		return appService.sendSmsCode(mobile);
	}

	/**
	 * 获取指定用户全部信息
	 *
	 * @param phone 手机号
	 * @return 用户信息
	 */
	@Inner
	@GetMapping("/info/{phone}")
	public Result infoByMobile(@PathVariable String phone) {
		User user = userService.getOne(Wrappers.<User>query().lambda().eq(User::getPhone, phone));
		if (user == null) {
			return Result.buildFail(String.format("用户信息为空 %s", phone));
		}
		UserVo userVo = userService.findVoByUsername(user.getUsername());
		if (userVo == null) {
			return Result.buildFail(String.format("用户信息为空 %s", user.getUsername()));
		}
		return Result.buildOkData(userService.getInfo(userVo));
	}

}
