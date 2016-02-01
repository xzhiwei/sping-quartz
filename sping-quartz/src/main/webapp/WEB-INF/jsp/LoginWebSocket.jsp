<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#qrcodeDiv").hide();
		$("#confirm").hide();
		$("#login").hide();
	});
	
	var qrCodeId;
	function getQrcode(){
		$.ajax({
	        type: "POST",
	        dataType : "json",//返回json格式的数据
	        url: "getLoginInQrcodeCode",
	        success: function(message){
	        	if(message.success){
	        		$("#qrcodeInfo").attr("src","../loadImg?imgPath="+message.qrcodefile);
	        		$("#qrcodeDiv").show();
	        		qrCodeId = message.qrCodeId;
	        		
	        		//建立websocket
	        		if (window.location.protocol == 'http:') {  
		            	 if ('WebSocket' in window) {
		                     url = 'ws://' + window.location.host + '/ssm-demo-test/websocket';  
		                 } else if ('MozWebSocket' in window) {
		                	 url = 'ws://' + window.location.host + '/ssm-demo-test/websocket';
		                 } else {
		                	 url = 'ws://' + window.location.host + '/ssm-demo-test/js/websocket';
		                 }
	            	 } else {
	            		 if ('WebSocket' in window) {
		                     url = 'ws://' + window.location.host + '/ssm-demo-test/websocket';  
		                 } else if ('MozWebSocket' in window) {
		                	 url = 'ws://' + window.location.host + '/ssm-demo-test/websocket';  
		                 } else {
		                	 url = 'ws://' + window.location.host + '/ssm-demo-test/js/websocket';  
		                 }
	            	 }
	            	 
	                alert("url:"+url);  
	                if (!url) {  
	                    alert('Select whether to use W3C WebSocket or SockJS');  
	                    return;  
	                }  
	      
	                ws = (url.indexOf('js') != -1) ?   
	                    new SockJS(url, undefined, {protocols_whitelist: transports}) : new WebSocket(url);  
	      
	                ws.onopen = function () { 
	                	alert("链接成功");
	                	//ws.send(message.qrCodeId);
	                };  
	                ws.onmessage = function (event) {
	                	var parsedJson = jQuery.parseJSON(event.data);
	                	if(parsedJson.type == "scan"){
		                	$("#qrcodeDiv").hide();
			        		$("#confirm").show();
	                	} else if(parsedJson.type == "confirm"){
	                		$("#confirm").hide();
	                		$("#login").show();
	                		ws.close();
	                	}
		        		
	                };  
	                ws.onclose = function (event) {  
	                	alert("断开链接");
	                };  
	        	}
	        }
	    });
	}
	function isScaned()
	{
		$.ajax({
	        type: "POST",
	        dataType : "json",//返回json格式的数据
	        url: "websocket/isScaned",
	        data: {
	        	qrCodeId : qrCodeId
	        },
	        success: function(message){
	        	if(message.success){
	        		$("#qrcodeDiv").hide();
	        		$("#confirm").show();
	        		window.clearInterval(c);
	        		d = setInterval(isConfirmed,1000);
	        	}
	        }
	    });
	}
	function isConfirmed()
	{
		$.ajax({
	        type: "POST",
	        dataType : "json",//返回json格式的数据
	        url: "websocket/isConfirmed",
	        data: {
	        	qrCodeId : qrCodeId
	        },
	        success: function(message){
	        	if(message.success){
	        		$("#qrcodeDiv").hide();
	        		$("#confirm").hide();
	        		$("#login").show();
	        		window.clearInterval(d);
	        	}
	        }
	    });
	}
</script>
</head>
<body>
	<button onclick="getQrcode()" >获取二维码</button>
	<div id="qrcodeDiv">
		二维码
		<img id="qrcodeInfo" alt="二维码" src="">
	</div>
	<div id="confirm">
		请确认
	</div>
	<div id="login">
		登陆成功
	</div>
	
</body>
</html>