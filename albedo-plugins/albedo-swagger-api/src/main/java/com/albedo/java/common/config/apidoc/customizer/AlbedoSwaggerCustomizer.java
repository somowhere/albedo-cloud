package com.albedo.java.common.config.apidoc.customizer;

import com.albedo.java.common.config.ApplicationSwaggerProperties;
import com.albedo.java.common.core.vo.PageModel;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import com.google.common.collect.Lists;
import org.springframework.core.Ordered;
import org.springframework.http.ResponseEntity;
import springfox.documentation.builders.OAuthBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.nio.ByteBuffer;
import java.util.*;

/**
 * @author somewhere
 * @description
 * @date 2020/5/31 17:06
 */
public class AlbedoSwaggerCustomizer implements SwaggerCustomizer, Ordered {
	public static final int DEFAULT_ORDER = 0;
	private final ApplicationSwaggerProperties applicationSwaggerProperties;
	private int order = 0;
	/**
	 * 默认的排除路径，排除Spring Boot默认的错误处理路径和端点
	 */
	private static final List<String> DEFAULT_EXCLUDE_PATH = Arrays.asList("/error", "/actuator/**");

	private static final String BASE_PATH = "/**";

	public AlbedoSwaggerCustomizer(ApplicationSwaggerProperties applicationSwaggerProperties) {
		this.applicationSwaggerProperties = applicationSwaggerProperties;
	}

	@Override
	public void customize(Docket docket) {
		// base-path处理
		if (applicationSwaggerProperties.getBasePath().isEmpty()) {
			applicationSwaggerProperties.getBasePath().add(BASE_PATH);
		}
		List<Predicate<String>> excludePath = new ArrayList<>();
		// noinspection unchecked
		List<Predicate<String>> basePath = new ArrayList();
		applicationSwaggerProperties.getBasePath().forEach(path -> basePath.add(PathSelectors.ant(path)));
		// exclude-path处理
		if (applicationSwaggerProperties.getExcludePath().isEmpty()) {
			applicationSwaggerProperties.getExcludePath().addAll(DEFAULT_EXCLUDE_PATH);
		}
		applicationSwaggerProperties.getExcludePath().forEach(path -> excludePath.add(PathSelectors.ant(path)));
		Contact contact = new Contact(applicationSwaggerProperties.getContact().getName(),
			applicationSwaggerProperties.getContact().getUrl(), applicationSwaggerProperties.getContact().getEmail());
		ApiInfo apiInfo = new ApiInfo(applicationSwaggerProperties.getTitle(), applicationSwaggerProperties.getDescription(), applicationSwaggerProperties.getVersion(), applicationSwaggerProperties.getTermsOfServiceUrl(), contact, applicationSwaggerProperties.getLicense(), applicationSwaggerProperties.getLicenseUrl(), new ArrayList());
		docket.host(applicationSwaggerProperties.getHost())
			.apiInfo(apiInfo)
			.securitySchemes(Collections.singletonList(securitySchema(applicationSwaggerProperties)))
			.securityContexts(Collections.singletonList(securityContext(applicationSwaggerProperties))).pathMapping("/")
			.forCodeGeneration(true).directModelSubstitute(ByteBuffer.class, String.class)
			.genericModelSubstitutes(new Class[]{ResponseEntity.class})
			.ignoredParameterTypes(PageModel.class).select()
			.apis(RequestHandlerSelectors.basePackage(applicationSwaggerProperties.getBasePackage()))
			.paths(Predicates.and(Predicates.not(Predicates.or(excludePath)), Predicates.or(basePath)))
			.build();
	}

	@Override
	public int getOrder() {
		return this.order;
	}

	public void setOrder(int order) {
		this.order = order;
	}


	/**
	 * 配置默认的全局鉴权策略的开关，通过正则表达式进行匹配；默认匹配所有URL
	 * @return
	 */
	private SecurityContext securityContext(ApplicationSwaggerProperties swaggerProperties) {
		return SecurityContext.builder().securityReferences(defaultAuth(swaggerProperties))
			.forPaths(PathSelectors.regex(swaggerProperties.getAuthorization().getAuthRegex())).build();
	}

	/**
	 * 默认的全局鉴权策略
	 * @return
	 */
	private List<SecurityReference> defaultAuth(ApplicationSwaggerProperties swaggerProperties) {
		ArrayList<AuthorizationScope> authorizationScopeList = new ArrayList<>();
		swaggerProperties.getAuthorization().getAuthorizationScopeList()
			.forEach(authorizationScope -> authorizationScopeList.add(
				new AuthorizationScope(authorizationScope.getScope(), authorizationScope.getDescription())));
		AuthorizationScope[] authorizationScopes = new AuthorizationScope[authorizationScopeList.size()];
		return Collections
			.singletonList(SecurityReference.builder().reference(swaggerProperties.getAuthorization().getName())
				.scopes(authorizationScopeList.toArray(authorizationScopes)).build());
	}

	private OAuth securitySchema(ApplicationSwaggerProperties swaggerProperties) {
		ArrayList<AuthorizationScope> authorizationScopeList = new ArrayList<>();
		swaggerProperties.getAuthorization().getAuthorizationScopeList()
			.forEach(authorizationScope -> authorizationScopeList.add(
				new AuthorizationScope(authorizationScope.getScope(), authorizationScope.getDescription())));
		ArrayList<GrantType> grantTypes = new ArrayList<>();
		swaggerProperties.getAuthorization().getTokenUrlList()
			.forEach(tokenUrl -> grantTypes.add(new ResourceOwnerPasswordCredentialsGrant(tokenUrl)));
		return new OAuth(swaggerProperties.getAuthorization().getName(), authorizationScopeList, grantTypes);
	}
}
