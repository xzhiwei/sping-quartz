<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/job.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/JSCal2-1.9/js/jscal2.js"></script>
<script src="${pageContext.request.contextPath}/JSCal2-1.9/js/lang/cn.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSCal2-1.9/css/jscal2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSCal2-1.9/css/border-radius.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/JSCal2-1.9/css/steel/steel.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>任务管理</title>
<script type="text/javascript">
var clickFlag = 0;
$(document).ready(function(){
	var d = new Date();
	$("#date").val(d.getFullYear()+"-"+d.getMonth()+"-"+d.getDate());
	
});
	function trClick(thisObj){
		if(clickFlag == 0){
		var $td= $(thisObj).children('td');
		$td.each(function(i,val){
			if($(val).css("overflow") == "hidden"){
				$(val).css("overflow","visible");
				$(val).css("text-overflow","clip");
				$(val).css("white-space","normal");
			} else {
				$(val).css("overflow","hidden");
				$(val).css("text-overflow","ellipsis");
				$(val).css("white-space","nowrap");
			}
			
		});
		} else {
			clickFlag = 0;
		};
		
	};
	
	function buttonClick(){
		clickFlag = 1;
	}
	
	function jobCancel(){
		alert("cancel");
		clickFlag = 1;
	};
	
	function jobEdit(){
		
	};
	
	function jobRepeat(){
		
	};
</script>
</head>
<body class="bgray">
<div class="div_cls">
任务ID：<input type="text"/> &nbsp; 任务名称:<input type="text"/> &nbsp; 日期：
<input size="30" id="date" />
<button id="f_btn1"  style="position:relative;left:-35px;font-weight:bolder;background-color:Transparent;border-color:Transparent;border-style:None;">...</button>
<script type="text/javascript">//<![CDATA[
      Calendar.setup({
        inputField : "date",
        trigger    : "f_btn1",
        onSelect   : function() { this.hide() },
        dateFormat : "%Y-%m-%d"
      });
    //]]></script>
<button >查询</button> &nbsp;
<button onclick="openAddJobWindow()">添加</button>
<br/>
<br/>
	<table class="list_table" >
		<thead>
			<tr>
				<td width="3%">ID</td>
				<td width="8%">名称</td>
				<td width="8%">任务组</td>
				<td width="20%">描述</td>
				<td>类型</td>
				<td>依赖</td>
				<td>状态</td>
				<td width="120px">开始时间</td>
				<td width="120px">结束时间</td>
				<td width="15%">操作</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${taskList}" var="item">  
			<tr onclick="trClick(this)" >
				 <td>${item.jobId}</td>  
				 <td>${item["jobName"]==null?"&nbsp;":item["jobName"]}</td>
				 <td>${item["jobGroup"]==null?"&nbsp;":item["jobGroup"]}</td>
				  <td>${item["description"]==null?"&nbsp;":item["description"]}</td>
				  
				 <td>${item["jobType"]==null?"&nbsp;":item["jobType"]}</td>
				 <td>${item["depandOnList"]==null?"&nbsp;":item["depandOnList"]}</td>
				 <td>${item["jobStatus"]==null?"&nbsp;":item["jobStatus"]}</td>
				 <td>
				 	<c:if test="${item['jobStartTime'] != null}">
				 		<fmt:formatDate value="${item['jobStartTime']}" pattern="yyyy-MM-dd HH:mm:ss"/>
				 	</c:if>
				 </td>
				 <td>
				 	<c:if test="${item['jobStartTime'] != null}">
				 		<fmt:formatDate value="${item['jobEndTime']}" pattern="yyyy-MM-dd HH:mm:ss"/>
				 	</c:if>
				 </td>
				 	
				 <td>
				 	<button onclick="jobCancel()">取消</button><button onclick="jobEdit()">修改</button><button onclick="jobRepeat()">重试</button>
				 </td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>

</html>