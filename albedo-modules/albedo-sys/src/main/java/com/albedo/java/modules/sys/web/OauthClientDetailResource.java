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

package com.albedo.java.modules.sys.web;

import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.util.R;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.log.annotation.Log;
import com.albedo.java.common.log.enums.BusinessType;
import com.albedo.java.modules.sys.domain.OauthClientDetail;
import com.albedo.java.modules.sys.service.OauthClientDetailService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author somowhere
 * @since 2018-05-15
 */
@RestController
@AllArgsConstructor
@RequestMapping("/client")
public class OauthClientDetailResource {
	private final OauthClientDetailService oauthClientDetailService;

	/**
	 * 通过ID查询
	 *
	 * @param id ID
	 * @return OauthClientDetail
	 */
	@GetMapping(CommonConstants.URL_ID_REGEX)
	@PreAuthorize("@pms.hasPermission('sys_client_view')")
	public R getById(@PathVariable String id) {
		return new R<>(oauthClientDetailService.getById(id));
	}


	/**
	 * 简单分页查询
	 *
	 * @param pm 分页对象
	 * @return
	 */
	@GetMapping("/")
	@PreAuthorize("@pms.hasPermission('sys_client_view')")
	public R<IPage> getPage(PageModel pm) {
		return R.buildOkData(oauthClientDetailService.findPage(pm));
	}

	/**
	 * 保存
	 *
	 * @param oauthClientDetail 实体
	 * @return success/false
	 */
	@Log(value = "终端管理", businessType = BusinessType.EDIT)
	@PostMapping("/")
	@PreAuthorize("@pms.hasPermission('sys_client_edit')")
	public R save(@Valid @RequestBody OauthClientDetail oauthClientDetail) {
		return new R<>(oauthClientDetailService.saveOrUpdate(oauthClientDetail));
	}

	/**
	 * 删除
	 *
	 * @param id ID
	 * @return success/false
	 */
	@Log(value = "终端管理", businessType = BusinessType.DELETE)
	@DeleteMapping(CommonConstants.URL_IDS_REGEX)
	@PreAuthorize("@pms.hasPermission('sys_client_del')")
	public R removeById(@PathVariable String id) {
		return new R<>(oauthClientDetailService.removeClientDetailsById(id));
	}

}
