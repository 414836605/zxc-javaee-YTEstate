<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>登陆</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/third/ace/ace.min.css">

<script type="text/javascript" src="${path }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap.min.js"></script>
<!-- confirm -->
<link rel="stylesheet" href="${path }/third/confirm/jquery-confirm.min.css">
<script type="text/javascript" src="${path }/third/confirm/jquery-confirm.min.js"></script>

</head>
<style>
h1{
	padding: 20px 0px;
}
.w-300{
	width: 300px;
}
</style>

<body class="login-layout">
<div class="main-container">
	<div class="main-content">
		<h2>权限不足</h2>
		<a href="${path }/common/index.action">返回主页面</a>
	</div>
	<!-- main-content -->
</div>
<!-- main-container -->

<script>
/*用户登录*/
$(function(){
$('#login').click(function(e) {
	var usernameVal = $('#empUser').val();
	var passwordVal = $('#empPassword').val();
	$.post('${path }/common/login.action',{empUser:usernameVal,
	empPassword:passwordVal}, function(data){											
		var state = data['state'];
		if (state == '0') {
			$.alert({
			    title: '警告',
			    content: '用户名错误',
			    confirmButton: '我知道了',
			    confirmButtonClass: 'btn-info'
			});
		} else if (state == '1') {
			window.top.location.href = 'common/index.action';
		}
	});	
});
});

</script>
</body>
</html>
