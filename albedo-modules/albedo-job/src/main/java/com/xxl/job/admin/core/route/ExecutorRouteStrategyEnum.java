package com.xxl.job.admin.core.route;

import com.xxl.job.admin.core.route.strategy.*;
import com.xxl.job.admin.core.util.I18nUtil;

/**
 *
 * @author xuxueli
 * @date 17/3/10
 */
public enum ExecutorRouteStrategyEnum {

	FIRST(I18nUtil.getString("jobconf_route_first"), new BaseExecutorRouteFirst()), LAST(
			I18nUtil.getString("jobconf_route_last"), new BaseExecutorRouteLast()), ROUND(
					I18nUtil.getString("jobconf_route_round"), new BaseExecutorRouteRound()), RANDOM(
							I18nUtil.getString("jobconf_route_random"), new BaseExecutorRouteRandom()), CONSISTENT_HASH(
									I18nUtil.getString("jobconf_route_consistenthash"),
									new BaseExecutorRouteConsistentHash()), LEAST_FREQUENTLY_USED(
											I18nUtil.getString("jobconf_route_lfu"),
											new BaseExecutorRouteLFU()), LEAST_RECENTLY_USED(
													I18nUtil.getString("jobconf_route_lru"),
													new BaseExecutorRouteLRU()), FAILOVER(
															I18nUtil.getString("jobconf_route_failover"),
															new BaseExecutorRouteFailover()), BUSYOVER(
																	I18nUtil.getString("jobconf_route_busyover"),
																	new BaseExecutorRouteBusyover()), SHARDING_BROADCAST(
																			I18nUtil.getString("jobconf_route_shard"),
																			null);

	ExecutorRouteStrategyEnum(String title, BaseExecutorRouter router) {
		this.title = title;
		this.router = router;
	}

	private String title;

	private BaseExecutorRouter router;

	public String getTitle() {
		return title;
	}

	public BaseExecutorRouter getRouter() {
		return router;
	}

	public static ExecutorRouteStrategyEnum match(String name, ExecutorRouteStrategyEnum defaultItem) {
		if (name != null) {
			for (ExecutorRouteStrategyEnum item : ExecutorRouteStrategyEnum.values()) {
				if (item.name().equals(name)) {
					return item;
				}
			}
		}
		return defaultItem;
	}

}
