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

package com.albedo.java.modules.sys.service;

import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.modules.sys.domain.OauthClientDetail;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author somowhere
 * @since 2019/2/1
 */
public interface OauthClientDetailService extends IService<OauthClientDetail> {
	/**
	 * 通过ID删除客户端
	 *
	 * @param id
	 * @return
	 */
	Boolean removeClientDetailsById(String id);

	/**
	 * 根据客户端信息
	 *
	 * @param oauthClientDetail
	 * @return
	 */
	Boolean updateClientDetailsById(OauthClientDetail oauthClientDetail);

	IPage<OauthClientDetail> findPage(PageModel pm);
}
