package com.ssm.demo.test.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	Logger logger = LoggerFactory.getLogger(ScheduleJobController.class);
	
	@Autowired
	ScheduleJobService scheduleJobService;
	
	@Autowired
	ScheduleJobMapper ScheduleJobMapper;

	private static JsonConfig jsonConfig;
	
	static{
		jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor()); 
	}
	
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
		return "JobManageAjax";
	}
	
	@RequestMapping("api/getAllJob.txt")
	public void getAllJobInfo(HttpServletRequest request,HttpServletResponse response){
		List<ScheduleJob> taskList =  scheduleJobService.getAllJobFromDb();
		logger.info("查询所有任务列表，任务数量："+ taskList.size());
		try {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("data", taskList);
			m.put("draw", 1);
			m.put("recordsTotal", taskList.size());
			m.put("recordsFiltered", taskList.size());
		    //Map转JSON  
			String s = JSONObject.fromObject(m,jsonConfig).toString();
			response.getWriter().write(s);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("api/getJobById.txt")
	public void getJobById(HttpServletRequest request,HttpServletResponse response){
		ScheduleJob job =  scheduleJobService.getTaskById(Integer.parseInt(request.getParameter("jobId")));
		logger.info("查询任务Id【{}】列表信息",request.getParameter("jobId"));
		try {
			HashMap<String, Object> m = new HashMap<String, Object>();
			if(job != null){
				m.put("data", job);
				m.put("success", true);	
			} else {
				m.put("success", false);
			}
		    //Map转JSON  
			String s = JSONObject.fromObject(m,jsonConfig).toString();
			response.getWriter().write(s);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) {
	}
	
	@InitBinder
	protected void BinderDate(ServletRequestDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		CustomDateEditor editor = new CustomDateEditor(df, true);
		binder.registerCustomEditor(Date.class, editor);
		}
	
	@RequestMapping("addJobNow")
	public void addJobNow(ScheduleJob job,HttpServletResponse response ){
		HashMap<String, Object> m = new HashMap<String, Object>();
		try{
			ScheduleJobMapper.insert(job);
			logger.info("插入任务成功，任务ID：" + job.getTaskId());
			m.put("success", true);
		} catch(Exception e){
			logger.error("数据库操作异常",e);
			m.put("success", false);
		}
		try {
			String s = JSONObject.fromObject(m,jsonConfig).toString();
			response.getWriter().write(s);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("hello")
	public String hello(){
		return "hello";
	}
}
