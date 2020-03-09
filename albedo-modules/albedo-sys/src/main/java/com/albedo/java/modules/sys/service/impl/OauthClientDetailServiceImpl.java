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

package com.albedo.java.modules.sys.service.impl;

import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.common.persistence.DynamicSpecifications;
import com.albedo.java.common.persistence.SpecificationDetail;
import com.albedo.java.modules.sys.domain.OauthClientDetail;
import com.albedo.java.modules.sys.repository.OauthClientDetailRepository;
import com.albedo.java.modules.sys.service.OauthClientDetailService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author somowhere
 * @since 2019/2/1
 */
@Service
public class OauthClientDetailServiceImpl extends ServiceImpl<OauthClientDetailRepository, OauthClientDetail> implements OauthClientDetailService {

	/**
	 * 通过ID删除客户端
	 *
	 * @param id
	 * @return
	 */
	@Override
	@CacheEvict(value = SecurityConstants.CLIENT_DETAILS_KEY, key = "#id")
	public Boolean removeClientDetailsById(String id) {
		return this.removeById(id);
	}

	/**
	 * 根据客户端信息
	 *
	 * @param clientDetails
	 * @return
	 */
	@Override
	@CacheEvict(value = SecurityConstants.CLIENT_DETAILS_KEY, key = "#clientDetails.clientId")
	public Boolean updateClientDetailsById(OauthClientDetail clientDetails) {
		return this.updateById(clientDetails);
	}

	@Override
	public IPage<OauthClientDetail> findPage(PageModel pm) {


		SpecificationDetail<OauthClientDetail> specificationDetail = DynamicSpecifications.buildSpecification(
			OauthClientDetail.class,
			pm.getQueryConditionJson()
		);
		return baseMapper.selectPage(pm, specificationDetail.toEntityWrapper(OauthClientDetail.class));
	}
}
