package com.ssm.demo.test.util;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.ssm.demo.test.vo.ScheduleJob;



public class TaskUtils {
	public final static Logger log = Logger.getLogger(TaskUtils.class);  
	  
    /** 
     * 通过反射调用scheduleJob中定义的方法 
     *  
     * @param scheduleJob 
     * @param context 
     */  
    public static void invokMethod(ScheduleJob scheduleJob, JobExecutionContext context) {  
        Object object = null;  
         //springId不为空先按springId查找bean  
        if (StringUtils.isNotBlank(scheduleJob.getSpringId())) {
        	try{
        		object = SpringUtils.getBean(scheduleJob.getSpringId());  
        	}catch(Exception e){
        		log.info("spring 中 没有改bean，使用java创建！");
        		if (StringUtils.isNotBlank(scheduleJob.getBeanClass())) {  
        			try {  
        				Class<?> clazz = Class.forName(scheduleJob.getBeanClass());  
        				object = clazz.newInstance();  
        			} catch (Exception e2) {  
        				log.error("创建 class 失败", e2);
        			}  

        		}  
        	}
        } 
        
        if(object == null){
        	log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，请检查是否配置正确！！！");  
			return;  
        }
      
        Job job = (Job)object;
        try {
			job.execute(context);
		} catch (JobExecutionException e) {
			log.error("job excuete error!", e);
		}
    }
}
