package com.albedo.java.common;

import com.albedo.java.modules.AlbedoSysServerApplication;
import com.albedo.java.modules.sys.web.UserResource;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

/**
 * Test class for the UserResource REST web.
 *
 * @see UserResource
 */
@SpringBootTest(classes = {AlbedoSysServerApplication.class})
@Slf4j
public class RedisClientTest {

	@Autowired
	private RestTemplate restTemplate;

	@Test
	public void testRequest() throws Exception {
		String path = "http://127.0.0.1:3000/oauth/check_token";
		MultiValueMap<String, String> formData = new LinkedMultiValueMap<String, String>();
		formData.add("token", "efa937fe-2b87-419c-8206-b4a8485d04d2");
		formData.add("Authorization", "Basic YWxiZWRvOmFsYmVkbw==");
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded");
		@SuppressWarnings("rawtypes")
		Map map = restTemplate.exchange(path, HttpMethod.POST,
			new HttpEntity<MultiValueMap<String, String>>(formData, headers), Map.class).getBody();
		log.info("response {}", map);
	}

}
