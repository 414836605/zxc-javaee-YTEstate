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
				<li class="active">工资明细查询</li>
			</ol>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<h2>工资支出</h2>
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
							<span>员工姓名：</span><input id="search-text" type="text">
						</div>
					</div>
					<a id="search-button" class="btn btn-lg btn-primary">查找</a>
				</div>
				<div class="table-responsive">
					<table id="sample-table"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th rowspan="2">员工编号</th>
								<th rowspan="2">员工姓名</th>
								<th rowspan="2">职务</th>
								<th rowspan="2">银行账号</th>
								<th rowspan="2">本月出勤</th>
								<th rowspan="2">日工资</th>
								<th rowspan="2">补工资</th>
								<th rowspan="2">计时工资</th>
								<th rowspan="2">满勤</th>

								<th colspan="2" class="col-th">加班工资</th>

								<th rowspan="2">补助</th>
								<th rowspan="2">餐补</th>
								<th rowspan="2">应领工资</th>

								<th colspan="4" class="col-th">扣款</th>


								<th rowspan="2">实领工资</th>
							</tr>
							<tr>

								<th>加班天数</th>
								<th>加班金额</th>


								<th>扣款话费</th>
								<th>扣款罚款</th>
								<th>扣款税金</th>
								<th>扣款保险</th>

							</tr>

						</thead>

					</table>
				</div>
			</div>
			<div>
				<a href="${path }/statistics/download_salary.action"
					class="btn btn-success">打印</a>
			</div>
		</div>
	</div>


	<script type="text/javascript">
	
		//dataTable
		$("#search-button").bind("click", function() { //按钮 触发table重新请求服务器
			table.draw();
		});

		var income;
		var table = $('#sample-table')
				.DataTable(
						{
							"ordering" : false,
							"searching" : false,
							"serverSide" : true,
							"ajax" : {
								"url" : '${path }/statistics/page_salary.action',
								"data" : function(searchdata) {
									searchdata.startTime = $("#search-start")
											.val();
									searchdata.endTime = $("#search-end")
											.val();
									searchdata.searchText = $("#search-text")
											.val();
								},
							},
							"columns" : [

									{
										"data" : "empId"
									},
									{
										"data" : "empName"
									},
									{
										"data" : "empJobDetail"
									},
									{
										"data" : "salaryBc"
									},
									{
										"data" : "salaryAttendance"
									},
									{
										"data" : "salaryDay"
									},
									{
										"data" : "salaryAdd"
									},
									{
										"data" : null,
										"render" : function(data) {
											return data.salaryAttendance
													* data.salaryDay;
										},
									},
									{
										"data" : "salaryFull"
									},
									{
										"data" : "salaryOvertimeDay"
									},
									{
										"data" : "salaryOvertimeMoney"
									},
									{
										"data" : "salarySubsidy"
									},
									{
										"data" : "salaryMeal"
									},
									{
										"data" : null,
										"render" : function(data) {
											income = (data.salaryAttendance * data.salaryDay)
													+ (data.salaryOvertimeDay * data.salaryOvertimeMoney)
													+ data.salaryAdd
													+ data.salaryFull
													+ data.salarySubsidy
													+ data.salaryMeal;
											return income;
										},
									},
									{
										"data" : "salaryDeductPhone"
									},
									{
										"data" : "salaryDeductFine"
									},
									{
										"data" : "salaryDeductTax"
									},
									{
										"data" : "salaryDeductInsurance"
									},
									{
										"data" : null,
										"render" : function(data) {
											return income
													- (data.salaryDeductPhone
															+ data.salaryDeductFine
															+ data.salaryDeductTax + data.salaryDeductInsurance);
										},
									} ],

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