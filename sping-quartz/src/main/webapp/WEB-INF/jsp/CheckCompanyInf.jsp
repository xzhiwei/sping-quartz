<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加任务</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#codeDiv").hide();
	});
	
	function search(){
		$("#checkcode").attr("src","");
		$("#codeDiv").hide();
		$("#result").val("");
		$.ajax({
	        type: "POST",
	        dataType : "json",//返回json格式的数据
	        url: "checkCompanyInf",
	        data:{
	        	keyword: $("#keyword").val(),
	        	province:$("#province").val(),
	        },
	        success: function(message){
	        	if(message.status=="needcode"){
	        		$("#checkcode").attr("src","loadCodeImg?id="+Math.random());
	        		$("#codeDiv").show();
	        	} else if(message.status =="success"){
	        		$("#result").val(message.result);
	        	}
	        }
	    });
	}
	
	function confirm(){
		$.ajax({
	        type: "POST",
	        dataType : "json",//返回json格式的数据
	        url: "checkCodeAndGetRes",
	        data:{
	        	checkcode: $("#checkcodeValue").val()
	        },
	        success: function(message){
	        	if(message.status=="success"){
	        		$("#result").val(message.result);
	        	}
	        }
	    });
	}
</script>
</head>
<body>
	省份：<input id="province" type="text" autocomplete="on"><br>
	注册号:<input id="keyword" type="text" autocomplete="on"><br>
	<button id="search" onclick="search()">查询</button><br>
	
	<div id="codeDiv">
		<img id="checkcode" alt="验证码" src=""><br>
		验证码:<input id=checkcodeValue type="text" autocomplete="off"><br>
		<button id="confirm" onclick="confirm()">确定</button>
	</div>
	结果：<textarea id="result" rows="20" cols="150"></textarea>
</body>
</html>