package com.albedo.java.common.security.component;

import com.albedo.java.common.core.constant.SecurityConstants;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.oauth2.provider.token.TokenStore;

/**
 * @author somewhere
 * @date 2021/10/16
 */
public class AlbedoTokenStoreAutoConfiguration {

	@Bean
	public TokenStore tokenStore(RedisConnectionFactory redisConnectionFactory) {
		AlbedoRedisTokenStore tokenStore = new AlbedoRedisTokenStore(redisConnectionFactory);
		tokenStore.setPrefix(SecurityConstants.PROJECT_PREFIX + SecurityConstants.OAUTH_PREFIX);
		return tokenStore;
	}

}
