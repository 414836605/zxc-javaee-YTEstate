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
				<form class="form-horizontal" id="valid_form" action="${path }/owner/insert.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-8">
						
							<input type="text" class="form-control" name="ownerName" datatype="*" errormsg="请输入1-6位任意字符" placeholder="姓名">
							<span class="Validform_checktip"></span>
						</div>
						
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">身份证号</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerPerid" datatype="*" errormsg="请输入18位身份证号" placeholder="身份证号"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-8">
							<input type="radio" value="男" name="ownerSex" checked="checked">男&nbsp;&nbsp;
                    		<input type="radio" value="女" name="ownerSex">女
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">手机</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerPhone" datatype="*" placeholder="手机"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">邮箱</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerEmail" datatype="*" placeholder="邮箱"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">家庭成员</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerInfo" datatype="*" placeholder="家庭成员"></div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="添加">
						</div>
						<div class="col-sm-offset-1 col-sm-5">
							<a href="${path }/owner/index.action" class="btn btn-default">取消</a>
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