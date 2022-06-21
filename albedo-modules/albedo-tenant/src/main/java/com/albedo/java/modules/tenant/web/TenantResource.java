package com.albedo.java.modules.tenant.web;


import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.domain.vo.PageModel;
import com.albedo.java.common.core.util.Result;
import com.albedo.java.common.log.annotation.LogOperate;
import com.albedo.java.common.web.resource.BaseResource;
import com.albedo.java.modules.tenant.domain.TenantDo;
import com.albedo.java.modules.tenant.domain.dto.TenantConnectDto;
import com.albedo.java.modules.tenant.enumeration.TenantStatusEnum;
import com.albedo.java.modules.tenant.service.TenantService;
import com.albedo.java.plugins.database.mybatis.conditions.Wraps;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * 企业
 * <p>
 * 创建租户流程：
 * 1. COLUMN模式： 新增租户、初始化内置租户数据
 * 2. SCHEMA模式： 新增租户、初始化库、初始化表、初始化内置租户数据
 * 3. DATASOURCE模式
 * 该模式有2种动态创建租户数据源的方式
 * LOCAL: 租户数据源跟默认数据源在同一个 物理数据库   （启动时程序连192.168.1.1:3306/lamp_defaults库，租户连192.168.1.2:3306/lamp_base_xxx库）
 * REMOTE：租户数据源跟默认数据源不在同一个 物理数据库（启动时程序连192.168.1.1:3306/lamp_defaults库，租户连192.168.1.2:3306/lamp_base_xxx库）
 * <p>
 * LOCAL模式会自动使用程序默认库的账号，进行创建租户库操作，所以设置的账号密码必须拥有超级权限，但在程序中配置数据库的超级权限账号是比较危险的事，所以需要谨慎使用。
 * REMOTE模式 考虑到上述问题，决定让新增租户的管理员，手动创建好租户库后，提供账号密码连接信息等，配置到DatasourceConfig表，创建好租户后，在初始化数据源页面，
 * 选择已经创建好的数据源进行初始化操作。
 * <p>
 * 以上2种方式各有利弊，请大家酌情使用。 有更好的意见可以跟我讨论一下。
 * <p>
 * 先调用 POST /datasourceConfig 接口保存数据源
 * 在调用 POST /tenant 接口保存租户信息
 * 然后调用 POST /tenant/connect 接口为每个服务连接自己的数据源，并初始化表和数据
 *
 * @author zuihou
 * @date 2019-10-24
 */
@Slf4j
@Validated
@RestController
@RequestMapping("/tenant")
@Tag(name = "企业")
@AllArgsConstructor
public class TenantResource extends BaseResource {

	private final TenantService tenantService;

	/**
	 * @param id
	 * @return
	 */
	@GetMapping(CommonConstants.URL_ID_REGEX)
	@PreAuthorize("@pms.hasPermission('sys_user_view')")
	public Result get(@PathVariable Long id) {
		log.debug("REST request to get Entity : {}", id);
		return Result.buildOkData(tenantService.getOneDto(id));
	}

	/**
	 * 分页查询企业
	 *
	 * @param pm 参数集
	 * @return 用户集合
	 */
	@GetMapping
	@LogOperate(value = "企业管理查看")
	@PreAuthorize("@pms.hasPermission('sys_user_view')")
	public Result<IPage<TenantDo>> findPage(PageModel pm) {
		return Result.buildOkData(tenantService.page(pm));
	}

	@Operation(summary = "查询所有企业", description = "查询所有企业")
	@GetMapping("/all")
	public Result<List<TenantDo>> list() {
		return Result.buildOkData(tenantService.list(Wraps.<TenantDo>lbQ().eq(TenantDo::getStatus, TenantStatusEnum.NORMAL)));
	}

	@Operation(summary = "检测租户是否存在", description = "检测租户是否存在")
	@GetMapping("/check/{code}")
	public Result<Boolean> check(@PathVariable("code") String code) {
		return Result.buildOkData(tenantService.check(code));
	}

	@Operation(summary = "删除租户和基础租户数据，请谨慎操作")
	@DeleteMapping("/deleteAll")
	public Result<Boolean> deleteAll(@RequestBody List<Long> ids) {
		return Result.buildOkData(tenantService.deleteAll(ids));
	}

	@Operation(summary = "修改租户状态", description = "修改租户状态")
	@PostMapping("/status")
	public Result<Boolean> updateStatus(@RequestParam("ids[]") List<Long> ids,
										@RequestParam(defaultValue = "FORBIDDEN") @NotNull(message = "状态不能为空") TenantStatusEnum status) {
		return Result.buildOkData(tenantService.updateStatus(ids, status));
	}

	/**
	 * 初始化
	 */
	@Operation(summary = "连接数据源", description = "连接数据源")
	@PostMapping("/initConnect")
	public Result<Boolean> initConnect(@Validated @RequestBody TenantConnectDto tenantConnect) {
		return Result.buildOkData(tenantService.connect(tenantConnect));
	}
}
