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
				<li><span class="text-primary">收费信息</span>
				</li>
				<li class="active">业主缴费信息</li>
			</ol>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table id="sample-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>物主编号</th>
							<th>物主名字</th>
							<th>缴费时间</th>
							<th>缴费状态</th>
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
							"ajax" : '${path }/fee/page.action',

							"columns" : [
									{
										"data" : "feeId"
									},
									{
										"data" : "ownerId"
									},
									{
										"data" : "ownerName"
									},
									{
										"data" : "feeTime",
										"render" : function(data) {
											return new Date(parseInt(data)).toLocaleString().replace(/:\d{1,2}$/,' ');
										},
									},

									{
										"data" : "feeType",
										"render" : function(data) {
											if (data == 1) {
												return '<span class="text-success">已缴费</span>';

											} else if (data == 0) {
												return '<span class="text-danger">未缴费</span>';
											}

										},
									},

									{
										"data" : null,
										"render" : function(data) {
											if(data["feeType"] == 1){
												return '<button id="pay_button" onClick="pay('
													+ data
													+ ')" class="btn btn-sm btn-success" disabled="disabled">已缴费</button>';
											}else if(data["feeType"] == 0){
												return '<button id="pay_button" onClick="pay('
													+ data["feeId"]
													+ ')" class="btn btn-sm btn-danger">缴费</button>';
											}
											
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

		//缴费确认
		function pay(data) {
			$.confirm({
				title : '缴费',
				content : '是否缴费，序号' + data,
				confirmButton : '确认',
				cancelButton : '取消',
				confirmButtonClass : 'btn-danger',
				cancelButtonClass : 'btn-info',
				confirm : function() {
					var pay = '${path }/fee/pay.action';
					$.post(pay, {
						'id' : data
					}, function(data) {
						if (data == '1') {
							table.ajax.reload(null, false);
							$.confirm({
								title : '提示信息',
								content : '缴费成功',
								confirmButton : 'OK',
								cancelButton : false,
								autoClose : 'confirm|2000',
							});

						} else if (data == '0') {
							$.alert({
								title : '警告',
								content : '内部发生错误，缴费失败',
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