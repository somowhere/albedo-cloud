package com.albedo.java.gateway.config;

import com.albedo.java.common.core.config.FilterIgnoreProperties;
import com.albedo.java.common.core.constant.CommonConstants;
import lombok.AllArgsConstructor;
import org.springframework.cloud.gateway.route.RouteDefinition;
import org.springframework.cloud.gateway.route.RouteDefinitionLocator;
import org.springframework.cloud.gateway.route.RouteDefinitionRepository;
import org.springframework.cloud.gateway.support.NameUtils;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Retrieves all registered microservices Swagger resources.
 */
@Component
@Primary
@AllArgsConstructor
public class RegistrySwaggerResourcesProvider implements SwaggerResourcesProvider {


	private final RouteDefinitionRepository routeDefinitionRepository;
	private final RouteDefinitionLocator routeDefinitionLocator;

	private final FilterIgnoreProperties filterIgnoreProperties;


	@Override
	public List<SwaggerResource> get() {
		List<SwaggerResource> resources = new ArrayList<>();
		List<RouteDefinition> routeDefinitions = new ArrayList<>();
		routeDefinitionRepository.getRouteDefinitions().subscribe(route -> routeDefinitions.add(route));
		routeDefinitionLocator.getRouteDefinitions().subscribe(route -> routeDefinitions.add(route));
		routeDefinitions.forEach(routeDefinition -> routeDefinition.getPredicates().stream()
			.filter(predicateDefinition -> "Path".equalsIgnoreCase(predicateDefinition.getName()))
			.filter(predicateDefinition -> !filterIgnoreProperties.getSwaggerProviders().contains(routeDefinition.getId()))
			.forEach(predicateDefinition -> resources.add(swaggerResource(routeDefinition.getId(),
				predicateDefinition.getArgs().get(NameUtils.GENERATED_NAME_PREFIX + "0").replace("/**", CommonConstants.SWAGGER_API_URI))))
		);

		return resources.stream().sorted(Comparator.comparing(SwaggerResource::getName)).collect(Collectors.toList());
	}

	private SwaggerResource swaggerResource(String name, String location) {
		SwaggerResource swaggerResource = new SwaggerResource();
		swaggerResource.setName(name);
		swaggerResource.setLocation(location);
		swaggerResource.setSwaggerVersion("2.0");
		return swaggerResource;
	}
}
