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
				<li class="active">材料设备采购审批</li>
			</ol>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table id="sample-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>申请人</th>
							<th>申请物品</th>
							<th>数量</th>
							<th>价格</th>
							<th>用途</th>
							<th>手机</th>
							<th>申请时间</th>
							<th>未通过原因</th>
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
							"ajax" : '${path }/buy/page.action',

							"columns" : [
									{
										"data" : "buyName"
									},
									{
										"data" : "buyItem"
									},
									{
										"data" : "buyNum"
									},
									{
										"data" : "buyCoast"
									},
									{
										"data" : "buyUse"
									},
									{
										"data" : "buyPhone"
									},
									{
										"data" : "buyTime",
										"render" : function(data) {
											return new Date(parseInt(data))
													.toLocaleString().replace(
															/:\d{1,2}$/, ' ');
										},
									},
									{
										"data" : "buyReply"
									},
									{
										"data" : null,
										"render" : function(data) {
											if(data.buyStatus == 0){
												return '<span class="text-muted">未审批</span>';
											}else if(data.buyStatus == 1){
												return '<span class="text-success">通过审批</span>';
											}else if(data.buyStatus == 2){
												return '<span class="text-danger">未通过审批</span>';
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
	</script>
</body>
</html>






