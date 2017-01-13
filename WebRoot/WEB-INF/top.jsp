<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet" type="text/css" href="${path }/css/bootstrap.min.css">
<style>
*{
	margin: 0;
	padding: 0;
}
.navbar {
    background: #438eb9 none repeat scroll 0 0;
    border: 0 none;
    border-radius: 0;
    box-shadow: none;
    margin: 0;
    min-height: 80px;
    padding-left: 0;
    padding-right: 0;
    position: relative;
    line-height:80px;
}
.navbar-container {
    padding-left: 10px;
    padding-right: 20px;
}
.navbar .navbar-header {
    margin: 0 !important;
}
.navbar .navbar-brand {
    color: #fff;
    font-size: 30px;
    text-shadow: none;
    padding: 25px 0px;
    margin: 0px;
}
.navbar .navbar-brand:hover{
	color: #fff;
}


.user-info{
	line-height: 80px;
	margin: 0px;
}
</style>
</head>
<body>
<div id="navbar" class="navbar navbar-default">
	<div id="navbar-container" class="navbar-container">
		<div class="navbar-header pull-left">
			<h1 class="navbar-brand" href="#">
				银通物业管理系统
			</h1>
		</div>
		<div class="navbar-header pull-right">
			<h4 class="user-info">${emp.empRoleDetail }:${emp.empName}&nbsp;&nbsp;&nbsp;<a class="text-danger" href="${path }/logout.action" target="_top">注销</a></h4>
		</div>
	</div>
</div>
</body>
</html>