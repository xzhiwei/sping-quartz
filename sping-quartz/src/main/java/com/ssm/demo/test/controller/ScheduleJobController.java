package com.ssm.demo.test.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.demo.test.dao.ScheduleJobMapper;
import com.ssm.demo.test.service.ScheduleJobService;
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
		System.out.println(taskList.size());
		request.setAttribute("taskList", taskList);
		request.setAttribute("test", "test");
		return "JobManage";
	}
	
	@RequestMapping("api/getAllJob")
	public void getAllJobInfo(HttpServletRequest request,HttpServletResponse response){
		List<ScheduleJob> taskList =  scheduleJobService.getAllJobFromDb();
		System.out.println(taskList.size());
		try {
			response.getWriter().write(JSONArray.fromObject(taskList).toString());
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
