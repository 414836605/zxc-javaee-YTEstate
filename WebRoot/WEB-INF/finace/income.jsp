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
				<li><span class="text-primary">财务管理</span>
				</li>
				<li class="active">收入信息查询</li>
			</ol>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<h2>物业费收入汇总</h2>
				<div class="table-search">
					<div class="table-search-body">
						<div class="table-search-row">
							<span>时间：</span> <input id="search-start" type="text"
								data-language='en' class="datepicker-here"
								data-min-view="months" data-view="months"
								data-date-format="yyyy-MM-dd"> 到 <input id="search-end"
								type="text" type="text" class="datepicker-here"
								data-language='en' data-min-view="months" data-view="months"
								data-date-format="yyyy-MM-dd">
						</div>
						<div class="table-search-row">
							<span>业主姓名：</span><input id="search-text" type="text">
						</div>
					</div>
					<a id="search-button" class="btn btn-lg btn-primary">查找</a>
				</div>
				<table id="sample-table"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>编号</th>
							<th>业主编号</th>
							<th>业主姓名</th>
							<th>楼费</th>
							<th>车库费</th>
							<th>车位费</th>
							<th>总计</th>
							<th>缴费时间</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//dataTable

		$("#search-button").bind("click", function() { //按钮 触发table重新请求服务器
			table.draw();
		});

		var table = $('#sample-table').DataTable(
				{
					"ordering" : false,
					"searching" : false,
					"serverSide" : true,
					"ajax" : {
						"url" : '${path }/finace/page_fee.action',
						"data" : function(searchdata) {
							searchdata.startTime = $("#search-start").val();
							searchdata.endTime = $("#search-end").val();
							searchdata.searchText = $("#search-text").val();
						},
					},

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
								"data" : "feeBuild"
							},
							{
								"data" : "feeGarage"
							},
							{
								"data" : "feePark"
							},
							{
								"data" : "feeSum"
							},
							{
								"data" : "feeTime",
								"render" : function(data) {
									return new Date(parseInt(data))
											.toLocaleString().replace(
													/:\d{1,2}$/, ' ');
								},
							},

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