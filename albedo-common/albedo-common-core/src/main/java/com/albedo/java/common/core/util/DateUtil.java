package com.albedo.java.common.core.util;


import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtil extends cn.hutool.core.date.DateUtil {

	/**
	 * 时间格式：yyyy-MM-dd HH:mm:ss
	 */
	public static final String TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static String format(ZonedDateTime val, String format) {
		return val == null ? null : val.format(DateTimeFormatter.ofPattern(format));
	}

	public static String format(ZonedDateTime val) {
		return format(val, TIME_FORMAT);
	}

}
