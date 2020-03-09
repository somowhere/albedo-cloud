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

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import com.albedo.java.common.core.constant.SecurityConstants;
import com.albedo.java.common.core.util.R;
import com.albedo.java.common.core.util.StringUtil;
import com.albedo.java.common.security.service.UserDetail;
import com.albedo.java.modules.sys.dubbo.RemoteTokenService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.data.redis.core.ConvertingCursor;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.util.OAuth2Utils;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.web.authentication.preauth.PreAuthenticatedAuthenticationToken;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author somowhere
 * @date 2019/2/1
 * 删除token端点
 */
@Service(protocol = "dubbo")
@AllArgsConstructor
public class RemoteTokenServiceImpl implements RemoteTokenService {
	private static final String PROJECT_OAUTH_ACCESS = SecurityConstants.PROJECT_PREFIX + SecurityConstants.OAUTH_PREFIX + "access:";
	private static final String CURRENT = "current";
	private static final String SIZE = "size";
	private final TokenStore tokenStore;
	private final RedisTemplate redisTemplate;

	/**
	 * 令牌管理调用
	 *
	 * @param tokens tokens
	 */
	public R<Boolean> removeToken(String tokens) {
		Lists.newArrayList(tokens.split(StringUtil.SPLIT_DEFAULT)).forEach(
			token -> redisTemplate.delete(PROJECT_OAUTH_ACCESS + token));
		return R.buildOk("操作成功");
	}


	/**
	 * 查询token
	 *
	 * @param params 分页参数
	 */
	public R getTokenPage(Map<String, Object> params) {

		List<Map<String, String>> list = new ArrayList<>();
		if (StringUtils.isEmpty(MapUtil.getInt(params, CURRENT)) || StringUtils.isEmpty(MapUtil.getInt(params, SIZE))) {
			params.put(CURRENT, 1);
			params.put(SIZE, 20);
		}
		//根据分页参数获取对应数据
		List<String> tokenStrs = findKeysForPage(PROJECT_OAUTH_ACCESS + "*", MapUtil.getStr(params, "username"), MapUtil.getInt(params, CURRENT), MapUtil.getInt(params, SIZE));

		for (String tokenStr : tokenStrs) {
			OAuth2AccessToken token = tokenStore.readAccessToken(tokenStr);
			Map<String, String> map = new HashMap<>(8);

			map.put(OAuth2AccessToken.TOKEN_TYPE, token.getTokenType());
			map.put(OAuth2AccessToken.ACCESS_TOKEN, token.getValue());
			map.put(OAuth2AccessToken.EXPIRES_IN, token.getExpiresIn() + "");


			OAuth2Authentication oAuth2Auth = tokenStore.readAuthentication(token);
			Authentication authentication = oAuth2Auth.getUserAuthentication();

			map.put(OAuth2Utils.CLIENT_ID, oAuth2Auth.getOAuth2Request().getClientId());
			map.put(OAuth2Utils.GRANT_TYPE, oAuth2Auth.getOAuth2Request().getGrantType());

			if (authentication instanceof UsernamePasswordAuthenticationToken) {
				UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken) authentication;

				if (authenticationToken.getPrincipal() instanceof UserDetail) {
					UserDetail user = (UserDetail) authenticationToken.getPrincipal();
					map.put("user_id", user.getId() + "");
					map.put("username", user.getUsername() + "");
				}
			} else if (authentication instanceof PreAuthenticatedAuthenticationToken) {
				//刷新token方式
				PreAuthenticatedAuthenticationToken authenticationToken = (PreAuthenticatedAuthenticationToken) authentication;
				if (authenticationToken.getPrincipal() instanceof UserDetail) {
					UserDetail user = (UserDetail) authenticationToken.getPrincipal();
					map.put("user_id", user.getId() + "");
					map.put("username", user.getUsername() + "");
				}
			}
			list.add(map);
		}

		Page result = new Page(MapUtil.getInt(params, CURRENT), MapUtil.getInt(params, SIZE));
		result.setRecords(list);
		result.setTotal(Long.valueOf(redisTemplate.keys(PROJECT_OAUTH_ACCESS + "*").size()));
		return new R(result);

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
			String realToken = StrUtil.subAfter(token, PROJECT_OAUTH_ACCESS, true);
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
