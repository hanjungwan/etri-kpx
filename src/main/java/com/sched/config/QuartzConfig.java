package com.sched.config;

import javax.annotation.PostConstruct;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import com.sched.SchedRun;

/**
 * 
 * @Class Name  : QuartzConfig
 * @작성일   : 2014. 7. 30. 
 * @작성자   : Han Jung-Wan
 * @변경이력  :
 * @Class 설명 : Quartz 웹서비스 스케쥴 자동 등록 클래스
 * 웹서비스가 로드가 완료되기 전에 웹서비스 스케쥴이 동작 하면 Security 관련 오류가 나타남
 * '@Order' 어노테이션을 이용하여 후순위로 미룬다.
 */
@Configuration
public class QuartzConfig {

	
	@Autowired
	private ApplicationContext applicationContext;
	
	@Autowired
	private SchedRun schedRun;
	
	@PostConstruct
	public void init() {
		try {
			schedRun.configScheduler(quartzScheduler());
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Bean
	public SchedulerFactoryBean quartzScheduler() {
		SchedulerFactoryBean quartzScheduler = new SchedulerFactoryBean();
		
		quartzScheduler.setAutoStartup(false);
		quartzScheduler.setOverwriteExistingJobs(false);
		quartzScheduler.setSchedulerName("kpx-quartz-scheduler");

		AutowiringSpringBeanJobFactory jobFactory = new AutowiringSpringBeanJobFactory();
		jobFactory.setApplicationContext(applicationContext);
		quartzScheduler.setJobFactory(jobFactory);

		return quartzScheduler;
	}
}
