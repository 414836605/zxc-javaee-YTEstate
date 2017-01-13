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
				<li class="active">修改员工信息</li>
			</ol>
		</div>
		<div class="panel-body">

			<div class="w-400">
				<h2 style="text-align: center">修改员工信息</h2>
				<form class="form-horizontal" id="valid_form"
					action="${path }/emp/update.action">
					<div class="form-group">
						<label class="col-sm-4 control-label">员工姓名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empName"
								datatype="*" placeholder="员工姓名" value="${emp.empName }">
							<span class="Validform_checktip"></span>
						</div>

					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">所在部门</label>
						<div class="col-sm-8">
							<select class="form-control" name="deptId">
								<option value="1"
									<c:if test="${emp.deptId == 1}">
										selected="selected"
									</c:if>>开发部</option>
								<option value="2"
									<c:if test="${emp.deptId == 2}">
										selected="selected"
									</c:if>>服务部</option>
								<option value="3"
									<c:if test="${emp.deptId == 3}">
										selected="selected"
									</c:if>>维修部</option>
								<option value="4"
									<c:if test="${emp.deptId == 4}">
										selected="selected"
									</c:if>>人事部</option>
								<option value="5"
									<c:if test="${emp.deptId == 5}">
										selected="selected"
									</c:if>>财务部</option>
								<option value="6"
									<c:if test="${emp.deptId == 6}">
										selected="selected"
									</c:if>>收费部</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">服务名称</label>
						<div class="col-sm-8">
							<select class="form-control" name="jobId">
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
						<label class="col-sm-4 control-label">性别</label>
						<div class="col-sm-8">
							<input type="radio" value="男" name="empSex"
								<c:if test="${emp.empSex == '男'}">
								checked="checked"
							</c:if>>男&nbsp;&nbsp;
							<input type="radio" value="女" name="empSex"
								<c:if test="${emp.empSex == '女'}">
								checked="checked"
							</c:if>>女
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label">电子邮件</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empEmail"
								datatype="*" placeholder="电子邮件" value="${emp.empEmail }">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">电话</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empPhone"
								datatype="*" placeholder="电话" value="${emp.empPhone }">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">住址</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empAddress"
								datatype="*" placeholder="住址" value="${emp.empAddress }">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-4 control-label">个人信息</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="empInfo"
								datatype="*" placeholder="个人信息" value="${emp.empInfo }">
						</div>
					</div>
					<div class="form-group" style="display:none;">
						<label class="col-sm-4 control-label">id</label>
						<div class="col-sm-8">
							<input type="text" name="empId" value="${emp.empId }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" class="btn btn-info" value="修改">
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
		$(function() {
			$('#valid_form').Validform({
				tiptype : 4,
				ajaxPost : true,

				callback : function(data) {

					if (data == '1') {
						$.confirm({
							title : '提示信息',
							content : '修改成功',
							confirmButton : 'OK',
							cancelButton : false,
							autoClose : 'confirm|2000',
							confirm : function() {
								location.href = "${path }/emp/index.action";
							}
						});

					} else if (data == '0') {
						$.alert({
							title : '警告',
							content : '内部发生错误，修改失败',
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