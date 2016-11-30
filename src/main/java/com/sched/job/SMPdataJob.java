package com.sched.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sched.service.SMPDataService;

@Component
class SMPdataJob {
	
	private static final Logger log = LoggerFactory.getLogger(SMPdataJob.class);
	
	@Autowired
	private SMPDataService service;
	
	@Scheduled(cron="0 0 0 * * ?")
	public void procSmpData(){
		try {
			service.getSmpData();
		} catch (Exception e) {
			log.error(e.toString());
		}
	}
}
