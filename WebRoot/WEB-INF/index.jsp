<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<frameset rows="80px,*" border="0px">
	<frame name="top" src="${path }/common/top.action" scrolling="no" />	
	<frameset cols="200px,*" >
		<frame name="left" noresize src="${path }/common/left.action" scrolling="auto" />
		<frame name="main" src="${path }/owner/index.action" scrolling="auto" />
	</frameset>
</frameset>
<noframes></noframes>

</html>