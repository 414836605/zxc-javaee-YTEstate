<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/inc/common.inc.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
	<div class="panel panel-success">
		<div class="panel-heading">

			<ol class="breadcrumb">
				<li>
					<span class="text-primary">基础信息</span>
				</li>
				<li class="active">修改楼宇信息</li>
			</ol>
		</div>
		<div class="panel-body">
			
			<div class="w-400">
				<h2 style="text-align: center">修改楼宇信息</h2>
				<form id="valid_form" class="form-horizontal" action="${path }/build/update.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">楼宇类型</label>
						<div class="col-sm-8">
							<input type="text" name="buildType" value="${build.buildType }" class="form-control" placeholder="楼宇类型"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">楼宇面积</label>
						<div class="col-sm-8">
							<input type="text" name="buildArea" value="${build.buildArea }" class="form-control" placeholder="楼宇面积"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">楼宇费用</label>
						<div class="col-sm-8">
							<input type="text" name="buildFee" value="${build.buildFee }" class="form-control" placeholder="楼宇费用"></div>
					</div>
					<div class="form-group" style="display:none;">
						<label class="col-sm-4 control-label">id</label>
						<div class="col-sm-8">
							<input type="text" name="buildId" value="${build.buildId }" class="form-control"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="修改">
						</div>
						<div class="col-sm-offset-1 col-sm-5">
							<a href="${path }/build/index.action" class="btn btn-default">取消</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

<script>
$(function(){
$('#valid_form').Validform({
	tiptype:4,
	ajaxPost:true,
	
	callback:function(data){

		if (data == '1') {
			$.confirm({
			    title: '提示信息',
			    content: '修改成功',
			    confirmButton: 'OK',
			    cancelButton: false,
			    autoClose: 'confirm|2000',
			    confirm: function(){
			       location.href="${path }/build/index.action";
			    }
			});
			
		}else if (data == '0') {
			$.alert({
			    title: '警告',
			    content: '内部发生错误，修改失败',
			    confirmButton: '我知道了',
			    confirmButtonClass: 'btn-info'
			});
		}
	}
});
});
</script>
</body>
</html>