package com.albedo.java.common;

import com.albedo.java.common.core.config.ApplicationProperties;
import com.albedo.java.common.core.constant.CommonConstants;
import com.albedo.java.common.core.exception.handler.GlobalExceptionHandler;
import com.albedo.java.common.core.util.CollUtil;
import com.albedo.java.common.core.vo.PageModel;
import com.albedo.java.modules.AlbedoSysApplication;
import com.albedo.java.modules.TestUtil;
import com.albedo.java.modules.sys.domain.Dept;
import com.albedo.java.modules.sys.domain.Role;
import com.albedo.java.modules.sys.domain.User;
import com.albedo.java.modules.sys.domain.dto.UserDto;
import com.albedo.java.modules.sys.service.DeptService;
import com.albedo.java.modules.sys.service.RoleService;
import com.albedo.java.modules.sys.service.UserService;
import com.albedo.java.modules.sys.web.UserResource;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;

import static com.albedo.java.modules.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Test class for the UserResource REST web.
 *
 * @see UserResource
 */
@SpringBootTest(classes = {AlbedoSysApplication.class})
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
		log.info("response {}",map);
	}

}
