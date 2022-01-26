package com.xxl.job.admin.core.route.strategy;

import com.xxl.job.admin.core.route.BaseExecutorRouter;
import com.xxl.job.core.biz.model.ReturnT;
import com.xxl.job.core.biz.model.TriggerParam;

import java.util.List;
import java.util.Random;

/**
 * Created by xuxueli on 17/3/10.
 */
public class BaseExecutorRouteRandom extends BaseExecutorRouter {

	private static Random localRandom = new Random();

	@Override
	public ReturnT<String> route(TriggerParam triggerParam, List<String> addressList) {
		String address = addressList.get(localRandom.nextInt(addressList.size()));
		return new ReturnT<String>(address);
	}

}
