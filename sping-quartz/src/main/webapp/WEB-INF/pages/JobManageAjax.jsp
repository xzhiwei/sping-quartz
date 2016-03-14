<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/tmpl" prefix="tmpl" %>
<!-- 头部 -->
<tmpl:overwrite name="head">
<!-- DATA TABLES -->
<link rel="stylesheet" type="text/css" href="js/datatables/media/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="js/datatables/media/assets/css/datatables.min.css" />
<link rel="stylesheet" type="text/css" href="js/datatables/extras/TableTools/media/css/TableTools.min.css" />
<!-- bootstrap-datepicker 组件 -->
<link rel="stylesheet" type="text/css" href="js/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />
<!-- bootstrap-datetimepicker 组件 -->
<link rel="stylesheet" type="text/css" href="js/datetimepicker/css/bootstrap-datetimepicker.min.css" />

</tmpl:overwrite>
<!-- 正文 -->
<tmpl:overwrite name="content">
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">表格设置</h4>
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
											<a href="index.html">首页</a>
										</li>
										<li>
											<a href="#">任务</a>
										</li>
										<li>任务列表</li>
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<div class="col-sm-6">
											<h3 class="content-title pull-left">任务列表</h3>
										</div>
								      <div class="col-sm-6">
								          <form class="form-horizontal" role="form">
								          <div class="form-group">
								          <label for="firstname" class="col-sm-offset-5 col-sm-2 control-label">任务日期：</label>
									          <div class="col-sm-3">
									         <input id="date-now-picker"  type="text" class="form-control input-sm">
									      </div>
									      <button type="submit" class="btn btn-default ">查询</button>
									      </div>
									    </form>
									    
								      </div>
									</div>
									<div class="description"></div>
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
											
											<tfoot>
												<tr>
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
<!-- 模态框（Modal） 新增窗口  -->
<div class="modal fade"  id="addAndEditModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="ModalTitleLabel">
               	新增任务
            </h4>
         </div>
         <div class="modal-body">
            <form id="form-job-manage" class="form-horizontal" role="form">
            	<div id="div-error" class="hidden">
				</div>
			   <div class="form-group">
			      <label for="firstname" class="col-sm-3 control-label">任务ID</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control"  id="jobId" name="taskId"  placeholder="任务ID">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">任务名称</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="jobName"  name="jobName"  placeholder="任务名称">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">任务组</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="jobGroup"  name="jobGroup"  placeholder="任务组">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">依赖</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="depandOnList"  name="depandOnList" placeholder="依赖">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">重试次数</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="repeatTimes"  name="repeatTimes"   value=3>
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">计划开始时间</label>
			      <div class="col-sm-9">
			         <div class="input-append date form_datetime">
					    <input  id="jobPlanTime"  name="jobPlanTime"  class="form-control"  size="16"  type="text"  value="" >
					    <span class="add-on"><i class="icon-th"></i></span>
					</div>
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">执行表达式</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="cronExpression"  name="cronExpression" placeholder="cron表达式">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">任务描述</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="description"  name="description"  placeholder="任务描述">
			      </div>
			   </div>
			   <div class="form-group">
			      <label for="lastname" class="col-sm-3 control-label">任务类路径</label>
			      <div class="col-sm-9">
			         <input type="text" class="form-control" id="beanClass"   name="beanClass" placeholder="class path">
			      </div>
			   </div>
		</form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default"  data-dismiss="modal">关闭</button>
            <button type="submit" id="commit" class="btn btn-primary">提交更改</button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</tmpl:overwrite>

<!-- 正文尾部 -->
<tmpl:overwrite name="bodyscript">
<!-- DATA TABLES -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script>
<!-- 
<script type="text/javascript" src="js/datatables/media/js/jquery.dataTables.min.js"></script>
 -->
<script type="text/javascript" src="js/datatables/media/assets/js/datatables.min.js"></script>
<script type="text/javascript" src="js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
<script type="text/javascript" src="js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>
<!-- bootstrap-datetimepicker 组件 -->
<script type="text/javascript" src="js/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="js/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- bootstrap-datepicker 组件 -->
<script type="text/javascript" src="js/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script>

