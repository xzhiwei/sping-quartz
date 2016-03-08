package com.ssm.demo.test.quartz;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.ssm.demo.test.util.TaskUtils;
import com.ssm.demo.test.vo.ScheduleJob;


@DisallowConcurrentExecution
public class QuartzJobFactoryDisallowConcurrentExecution implements Job {
	public final Logger log = Logger.getLogger(this.getClass());  
	  
    public void execute(JobExecutionContext context) throws JobExecutionException {  
        ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");  
        TaskUtils.invokMethod(scheduleJob,context);  
  
    }  
}
