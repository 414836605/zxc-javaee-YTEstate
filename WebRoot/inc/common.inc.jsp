<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<!-- font-awesome -->
<link href="${path }/third/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- ace -->
<link href="${path }/third/ace/ace.min.css" rel="stylesheet">
<!-- confirm -->
<link rel="stylesheet"
	href="${path }/third/confirm/jquery-confirm.min.css">
<!-- datepicker -->
<link rel="stylesheet"
	href="${path }/third/datepicker/datepicker.min.css">

<!--  -->
<script src="${path }/js/jquery-1.10.2.min.js"></script>

<script src="${path }/js/bootstrap.min.js"></script>

<!--dataTables scripts -->

<script src="${path }/third/ace/jquery.dataTables.min.js"></script>
<script src="${path }/third/ace/dataTables.bootstrap.min.js"></script>


<!-- ace scripts -->

<script src="${path }/third/ace/ace-elements.min.js"></script>
<script src="${path }/third/ace/ace.min.js"></script>

<!-- confirm -->
<script type="text/javascript"
	src="${path }/third/confirm/jquery-confirm.min.js"></script>

<!-- validform -->
<script type="text/javascript"
	src="${path }/third/validform/validform.js"></script>

<!-- datepicker -->
<script type="text/javascript"
	src="${path }/third/datepicker/datepicker.min.js"></script>
<script type="text/javascript"
	src="${path }/third/datepicker/i18n/datepicker.en.js"></script>

<style>
/*---------- datatables ------------*/
.table-responsive div,table,label {
	font-size: 16px !important;
}

.col-th { /*color: #307ecc;*/
	text-align: center;
}

/*---------- other ------------*/
.w-400 {
	width: 400px;
}

/*---------- Validform_checktip ------------*/
.Validform_checktip {
	color: #999;
	font-size: 12px;
	height: 20px;
	line-height: 20px;
	overflow: hidden;
}

.Validform_right {
	color: #71b83d;
}

.Validform_wrong {
	color: red;
}

.Validform_loading {
	
}

.Validform_error {
	background-color: #ffe7e7;
}

/*---------- table-search ------------*/
.table-search {
	background-color: #ddd;
	height: 100px;
}

.table-search-body {
	float: left;
	height: 80px;
	margin: 10px 0;
}

.table-search-row {
	padding-top: 10px;
	padding-left: 10px;
	width: 500px;
}

.table-search a {
	float: left;
	height: 50px;
	margin: 25px 0;
}
</style>


<script type="text/javascript">
	var format_time = function(data) {
		return new Date(parseInt(data)).toLocaleString().replace(/:\d{1,2}$/,
				' ');
	};
</script>
