package com.ssm.demo.test.listener;

import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ssm.demo.test.vo.ScheduleJob;


public class QuartzJobListener implements JobListener {

	Logger log = LoggerFactory.getLogger(QuartzJobListener.class);
	
	public String getName() {
		return "quartzJobListener";
	}
	
	/**
	 * job执行之前
	 */
	public void jobToBeExecuted(JobExecutionContext context) {
		JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
		System.out.println("job 执行前");
		if(jobDataMap.containsKey("scheduleJob")){
			ScheduleJob scheduleJob = (ScheduleJob) jobDataMap.get("scheduleJob");
			
		}
	}

	/**
	 * Job执行被拒接
	 */
	public void jobExecutionVetoed(JobExecutionContext context) {
		JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
		if(jobDataMap.containsKey("scheduleJob")){
			ScheduleJob scheduleJob = (ScheduleJob) jobDataMap.get("scheduleJob");
			
		}
		

	}

	/**
	 * job执行之后
	 */
	public void jobWasExecuted(JobExecutionContext context,
			JobExecutionException jobException) {
		JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
		if(jobDataMap.containsKey("scheduleJob")){
			ScheduleJob scheduleJob = (ScheduleJob) jobDataMap.get("scheduleJob");
			
		}
		

	}

}
