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
				<li class="active">添加业主信息</li>
			</ol>
		</div>
		<div class="panel-body">
			
			<div class="w-400">
				<h2 style="text-align: center">添加业主信息</h2>
				<form class="form-horizontal" id="valid_form"
					action="${path }/emp/insert.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">员工姓名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empName"
								datatype="*" placeholder="员工姓名">
							<span class="Validform_checktip"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">所在部门</label>
						<div class="col-sm-8">
							<select class="form-control" name="deptId">
								<option value="1">开发部</option>
								<option value="2">服务部</option>
								<option value="3">维修部</option>
								<option value="4">人事部</option>
								<option value="5">财务部</option>
								<option value="6">收费部</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">服务名称</label>
						<div class="col-sm-8">
							<select class="form-control" name="jobId">
								<option value="1">开发者</option>
								<option value="2">普通员工</option>
								<option value="3">维修工</option>
								<option value="4">人资干事</option>
								<option value="5">会计</option>
								<option value="6">收费员</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-8">
							<input type="radio" value="男" name="empSex" checked>男&nbsp;&nbsp;
							<input type="radio" value="女" name="empSex">女
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">电子邮件</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empEmail"
								datatype="*" placeholder="电子邮件">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">电话</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empPhone"
								datatype="*" placeholder="电话">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">住址</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empAddress"
								datatype="*" placeholder="住址">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">个人信息</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empInfo"
								datatype="*" placeholder="个人信息">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="添加">
						</div>
						<div class="col-sm-offset-1 col-sm-5">
							<a href="${path }/emp/index.action" class="btn btn-default">取消</a>
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