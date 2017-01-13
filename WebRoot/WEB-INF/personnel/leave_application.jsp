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
				<li><span class="text-primary">人事管理</span></li>
				<li class="active">请假申请</li>
			</ol>
		</div>
		<div class="panel-body">

			<div class="w-400">
				<h2 style="text-align: center">请假申请</h2>
				<form class="form-horizontal" id="valid_form"
					action="${path }/leave/insert.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">员工姓名</label>
						<div class="col-sm-8">
							<input disabled type="text" class="form-control"
								datatype="*" placeholder="员工姓名" value="${emp.empName }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">职位</label>
						<div class="col-sm-8">
							<select disabled class="form-control disable">
								<option value="1"
									<c:if test="${emp.jobId == 1}">
										selected="selected"
									</c:if>>开发者</option>
								<option value="2"
									<c:if test="${emp.jobId == 2}">
										selected="selected"
									</c:if>>普通员工</option>
								<option value="3"
									<c:if test="${emp.jobId == 3}">
										selected="selected"
									</c:if>>维修工</option>
								<option value="4"
									<c:if test="${emp.jobId == 4}">
										selected="selected"
									</c:if>>人资干事</option>
								<option value="5"
									<c:if test="${emp.jobId == 5}">
										selected="selected"
									</c:if>>会计</option>
								<option value="6"
									<c:if test="${emp.jobId == 6}">
										selected="selected"
									</c:if>>收费员</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">手机</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empleavePhone"
								datatype="*" placeholder="电话" value="${emp.empPhone }">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">请假原因</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empleaveReason"
								datatype="*" placeholder="请假原因">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">请假天数</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empleaveDay"
								datatype="*" placeholder="请假天数">
						</div>
					</div>
					
					
					
					<div class="form-group" style="display: none;">
						<label class="col-sm-4 control-label">员工姓名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empleaveName"
								datatype="*" placeholder="员工姓名" value="${emp.empName }">
						</div>
					</div>
					<div class="form-group" style="display: none;">
						<label class="col-sm-4 control-label">职位</label>
						<div class="col-sm-8">
						<input type="text" class="form-control" name="jobId"
								datatype="*" placeholder="职位" value="${emp.jobId }">
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