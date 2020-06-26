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

package com.albedo.java.auth.service.remote.impl;

import cn.hutool.core.util.StrUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.exception.BadRequestException;
import com.albedo.java.common.core.util.*;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.common.util.RedisUtil;
import com.albedo.java.modules.sys.domain.dto.UserOnlineDto;
import com.albedo.java.modules.sys.domain.dto.UserOnlineQueryCriteria;
import com.albedo.java.modules.sys.domain.vo.UserOnlineVo;
import com.albedo.java.modules.sys.dubbo.RemoteUserOnlineService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.data.redis.core.ConvertingCursor;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenStore;

import java.util.*;

/**
 * @author somowhere
 * @date 2019/2/1
 * 删除token端点
 */
@Service(protocol = "dubbo")
@AllArgsConstructor
public class RemoteUserOnlineServiceImpl implements RemoteUserOnlineService {
	private final TokenStore tokenStore;
	private final RedisTemplate redisTemplate;

	/**
	 * 令牌管理调用
	 *
	 * @param tokens
	 * @param userId
	 */
	@Override
	public Result<Boolean> removeByTokens(Set<String> tokens, String userId) throws BadRequestException {
		if(StringUtil.isEmpty(userId)){
			throw new BadRequestException("当前登陆用户为空，无法操作");
		}
		tokens.forEach(token -> {
			OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(token);
			Authentication authentication = tokenStore.readAuthentication(oAuth2AccessToken).getUserAuthentication();
			if (authentication.getPrincipal() instanceof UserDetail) {
				UserDetail userDetail = (UserDetail) authentication.getPrincipal();
				if(userId.equals(userDetail.getId())){
					throw new BadRequestException("当前登陆用户无法强退");
				}
				redisTemplate.delete(SecurityConstants.PROJECT_OAUTH_ONLINE + userDetail.getId());
			}
			redisTemplate.delete(SecurityConstants.PROJECT_OAUTH_ACCESS + token);
		});
		return Result.buildOk("操作成功");
	}


	/**
	 * 查询token
	 *
	 * @param userOnlineQueryCriteria 分页参数
	 */
	@Override
	public Result findPage(UserOnlineQueryCriteria userOnlineQueryCriteria) {

		List<UserOnlineVo> list = new ArrayList<>();
		//根据分页参数获取对应数据
		List<String> tokenStrs = findKeysForPage(SecurityConstants.PROJECT_OAUTH_ACCESS + "*", userOnlineQueryCriteria.getUsername(),
			userOnlineQueryCriteria.getCurrent(), userOnlineQueryCriteria.getSize());

		for (String tokenStr : tokenStrs) {
			OAuth2AccessToken token = tokenStore.readAccessToken(tokenStr);
			OAuth2Authentication oAuth2Auth = tokenStore.readAuthentication(token);
			Authentication authentication = oAuth2Auth.getUserAuthentication();
			UserOnlineVo userOnlineVo = new UserOnlineVo();
			if (authentication.getPrincipal() instanceof UserDetail) {
				UserDetail userDetail = (UserDetail) authentication.getPrincipal();
				UserOnlineDto userOnlineDto = RedisUtil.getCacheObject(SecurityConstants.PROJECT_OAUTH_ONLINE + userDetail.getId());
				BeanUtil.copyProperties(userOnlineDto, userOnlineVo);
			}
			userOnlineVo.setTokenType(token.getTokenType());
			userOnlineVo.setAccessToken(token.getValue());
			userOnlineVo.setExpiresIn(token.getExpiration());
			userOnlineVo.setClientId(oAuth2Auth.getOAuth2Request().getClientId());
			userOnlineVo.setGrantType(oAuth2Auth.getOAuth2Request().getGrantType());
			list.add(userOnlineVo);
		}

		Page result = new Page(userOnlineQueryCriteria.getCurrent(), userOnlineQueryCriteria.getSize());
		result.setRecords(list);
		result.setTotal(Long.valueOf(redisTemplate.keys(SecurityConstants.PROJECT_OAUTH_ACCESS + "*").size()));
		return Result.buildOkData(result);

	}

	private List<String> findKeysForPage(String patternKey, String username, int pageNum, int pageSize) {
		ScanOptions options = ScanOptions.scanOptions().match(patternKey).build();
		RedisSerializer<String> redisSerializer = (RedisSerializer<String>) redisTemplate.getKeySerializer();
		Cursor cursor = (Cursor) redisTemplate.executeWithStickyConnection(redisConnection -> new ConvertingCursor<>(redisConnection.scan(options), redisSerializer::deserialize));
		List<String> result = new ArrayList<>();
		int tmpIndex = 0;
		int startIndex = (pageNum - 1) * pageSize;
		int end = pageNum * pageSize;

		assert cursor != null;
		while (cursor.hasNext()) {
			String token = cursor.next().toString(), targetName = "";
			String realToken = StrUtil.subAfter(token, SecurityConstants.PROJECT_OAUTH_ACCESS, true);
			OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(realToken);
			OAuth2Authentication oAuth2Auth = tokenStore.readAuthentication(oAuth2AccessToken);
			Authentication authentication = oAuth2Auth.getUserAuthentication();
			if (authentication.getPrincipal() instanceof UserDetail) {
				UserDetail user = (UserDetail) authentication.getPrincipal();
				targetName = user.getUsername();
			}
			if (tmpIndex >= startIndex && tmpIndex < end && (StringUtil.isEmpty(username) || targetName.indexOf(username) != -1)) {
				result.add(realToken);
				tmpIndex++;
				continue;
			}
			if (tmpIndex >= end) {
				break;
			}
			tmpIndex++;
			cursor.next();
		}
		return result;
	}
}
