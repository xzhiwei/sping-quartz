<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/tmpl" prefix="aa" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>任务管理</title>
	<!-- DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.7/css/jquery.dataTables.css">
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>

	</head>
	<body>
	<table id="example" class="display" cellspacing="0" width="100%">
     <thead>
												<tr>
													<th>ID</th>
													<th>名称</th>
													<th class="hidden-xs">任务组</th>
													<th class="hidden-xs">描述</th>
													<th class="hidden-xs">类型</th>
													<th>依赖</th>
													<th>状态</th>
													<th>开始时间</th>
													<th>结束时间</th>
													<th class="hidden-xs">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${taskList}" var="item">  
													<tr onclick="trClick(this)" class="gradeA">
														 <td>${item.jobId}</td>  
														 <td>${item["jobName"]==null?"&nbsp;":item["jobName"]}</td>
														 <td>${item["jobGroup"]==null?"&nbsp;":item["jobGroup"]}</td>
														  <td class="hidden-xs" >${item["description"]==null?"&nbsp;":item["description"]}</td>
														  
														 <td class="center">${item["jobType"]==null?"&nbsp;":item["jobType"]}</td>
														 <td>${item["depandOnList"]==null?"&nbsp;":item["depandOnList"]}</td>
														 <td class="center">${item["jobStatus"]==null?"&nbsp;":item["jobStatus"]}</td>
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
														 <td style="text-overflow:ellipsis;white-space:nowrap;">
														 	<button onclick="jobCancel()">取消</button><button onclick="jobEdit()">修改</button><button onclick="jobRepeat()">重试</button>
														 </td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th>Rendering engine</th>
													<th>Browser</th>
													<th class="hidden-xs">Platform(s)</th>
													<th>Engine version</th>
													<th class="hidden-xs">CSS grade</th>
												</tr>
											</tfoot>
    </table>
										<script>
										$(document).ready(function() {
									         $('#example').dataTable( {
									             "language": {
									                 "lengthMenu": "每页 _MENU_ 条记录",
									                 "zeroRecords": "没有找到记录",
									                 "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
									                 "infoEmpty": "无记录",
									                 "infoFiltered": "(从 _MAX_ 条记录过滤)"
									             }
									         } );
									 } );
	</script>
</body>
