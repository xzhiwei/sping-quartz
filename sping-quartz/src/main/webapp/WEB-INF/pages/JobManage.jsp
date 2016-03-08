<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/tmpl" prefix="tmpl" %>
<tmpl:overwrite name="content">
<div id="main-content">
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">Box Settings</h4>
					</div>
					<div class="modal-body">
					  Here goes box setting content.
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					  <button type="button" class="btn btn-primary">Save changes</button>
					</div>
				  </div>
				</div>
			  </div>
			<!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<!-- STYLER -->
									
									<!-- /STYLER -->
									<!-- BREADCRUMBS -->
									<ul class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a href="index.html">Home</a>
										</li>
										<li>
											<a href="#">Tables</a>
										</li>
										<li>Dynamic Tables</li>
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">Dynamic Tables</h3>
									</div>
									<div class="description">Dynamic Tables and Modals</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<!-- DATA TABLES -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border green">
									<div class="box-title">
										<h4><i class="fa fa-table"></i>任务列表</h4>
										<div class="tools hidden-xs">
											<a href="#box-config" data-toggle="modal" class="config">
												<i class="fa fa-cog"></i>
											</a>
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
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
														  <td class="hidden-xs" >
														  	<button type="button" class="btn btn-default btn-xs" title=${item["jobName"]==null?"Title":item["jobName"]}  
															      data-container="body" data-trigger="hover" data-toggle="popover" data-placement="right" 
															      data-content=${item["description"]==""?"无":item["description"]}>
															      详情
															   </button>
   
														  </td>
														  
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
														 <td >
															  <div class="btn-group btn-group-xs" >
																 	<button class="btn btn-default" onclick="jobCancel()">取消</button>
																 	<button class="btn btn-default" onclick="jobEdit()">修改</button>
																 	<button class="btn btn-default" onclick="jobRepeat()">重试</button>
															 </div>
														 </td>
													</tr>
												</c:forEach>
											</tbody>
											<tfoot>
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
											</tfoot>
										</table>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>

						<!-- /EXPORT TABLES -->
						<div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
						</div>
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>

</tmpl:overwrite>
<tmpl:overwrite name="bodyscript">
<script type="text/javascript" src="js/Editor-1.5.5/js/dataTables.editor.js"></script>
<script>
$(document).ready(function() {
	//所有hover项被激活
	 $("[data-toggle='popover']").popover();
	 //设置表格
    $('#datatable1').dataTable( {
    	language: {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
             	"sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        },
        sDom: "<'row'<'dataTables_header clearfix'<'col-md-4'l><'col-md-8'Tf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
        oTableTools: {
        	sSwfPath: "js/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf",
            aButtons: [
						{	sExtends:"text",
						   	sButtonText:"新增",
						   	fnClick :  function(nButton, oConfig, oFlash) {
				                 alert('新增按钮被点击');
				            }
						},
                       {	sExtends:"copy",
                    	   	sButtonText:"复制"
            			},
            			{	sExtends:"print",
                     	   	sButtonText:"打印"
             			},
             			{	sExtends:"xls",
                     	   	sButtonText:"导出"
             			}
             		]
        }
    } );
    $('.datatable').each(function(){
		var datatable = $(this);
		// SEARCH - Add the placeholder for Search and Turn this into in-line form control
		var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
		search_input.attr('placeholder', '搜索');
		search_input.addClass('form-control input-sm');
		var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
		length_sel.addClass('form-control input-sm');
	});
} );
	</script>
</tmpl:overwrite>
<jsp:include page="./base.jsp"></jsp:include>