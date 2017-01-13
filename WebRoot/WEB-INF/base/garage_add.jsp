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
				<li class="active">添加车库信息</li>
			</ol>
		</div>
		<div class="panel-body">
			
			<div class="w-400">
				<h2 style="text-align: center">添加车库信息</h2>
				<form id="valid_form" class="form-horizontal" action="${path }/garage/insert.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">车库面积</label>
						<div class="col-sm-8">
							<input type="text" name="garageArea" class="form-control" placeholder="车库面积"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">车库费用</label>
						<div class="col-sm-8">
							<input type="text" name="garageFee" class="form-control" placeholder="车库费用"></div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="添加">
						</div>
						<div class="col-sm-offset-1 col-sm-5">
							<a href="${path }/garage/index.action" class="btn btn-default">取消</a>
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
			    content: '增加成功',
			    confirmButton: 'OK',
			    cancelButton: false,
			    autoClose: 'confirm|2000',
			    confirm: function(){
			       $('input[type!=submit]').val('');
			    }
			});
			
			
			
		}else if (data == '0') {
			$.alert({
			    title: '警告',
			    content: '内部发生错误，增加失败',
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