$(document).ready(function() {
	//所有hover项被激活
	
	 //设置表格
    var datatable1 = $('#datatable1').DataTable( {
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
						   		$('#addAndEditModal').find("#ModalTitleLabel").text("添加任务");
                				$('#addAndEditModal').find("#jobId").val("");
                				$('#addAndEditModal').find("#jobName").val("");
                				$('#addAndEditModal').find("#jobGroup").val("");
                				$('#addAndEditModal').find("#depandOnList").val("");
                				$('#addAndEditModal').find("#repeatTimes").val(3);
                				$('#addAndEditModal').find("#jobPlanTime").val("");
                				$('#addAndEditModal').find("#cronExpression").val("");
                				$('#addAndEditModal').find("#description").val("");
                				$('#addAndEditModal').find("#beanClass").val("");
                				
                				
						   		$('#addAndEditModal').modal('show');
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
        },
        processing : true,
     	//serverSide: true, 此处是一次获取全部数据，不属于服务器分页，因此不能设置为true
         ajax: {
         	url: 'api/getAllJob.txt',
         	type: 'POST',
         	dataSrc: 'data',
         	error: function (xhr, error, thrown) {
         		alert(error);
         	}
         },
         "columnDefs": [ 
					        { 
						       	 "targets": 0,
						       	 "data": "jobId" },
					         {
								 "targets": 1,
								 "data": "jobName" },
							{ 
								 "targets": 2,
								 "data": "jobGroup" },
							{ 
								 "targets": 3,
								 "data": null,
								 "defaultContent": "<button type='button' class='btn btn-default btn-xs' title='Title' "
														 +"data-container='body' data-trigger='hover' data-toggle='popover' data-placement='right' "
														 +"data-content='无'>"
														 +"详情"
														 +"</button>"
							},
							{ 
								 "targets": 4,
								 "data": "jobType" },
							{ 
								 "targets": 5,
								 "data": "depandOnList" },
							{ 
								 "targets": 6,
								 "data": "jobStatus" },
							{ 
								 "targets": 7,
								 "data": "jobStartTime" },
							{ 
								 "targets": 8,
								 "data": "jobEndTime" },
							{
							    "targets": 9,
							    "data": null,
							    "defaultContent": "<div class='btn-group btn-group-xs' >"
													 	+"<button class='btn btn-default' method='cancel'>取消</button>"
													 	+"<button class='btn btn-default' method='edit'>修改</button>"
													 	+"<button class='btn btn-default' method='retry'>重试</button>"
													 	+"</div>"
							},
							{
				                "targets": 10,//隐藏描述列
				                "data":"description",
				                "visible": false,
				                "searchable": false
				            }
         		],
         		 fnCreatedRow:function( nRow, aData, iDataIndex){
         			$($(nRow).children()[3]).children().attr({
                 		"title": aData.jobName==""?" 标题" : aData.jobName,
                 		"data-content": aData.description=="" ? "无" : aData.description
                 	});
                 	return nRow;
                 },
                 fnDrawCallback:function(oSettings ){
                	 $("[data-toggle='popover']").popover();
                 },
        fnInitComplete:function(oSettings, json) {
        	//$("[data-toggle='popover']").popover();
        	$('#datatable1 tbody').on( 'click','button[method]' , function () {
        		var method=$(this).attr('method');
        		var jobId = $(this).parents('tr').children(":first").text();
                if(method=='cancel'){
                	
                } else if(method=='edit'){
                	$.ajax({
                		url:"api/getJobById.txt",
                		data:{
                			jobId:jobId
                		},
                		type:'POST',
                		dataType:"json",
                		success:function(data){
                			if(data.success){
                				$('#addAndEditModal').find("#ModalTitleLabel").text("修改任务");
                				$('#addAndEditModal').find("#jobId").val(data.data.jobId);
                				$('#addAndEditModal').find("#jobName").val(data.data.jobName);
                				$('#addAndEditModal').find("#jobGroup").val(data.data.jobGroup);
                				$('#addAndEditModal').find("#depandOnList").val(data.data.depandOnList);
                				$('#addAndEditModal').find("#repeatTimes").val(data.data.repeatTimes);
                				$('#addAndEditModal').find("#jobPlanTime").val(data.data.jobPlanTime);
                				$('#addAndEditModal').find("#cronExpression").val(data.data.cronExpression);
                				$('#addAndEditModal').find("#description").val(data.data.description);
                				$('#addAndEditModal').find("#beanClass").val(data.data.beanClass);
                				$('#addAndEditModal').modal('show');
                			} else {
                				alert("未找到该条记录！");
                			}
                		},
                		error:function(){
                			alert("查询数据异常！");
                		}
                	});
                } else if(method=='retry'){
                	
                }
            } );
        },
       
        
    } );
	
    
    $('#addAndEditModal').find("#commit").click(function(){
		$(this).attr("disabled",true).addClass('disabled').text("").append("<i class='fa fa-spinner fa fa-spin'></i>&nbsp;提交中...");
		$.ajax({
			url:"addJobNow",
    		data:$("#form-job-manage").serialize(),
    		type:'POST',
    		dataType:"json",
    		success:function(data){
    			$('#addAndEditModal').find("#commit").removeClass('disabled').prop('disabled', false).text("提交更改");
    			if(data.success){
    				$('#addAndEditModal').find("#div-error").children().remove();
    				$('#addAndEditModal').modal('hide');
    				datatable1.ajax.reload();
    			} else {
    				$('#addAndEditModal').find("#div-error").children().remove();
    				$('#addAndEditModal').find("#div-error").append('<div class="alert alert-warning">'
      							   	+'<a href="#" class="close" data-dismiss="alert">&times;</a>'
     							   	+ '<strong>错误！</strong>添加任务错误，请检查您的表单！'
     								+'</div>').removeClass("hidden").addClass("show");
    			}
    		},
    		error:function(e){
    			$('#addAndEditModal').find("#commit").removeClass('disabled').prop('disabled', false).text("提交更改");
    			$('#addAndEditModal').find("#div-error").children().remove();
				$('#addAndEditModal').find("#div-error").append('<div class="alert alert-warning">'
  							   	+'<a href="#" class="close" data-dismiss="alert">&times;</a>'
 							   	+ '<strong>错误！</strong>请求异常，请检查您的网络链接！'
 								+'</div>').removeClass("hidden").addClass("show");
    		}
		});
	});
    
    $('.datatable').each(function(){
		var datatable = $(this);
		// SEARCH - Add the placeholder for Search and Turn this into in-line form control
		var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
		search_input.attr('placeholder', '搜索');
		search_input.addClass('form-control input-sm');
		var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
		length_sel.addClass('form-control input-sm');
	});
	 
    $('#jobPlanTime').datetimepicker({
    	language: "zh-CN",
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-left"
    });
    
    $("#date-now-picker").datepicker({
        weekStart: 0,
        todayBtn: "linked",
        language: "zh-CN",
        autoclose: true,
        todayHighlight: true
    }).datepicker('setDate', new Date());
        	
	App.init();
	
	jQuery('.box .tools a.reload').click(function () {
		datatable1.ajax.reload();
	});
	
} );
</script>
</tmpl:overwrite>
<jsp:include page="./base.jsp"></jsp:include>
