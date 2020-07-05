package com.albedo.java.common;


import com.albedo.java.common.core.util.Json;
import com.albedo.java.common.persistence.datascope.DataScope;
import com.albedo.java.modules.sys.domain.LogOperate;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Sets;
import org.apache.commons.text.StringEscapeUtils;

public class UtilTest {
	static String exception = "com.netflix.hystrix.exception.HystrixRuntimeException: RemoteUserOnlineService#removeByTokens(TokenVo,String) failed and fallback failed."+
		"\tat com.netflix.hystrix.AbstractCommand$22.call(AbstractCommand.java:832)\n" +
		"\tat com.netflix.hystrix.AbstractCommand$22.call(AbstractCommand.java:807)\n" +
		"\tat rx.internal.operators.OperatorOnErrorResumeNextViaFunction$4.onError(OperatorOnErrorResumeNextViaFunction.java:140)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach$DoOnEachSubscriber.onError(OnSubscribeDoOnEach.java:87)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach$DoOnEachSubscriber.onError(OnSubscribeDoOnEach.java:87)\n" +
		"\tat com.netflix.hystrix.AbstractCommand$DeprecatedOnFallbackHookApplication$1.onError(AbstractCommand.java:1472)\n" +
		"\tat com.netflix.hystrix.AbstractCommand$FallbackHookApplication$1.onError(AbstractCommand.java:1397)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach$DoOnEachSubscriber.onError(OnSubscribeDoOnEach.java:87)\n" +
		"\tat rx.observers.Subscribers$5.onError(Subscribers.java:230)\n" +
		"\tat rx.internal.operators.OnSubscribeThrow.call(OnSubscribeThrow.java:44)\n" +
		"\tat rx.internal.operators.OnSubscribeThrow.call(OnSubscribeThrow.java:28)\n" +
		"\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\n" +
		"\tat rx.internal.operators.OnSubscribeDefer.call(OnSubscribeDefer.java:51)\n" +
		"\tat rx.internal.operators.OnSubscribeDefer.call(OnSubscribeDefer.java:35)\n" +
		"\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\n" +
		"\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\n" +
		"\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\n" +
		"\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\n" +
		"\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\n" +
		"\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\n" +
		"\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\n" +
		"\tat rx.internal.operators.OperatorOnErrorResumeNextViaFunction$4.onError(OperatorOnErrorResumeNextViaFunction.java:142)\n" +
		"\tat rx.internal.operators.OnSubscribeDo, serviceId=albedo)\n";

	static String str = "{\"createdBy\":\"1\",\"description\":null,\"id\":null,\"username\":\"admin\",\"title\":\"强退在线用户\",\"logType\":\"ERROR\",\"operatorType\":\"MANAGE\",\"ipAddress\":\"127.0.0.1\",\"ipLocation\":\"内网IP\",\"userAgent\":\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\",\"browser\":\"Chrome\",\"os\":\"OSX\",\"requestUri\":\"/user-online\",\"method\":\"com.albedo.java.modules.sys.web.UserOnlineResource.removeByTokens()\",\"params\":\"{ tokens: [aa614164-8a0f-42e1-8572-87c3c333dd1d] }\",\"time\":316,\"exception\":\"com.netflix.hystrix.exception.HystrixRuntimeException: RemoteUserOnlineService#removeByTokens(TokenVo,String) failed and fallback failed.\\n\\tat com.netflix.hystrix.AbstractCommand$22.call(AbstractCommand.java:832)\\n\\tat com.netflix.hystrix.AbstractCommand$22.call(AbstractCommand.java:807)\\n\\tat rx.internal.operators.OperatorOnErrorResumeNextViaFunction$4.onError(OperatorOnErrorResumeNextViaFunction.java:140)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach$DoOnEachSubscriber.onError(OnSubscribeDoOnEach.java:87)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach$DoOnEachSubscriber.onError(OnSubscribeDoOnEach.java:87)\\n\\tat com.netflix.hystrix.AbstractCommand$DeprecatedOnFallbackHookApplication$1.onError(AbstractCommand.java:1472)\\n\\tat com.netflix.hystrix.AbstractCommand$FallbackHookApplication$1.onError(AbstractCommand.java:1397)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach$DoOnEachSubscriber.onError(OnSubscribeDoOnEach.java:87)\\n\\tat rx.observers.Subscribers$5.onError(Subscribers.java:230)\\n\\tat rx.internal.operators.OnSubscribeThrow.call(OnSubscribeThrow.java:44)\\n\\tat rx.internal.operators.OnSubscribeThrow.call(OnSubscribeThrow.java:28)\\n\\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\\n\\tat rx.internal.operators.OnSubscribeDefer.call(OnSubscribeDefer.java:51)\\n\\tat rx.internal.operators.OnSubscribeDefer.call(OnSubscribeDefer.java:35)\\n\\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\\n\\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\\n\\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\\n\\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:41)\\n\\tat rx.internal.operators.OnSubscribeDoOnEach.call(OnSubscribeDoOnEach.java:30)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:48)\\n\\tat rx.internal.operators.OnSubscribeLift.call(OnSubscribeLift.java:30)\\n\\tat rx.Observable.unsafeSubscribe(Observable.java:10327)\\n\\tat rx.internal.operators.OperatorOnErrorResumeNextViaFunction$4.onError(OperatorOnErrorResumeNextViaFunction.java:142)\\n\\tat rx.internal.operators.OnSubscribeDo\",\"serviceId\":\"albedo\"}";
	/**
	 * LogOperate(createdBy=1, createdDate=2020-07-05T09:55:25.644, description=null, id=null, username=admin, title=强退在线用户, logType=ERROR, operatorType=MANAGE, ipAddress=127.0.0.1, ipLocation=内网IP, userAgent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36, browser=Chrome, os=OSX, requestUri=/user-online, method=com.albedo.java.modules.sys.web.UserOnlineResource.removeByTokens(), params={ tokens: [aa614164-8a0f-42e1-8572-87c3c333dd1d] }, time=345, exception=com.netflix.hystrix.exception.HystrixRuntimeException: RemoteUserOnlineService#removeByTokens(TokenVo,String) failed and fallback failed.
	 * @param args
	 * @throws JsonProcessingException
	 */
	public static void main(String[] args) throws JsonProcessingException {
		String rs = "Webhook \u7684 payload POST \u65f6\u5fc5\u987b\u662f JSON \u5b57\u7b26\u4e32";
		System.out.println(StringEscapeUtils.escapeHtml4(rs));


		DataScope dataScope = new DataScope();
		dataScope.setUserId("1");
		dataScope.setDeptIds(Sets.newLinkedHashSet());
		System.out.println(Json.toJsonString(dataScope));

		ObjectMapper objectMapper = new ObjectMapper();
//		objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
		LogOperate logOperate = new LogOperate();
		logOperate.setException(exception);
		System.out.println(logOperate);
		String valueAsString = objectMapper.writeValueAsString(logOperate);
		System.out.println(valueAsString);
		LogOperate logOperate1 = objectMapper.readValue(str, LogOperate.class);
		System.out.println(logOperate1);

	}
}
