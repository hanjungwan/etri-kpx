package com.sched.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.nc.common.dao.CommonDAO;

public class PowerCalculate implements Job{
	
	private static final Logger log = LoggerFactory.getLogger(PowerCalculate.class);
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		log.debug("**----**");
	}
}
