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
				<li class="active">修改业主信息</li>
			</ol>
		</div>
		<div class="panel-body">
			
			<div class="w-400">
				<h2 style="text-align: center">修改业主信息</h2>
				<form class="form-horizontal" id="valid_form" action="${path }/owner/update.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-8">
						
							<input type="text" class="form-control" name="ownerName" datatype="*" errormsg="请输入1-6位任意字符" placeholder="姓名" value="${owner.ownerName }">
							<span class="Validform_checktip"></span>
						</div>
						
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">身份证号</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerPerid" datatype="*" errormsg="请输入18位身份证号" placeholder="身份证号" value="${owner.ownerPerid }"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-8">
							<input type="radio" value="男" name="ownerSex" 
							<c:if test="${owner.ownerSex == '男'}">
								checked="checked"
							</c:if>
							>男&nbsp;&nbsp;
                    		<input type="radio" value="女" name="ownerSex"
                    		<c:if test="${owner.ownerSex == '女'}">
								checked="checked"
							</c:if>
                    		>女
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">手机</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerPhone" datatype="*" placeholder="手机" value="${owner.ownerPhone }"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">邮箱</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerEmail" datatype="*" placeholder="邮箱" value="${owner.ownerEmail }"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">家庭成员</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="ownerInfo" datatype="*" placeholder="家庭成员" value="${owner.ownerInfo }"></div>
					</div>
					<div class="form-group" style="display:none;">
						<label class="col-sm-4 control-label">id</label>
						<div class="col-sm-8">
							<input  type="text" name="ownerId" value="${owner.ownerId }"></div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="修改">
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
			    content: '修改成功',
			    confirmButton: 'OK',
			    cancelButton: false,
			    autoClose: 'confirm|2000',
			    confirm: function(){
			       location.href="${path }/owner/index.action";
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