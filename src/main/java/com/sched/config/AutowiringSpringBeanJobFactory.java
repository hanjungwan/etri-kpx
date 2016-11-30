package com.sched.config;

import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

/**
 * 
 * @Class Name  : AutowiringSpringBeanJobFactory
 * @작성일   : 2014. 7. 30. 
 * @작성자   : Han Jung-Wan
 * @변경이력  :
 * @Class 설명 : Quartz Job클래스에서 Spring Bean사용 할 수 있도록 inject해주는 클래스
 */
public final class AutowiringSpringBeanJobFactory extends SpringBeanJobFactory implements
  	ApplicationContextAware {

	private transient AutowireCapableBeanFactory beanFactory;

	@Override
	public void setApplicationContext(final ApplicationContext context) {
		beanFactory = context.getAutowireCapableBeanFactory();
	}

	@Override
	protected Object createJobInstance(final TriggerFiredBundle bundle) throws Exception {
		final Object job = super.createJobInstance(bundle);
		beanFactory.autowireBean(job);
		return job;
	}
}