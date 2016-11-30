package com.sched;

import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.TriggerKey;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;


/**
 * 
 * @Class Name  : SchedDynamicConfig
 * @작성일   : 2014. 7. 30. 
 * @작성자   : Han Jung-Wan
 * @변경이력  :
 * @Class 설명 : List<SchedConfigValue>에 담김 데이터를 이용하여 동적으로
 * 스케쥴을 등록 하고, jobKeyMap에 job별 key을 등록 하여, 스케줄을 동작 여부를 컨트롤 할수 있도록 한다.
 */
public abstract class SchedDynamicConfig {
		
	private Scheduler scheduler;
	
	private HashMap<String, JobKey> jobKeyMap;
	private HashMap<String, TriggerKey> triKeyMap;
	

	
	/**
	 * 
	 * @Method Name  : start
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 스케쥴 등록 초기화 함수
	 * @throws SchedulerException
	 */
	public void configScheduler(SchedulerFactoryBean schedulerFactoryBean) throws SchedulerException{
		
		if(scheduler == null)
			scheduler = schedulerFactoryBean.getObject();
		if(jobKeyMap == null){
			jobKeyMap = new HashMap<String, JobKey>();
			triKeyMap = new HashMap<String, TriggerKey>();
		}
		
		createSched();
		scheduler.start();
	}
	
	/**
	 * 
	 * @Method Name  : createSched
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : getJobList()에서 불러온 스케쥴 정보를 이용하여 잡, 트리거 등록
	 */
	private void createSched(){
		List<HashMap<String, String>> list = getJobList();
		
		for(HashMap<String, String> v : list){
			try {
				
				JobDetail 	job 	= setJob(v.get("JOB_CLASS_NAME"));
				CronTrigger cron 	= setTrigger(v.get("TIME_INTERVAL"));
				scheduler.scheduleJob(job, cron);
				
				JobKey jobKey = job.getKey();
				
				addJobKey(v.get("CONTEXT"), jobKey);
				addTriKey(v.get("CONTEXT"), cron.getKey());
								
				if(StringUtils.equalsIgnoreCase("N", v.get("USE_YN"))){
					scheduler.pauseJob(jobKey);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * @Method Name  : setJob
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 잡 등록
	 * @param className
	 * @return
	 * @throws ClassNotFoundException
	 */
	private JobDetail setJob(String className) throws ClassNotFoundException{
		
		Class<QuartzJobBean> c = (Class<QuartzJobBean>) Class.forName(className); 
		
		return newJob(c).build();
	}
	/**
	 * 
	 * @Method Name  : setTrigger
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 트리거 등록
	 * @param timeInterval
	 * @return
	 * @throws Exception
	 */
	private CronTrigger setTrigger(String timeInterval) throws Exception{
		if(timeInterval == null)
			throw new Exception("timeInterval Value Null");
		
		return newTrigger()
			    .withSchedule(cronSchedule(timeInterval))
			    .build();
	}

	public HashMap<String, JobKey> getJobKeyMap(){
		return jobKeyMap;
	}
	public HashMap<String, TriggerKey> getTriKeyMap(){
		return triKeyMap;
	}
	public void addJobKey(String context, JobKey jobKey){
		jobKeyMap.put(context, jobKey);
	}
	public void addTriKey(String context, TriggerKey triKey){
		triKeyMap.put(context, triKey);
	}
	
	public JobKey getJobKey(String context){
		return jobKeyMap.get(context);
	}
	
	/**
	 * 
	 * @Method Name  : pauseJob
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 해당되는 잡을 일시정지
	 * @param jobKey
	 * @throws SchedulerException
	 */
	public void pauseJob(JobKey jobKey) throws SchedulerException{
		scheduler.pauseJob(jobKey);
	}
	/**
	 * 
	 * @Method Name  : resumeJob
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 해당되는 잡을 다시 시작
	 * @param jobKey
	 * @throws SchedulerException
	 */
	public void resumeJob(JobKey jobKey) throws SchedulerException{
		scheduler.resumeJob(jobKey);
	}
	/**
	 * 
	 * @Method Name  : updateTrigger
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 트리거 수정
	 * @param jobKey
	 * @throws Exception 
	 * @throws SchedulerException
	 */
	public void updateTrigger(String context, String timeInterval, String useYN) throws SchedulerException, Exception{
		CronTrigger cron 	= setTrigger(timeInterval);
		scheduler.rescheduleJob(triKeyMap.get(context), cron);
		addTriKey(context, cron.getKey());
		
		if(StringUtils.equalsIgnoreCase("N", useYN)){
			scheduler.pauseJob(jobKeyMap.get(context));
		}
	}
	/**
	 * 
	 * @Method Name  : getJobList
	 * @작성일   : 2014. 6. 9. 
	 * @작성자   : Han Jung-Wan
	 * @변경이력  :
	 * @Method 설명 : 스케쥴에 등록될 데이터를 가져 옵니다.
	 * @return
	 */
	protected abstract List<HashMap<String, String>> getJobList();

}
