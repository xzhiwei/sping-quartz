package com.ssm.demo.test.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.demo.test.dao.ScheduleJobMapper;
import com.ssm.demo.test.service.ScheduleJobService;
import com.ssm.demo.test.util.JsonDateValueProcessor;
import com.ssm.demo.test.vo.ScheduleJob;

@Controller
public class ScheduleJobController {
	
	@Autowired
	ScheduleJobService scheduleJobService;
	
	@Autowired
	ScheduleJobMapper ScheduleJobMapper;
	
	@RequestMapping("addAll")
	public void addAllJob(){
		scheduleJobService.addAllJobToSchedule();
	}
	
	@RequestMapping("addJob")
	public String addJob(){
		return "AddJob";
	}
	
	@RequestMapping("jobManage")
	public String getAllJobList(HttpServletRequest request,HttpServletResponse response){
		List<ScheduleJob> taskList =  scheduleJobService.getAllJobFromDb();
		request.setAttribute("taskList", taskList);
		return "JobManage";
	}
	
	@RequestMapping("jobManageAjax")
	public String getAllJobList1(HttpServletRequest request,HttpServletResponse response){
		return "jobManageAjax";
	}
	
	@RequestMapping("api/getAllJob.txt")
	public void getAllJobInfo(HttpServletRequest request,HttpServletResponse response){
		List<ScheduleJob> taskList =  scheduleJobService.getAllJobFromDb();
		System.out.println(taskList.size());
		try {
			HashMap m = new HashMap();
			m.put("data", taskList);
			m.put("draw", 1);
			m.put("recordsTotal", taskList.size());
			m.put("recordsFiltered", taskList.size());
			JsonConfig jsonConfig = new JsonConfig();  
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor()); 
		    JSONObject json = new JSONObject();  
		    //Map转JSON  
			String s = json.fromObject(m,jsonConfig).toString();
			response.getWriter().write(s);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("api/getAllJobArray.txt")
	public void getAllJobInfo1(HttpServletRequest request,HttpServletResponse response){
		List<ScheduleJob> taskList =  scheduleJobService.getAllJobFromDb();
		System.out.println(taskList.size());
		try {
			HashMap m = new HashMap();
			List ll = new ArrayList();
			for(int i=0;i<taskList.size();i++){
				ScheduleJob job = taskList.get(i);
				List l = new ArrayList();
				l.add(job.getJobId());
				l.add(job.getJobName());
				l.add(job.getJobGroup());
				l.add(job.getDescription());
				l.add(job.getJobType());
				l.add(job.getDepandOnList());
				l.add(job.getJobStatus());
				l.add(job.getJobStartTime());
				l.add(job.getJobEndTime());
				l.add(job.getJobEndTime());
				ll.add(l);
			}
			m.put("data", ll);
			JsonConfig jsonConfig = new JsonConfig();  
			jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor()); 
		    JSONObject json = new JSONObject();  
		    //Map转JSON  
			String s = json.fromObject(m,jsonConfig).toString();
			response.getWriter().write(s);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		ScheduleJob job1 = new ScheduleJob();
		job1.setJobId(1);
		List<ScheduleJob> taskList =  new ArrayList<ScheduleJob>();
		taskList.add(job1);
		taskList.add(job1);
		HashMap m = new HashMap();
		List ll = new ArrayList();
		for(int i=0;i<taskList.size();i++){
			ScheduleJob job = taskList.get(i);
			List l = new ArrayList();
			l.add(job.getJobId());
			l.add(job.getJobName());
			l.add(job.getJobGroup());
			l.add(job.getDescription());
			l.add(job.getJobType());
			l.add(job.getDepandOnList());
			l.add(job.getJobStatus());
			l.add(job.getJobStartTime());
			l.add(job.getJobEndTime());
			ll.add(l);
		}
		m.put("data", ll);
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor()); 
	    JSONObject json = new JSONObject();  
	    //Map转JSON  
		String s = json.fromObject(m,jsonConfig).toString();
		System.out.println(s);
	}
	
	@InitBinder
	protected void BinderDate(ServletRequestDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		CustomDateEditor editor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, editor);
		}
	
	@RequestMapping("addJobNow")
	public String addJobNow(ScheduleJob job ){
		ScheduleJobMapper.insert(job);
		return "AddJob";
	}
	
	@RequestMapping("hello")
	public String hello(){
		return "hello";
	}
}
