package com.albedo.java.common.feign.interceptor;

import com.albedo.java.common.core.context.ContextConstants;
import com.albedo.java.common.core.context.ContextUtil;
import com.albedo.java.common.core.util.StringUtil;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class FeignRequestInterceptor implements RequestInterceptor {

	@Override
	public void apply(RequestTemplate requestTemplate) {
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		String traceId = request.getHeader(ContextConstants.TRACE_ID_HEADER);
		if(StringUtil.isNotBlank(traceId)) {
			requestTemplate.header(ContextConstants.TRACE_ID_HEADER, ContextUtil.getTenant());
		}
		requestTemplate.header(ContextConstants.KEY_TENANT, ContextUtil.getTenant());
		requestTemplate.header(ContextConstants.KEY_SUB_TENANT, ContextUtil.getSubTenant());

	}
}
