<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/job.js"></script>
<script src="${pageContext.request.contextPath}/JSCal2-1.9/js/jscal2.js"></script>
<script src="${pageContext.request.contextPath}/JSCal2-1.9/js/lang/cn.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSCal2-1.9/css/jscal2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSCal2-1.9/css/border-radius.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSCal2-1.9/css/steel/steel.css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加任务</title>
</head>
<script>
function reshow()
{
	window.opener.location.reload();
};
</script>
<body onUnload="javascrip:reshow();">
	<form action="addJobNow" method="post">
	<div class="main">
		<ul class="mainInfo">
			<li>
				<em>任务ID</em>
				<input type="text" name="taskId" required="required"></input><span style="color:red;">*</span>
			</li>
			<li>
				<em>任务名称</em>
				<input type="text" name="jobName" required="required"></input><span style="color:red;">*</span>
			</li>
			<li>
				<em>任务组</em>
				<input type="text" name="jobGroup" ></input>
			</li>
			<li>
				<em>依赖</em>
				<input type="text" name="depandOnList" ></input>
			</li>
			<li>
				<em>重试次数</em>
				<input type="number" name="repeatTimes" value="3" ></input>
			</li>
			<li>
				<em>计划开始时间</em>
				<input type="date" size="30" id="jobPlanTime" name="jobPlanTime" /><button id="f_btn1" style="position:relative;left:-45px;font-weight:bolder;background-color:Transparent;border-color:Transparent;border-style:None;" >...</button><br />
				<script type="text/javascript">//<![CDATA[
				      Calendar.setup({
				        inputField : "jobPlanTime",
				        trigger    : "f_btn1",
				        onSelect   : function() { this.hide() },
				        showTime   : 24,
				        min:new Date(),
				        dateFormat : "%Y-%m-%d %H:%M",
				        fdow :0
				      });
				    //]]>
				</script>
			</li>
			<li>
				<em>执行表达式</em>
				<input type="text" name="cronExpression" ></input>
			</li>
			<li>
				<em>任务描述</em>
				<input type="text" name="description" ></input>
			</li>
			<li>
				<em>任务类路径</em>
				<input type="text" name="beanClass" required="required"></input><span style="color:red;">*</span>
			</li>
		</ul>
		<center>
			<input type="submit" style="width: 120px;margin: 0 auto;" value="确认提交"/>
		</center>
	</div>
</form>
</body>
</html>