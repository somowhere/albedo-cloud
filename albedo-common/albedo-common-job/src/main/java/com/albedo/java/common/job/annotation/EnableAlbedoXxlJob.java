package com.albedo.java.common.job.annotation;

import com.albedo.java.common.job.XxlJobAutoConfiguration;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * 激活xxl-job配置
 *
 * @author somewhere
 * @date 2020/9/14
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@Import({XxlJobAutoConfiguration.class})
public @interface EnableAlbedoXxlJob {

}
