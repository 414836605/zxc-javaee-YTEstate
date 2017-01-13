<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link href="${path }/third/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path }/third/sidebar/sidebar-menu.css">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
html{
	background-color: #438EB9;
}

.main-sidebar{
    height: 100%;
    min-height: 100%;
    width: 200px;
    background-color: #438EB9;
    font-size: 18px;
 }
 .main-sidebar .sidebar-menu .treeview-menu > li > a{
	font-size: 16px;
}
</style>
</head>
<body>
	<aside class="main-sidebar">
		<section  class="sidebar">
			<ul class="sidebar-menu">
				<li class="treeview">
					<a href="#"> <i class="fa fa-th"></i>
						<span>基础信息</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a target="main" href="${path }/owner/index.action" >
								业主信息
							</a>
						</li>
						<li>
							<a target="main" href="${path }/build/index.action">
								楼宇信息
							</a>
						</li>
						<li>
							<a target="main" href="${path }/garage/index.action">
								车库信息
							</a>
						</li>
						<li>
							<a target="main" href="${path }/park/index.action">
								车位信息
							</a>
						</li>
					</ul>
				</li>
				<!-- 基础信息 -->
				<li class="treeview">
					<a href="#"> <i class="fa fa-credit-card"></i>
						<span>收费信息</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a target="main" href="${path }/fee/index.action">
								业主缴费信息
							</a>
						</li>
					</ul>
				</li>
				<!-- 收费信息 -->
				<li class="treeview">
					<a href="#"> <i class="fa fa-calendar-check-o"></i>
						<span>日常管理</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a target="main" href="${path }/buy/buy_application.action">
								材料设备采购申请
							</a>
						</li>
						<li>
							<a target="main" href="${path }/buy/buy_check.action">
								材料设备采购审批
							</a>
						</li>
						<li>
							<a target="main" href="${path }/buy/buy_detail.action">
								材料设备验收明细
							</a>
						</li>
						<li>
							<a target="main" href="${path }/maintain/maintain_application.action">
								小区维修申请
							</a>
						</li>
						<li>
							<a target="main" href="${path }/maintain/maintain_check.action">
								小区维修审批
							</a>
						</li>
						<li>
							<a target="main" href="${path }/maintain/maintain_accept.action">
								小区维修验收
							</a>
						</li>
					</ul>
				</li>
				<!-- 日常管理 -->
				<li class="treeview">
					<a href="#"> <i class="fa fa-male"></i>
						<span>人事管理</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a target="main" href="${path }/emp/index.action">
								从业人员信息
							</a>
						</li>
						<li>
							<a target="main" href="${path }/entry/entry_application.action">
								入职审请
							</a>
						</li>
						<li>
							<a target="main" href="${path }/entry/entry_check.action">
								入职审批
							</a>
						</li>
						<li>
							<a target="main" href="${path }/entry/regularworker_check.action">
								转正审批
							</a>
						</li>
						<li>
							<a target="main" href="${path }/leave/leave_application.action">
								请假审请
							</a>
						</li>
						<li>
							<a target="main" href="${path }/leave/leave_check.action">
								请假审批
							</a>
						</li>
						<li>
							<a target="main" href="${path }/leave/leave_cancel.action">
								销假
							</a>
						</li>
						<!-- 
						<li>
							<a href="#">
								考勤录入
							</a>
						</li>
						 -->
					</ul>
				</li>
				<!-- 人事管理 -->
				<li class="treeview">
					<a href="#"> <i class="fa fa-rmb"></i>
						<span>财务管理</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a target="main" href="${path }/finace/income.action">
								收入信息查询
							</a>
						</li>
						<li>
							<a target="main" href="${path }/finace/expend.action">
								支出信息查询
							</a>
						</li>
						<li>
							<a target="main" href="${path }/finace/salary.action">
								工资明细查询
							</a>
						</li>
					</ul>
				</li>
				<!-- 财务管理 -->
				<li class="treeview">
					<a href="#"> <i class="fa fa-table"></i>
						<span>统计报表</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li>
							<a target="main" href="${path }/statistics/income.action">
								收入信息表
							</a>
						</li>
						<li>
							<a target="main" href="${path }/statistics/expend.action">
								支出信息表
							</a>
						</li>
						<li>
							<a target="main" href="${path }/statistics/salary.action">
								工资统计表
							</a>
						</li>
					</ul>
				</li>
				<!-- 统计报表 -->
			</ul>
		</section>
	</aside>
<script src="${path }/js/jquery-1.10.2.min.js"></script>
<script src="${path }/third/sidebar/sidebar-menu.js"></script>
<script>$.sidebarMenu($('.sidebar-menu'))</script>
</body>
</html>