package com.albedo.java.plugins.cache;

import com.albedo.java.common.core.util.StrPool;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;

/**
 * 缓存配置
 *
 * @author somewhere
 * @date 2019/08/07
 */
@Slf4j
@EnableCaching
@Import({
	CaffeineAutoConfigure.class, RedisAutoConfigure.class
})
public class CacheAutoConfigure {

	/**
	 * key 的生成
	 */
	@Bean
	public KeyGenerator keyGenerator() {
		return (target, method, objects) -> {
			StringBuilder sb = new StringBuilder();
			sb.append(target.getClass().getName());
			sb.append(StrPool.COLON);
			sb.append(method.getName());
			for (Object obj : objects) {
				if (obj != null) {
					sb.append(StrPool.COLON);
					sb.append(obj.toString());
				}
			}
			return sb.toString();
		};
	}

}
