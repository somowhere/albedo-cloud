/**
 * Copyright &copy; 2020 <a href="https://github.com/somowhere/albedo">albedo</a> All rights reserved.
 */
package com.albedo.java.modules.quartz.repository;


import com.albedo.java.modules.quartz.domain.Job;
import com.albedo.java.plugins.database.mybatis.repository.BaseRepository;
import org.springframework.stereotype.Repository;

/**
 * 任务调度Repository 任务调度
 *
 * @author admin
 * @version 2019-08-14 11:24:16
 */
@Repository
public interface JobRepository extends BaseRepository<Job> {


}
