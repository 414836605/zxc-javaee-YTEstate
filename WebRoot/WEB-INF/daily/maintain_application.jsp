<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/inc/common.inc.jsp"%>
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
				<li><span class="text-primary">日常管理</span>
				</li>
				<li class="active">小区维修申请</li>
			</ol>
		</div>
		<div class="panel-body">

			<div class="w-400">
				<h2 style="text-align: center">材料设备采购申请</h2>
				<form class="form-horizontal" id="valid_form"
					action="${path }/maintain/insert.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">申请人</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="maintainName"
								datatype="*" placeholder="申请人">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">申请维修项目</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="maintainItem"
								datatype="*" placeholder="申请维修项目">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">描述</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="maintainDescribe"
								datatype="*" placeholder="描述">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">手机</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="maintainPhone"
								datatype="*" placeholder="手机">
						</div>
					</div>
					

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="申请">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$('#valid_form').Validform({
				tiptype : 4,
				ajaxPost : true,

				callback : function(data) {

					if (data == '1') {
						$.confirm({
							title : '提示信息',
							content : '申请成功',
							confirmButton : 'OK',
							cancelButton : false,
							autoClose : 'confirm|2000',
							confirm : function() {
								$('input[type!=submit]').val('');
							}
						});

					} else if (data == '0') {
						$.alert({
							title : '警告',
							content : '内部发生错误，申请失败',
							confirmButton : '我知道了',
							confirmButtonClass : 'btn-info'
						});
					}
				}
			});
		});
	</script>
</body>
</html>