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
		  <li><span class="text-primary">日常管理</span></li>
		  <li class="active">小区维修验收</li>
		</ol>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table id="sample-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						<th>申请人</th>
						<th>申请维修项目</th>
						<th>描述</th>
						<th>手机</th>
						<th>申请时间</th>
						<th></th>
					</tr>
					</thead>

				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//dataTable
		var table = $('#sample-table')
				.DataTable(
						{
							"ordering" : false,
							"searching" : false,
							"serverSide" : true,
							"ajax" : '${path }/maintain/maintainNotAccept.action',

							"columns" : [
									{
										"data" : "maintainName"
									},
									{
										"data" : "maintainItem"
									},
									{
										"data" : "maintainPhone"
									},
									{
										"data" : "maintainDescribe"
									},
									{
										"data" : "maintainTime",
										"render" : function(data) {
											return new Date(parseInt(data)).toLocaleString().replace(/:\d{1,2}$/,' ');
										},
									},

									{
										"data" : "maintainId",
										"render" : function(data) {
											var pass = '<button class="btn btn-sm btn-success" onClick="pass('+ data + ')">通过验收</button>';
											var notpass = '<button class="btn btn-sm btn-danger" onClick="notpass('+ data + ')">未通过验收</button>';
											return pass + '&nbsp;&nbsp;&nbsp;' + notpass;
											
										},

									} 
									
									
							],

							"language" : {
								"processing" : "处理中...",
								"lengthMenu" : "显示 _MENU_ 项结果",
								"zeroRecords" : "没有匹配结果",
								"info" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
								"infoEmpty" : "显示第 0 至 0 项结果，共 0 项",
								"infoFiltered" : "(由 _MAX_ 项结果过滤)",
								"infoPostFix" : "",
								"search" : "搜索:",
								"searchPlaceholder" : "搜索...",
								"url" : "",
								"emptyTable" : "表中数据为空",
								"loadingRecords" : "载入中...",
								"infoThousands" : ",",
								"paginate" : {
									"first" : "首页",
									"previous" : "上页",
									"next" : "下页",
									"last" : "末页"
								},
								"aria" : {
									"paginate" : {
										first : '首页',
										previous : '上页',
										next : '下页',
										last : '末页'
									},
									"sortAscending" : ": 以升序排列此列",
									"sortDescending" : ": 以降序排列此列"
								},
								"decimal" : "-",
								"thousands" : "."
							},

						});

		//通过审批确认
		function pass(data) {
			$.confirm({
				title : '通过验收',
				content : '是否验收通过',
				confirmButton : '确认',
				cancelButton : '取消',
				confirmButtonClass : 'btn-danger',
				cancelButtonClass : 'btn-info',
				confirm : function() {
					var pay = '${path }/maintain/updatepass.action';
					$.post(pay, {
						'maintainId' : data,
						'maintainStatus' : 3
					}, function(data) {
						if (data == '1') {
							table.ajax.reload(null, false);
							$.confirm({
								title : '提示信息',
								content : '验收通过成功',
								confirmButton : 'OK',
								cancelButton : false,
								autoClose : 'confirm|2000',
							});

						} else if (data == '0') {
							$.alert({
								title : '警告',
								content : '内部发生错误，验收通过失败',
								confirmButton : '我知道了',
								confirmButtonClass : 'btn-info'
							});
						}
					});
				},
			});
		}
		
		//未通过审批确认
		function notpass(data) {
			$.confirm({
				title : '拒绝通过验收',
				content : '是否拒绝通过验收',
				confirmButton : '确认',
				cancelButton : '取消',
				confirmButtonClass : 'btn-danger',
				cancelButtonClass : 'btn-info',
				confirm : function() {
					var pay = '${path }/maintain/updatepass.action';
					$.post(pay, {
						'maintainId' : data,
						'maintainStatus' : 4
					}, function(data) {
						if (data == '1') {
							table.ajax.reload(null, false);
							$.confirm({
								title : '提示信息',
								content : '拒绝通过验收成功',
								confirmButton : 'OK',
								cancelButton : false,
								autoClose : 'confirm|2000',
							});

						} else if (data == '0') {
							$.alert({
								title : '警告',
								content : '内部发生错误，拒绝通过审批失败',
								confirmButton : '我知道了',
								confirmButtonClass : 'btn-info'
							});
						}
					});
				},
			});
		}
	</script>
</body>
</html>


		
		

							
