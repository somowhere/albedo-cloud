package com.xxl.job.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author xuxueli 2018-10-28 00:38:13
 */
@EnableDiscoveryClient
@SpringBootApplication
public class AlbedoXxlJobAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(AlbedoXxlJobAdminApplication.class, args);
	}

}
