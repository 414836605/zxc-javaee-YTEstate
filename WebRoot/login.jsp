<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="${path }/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/third/ace/ace.min.css">

<script type="text/javascript" src="${path }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${path }/js/bootstrap.min.js"></script>
<!-- confirm -->
<link rel="stylesheet"
	href="${path }/third/confirm/jquery-confirm.min.css">
<script type="text/javascript"
	src="${path }/third/confirm/jquery-confirm.min.js"></script>

</head>
<style>
h1 {
	padding: 20px 0px;
}

.w-300 {
	width: 300px;
}
</style>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="login-container">
					<div class="center">
						<h1>
							<span class="white">银通物业登录</span>

						</h1>
					</div>

					<div class="space-6"></div>

					<div class="position-relative">
						<div id="login-box" class="login-box visible widget-box no-border">
							<div class="widget-body">
								<div class="widget-main">
									<h4 class="header blue lighter bigger">请输入登录信息</h4>

									<div class="space-6"></div>

									<fieldset>
										<label class="block clearfix"> <span
											class="block input-icon input-icon-right"> <span>用户名</span>
												<input id="empUser" type="text" class="form-control"
												placeholder="请输入用户名" /> </span> </label> <label class="block clearfix">
											<span class="block input-icon input-icon-right"> <span>密码</span>
												<input id="empPassword" type="password" class="form-control"
												placeholder="请输入密码" /> </span> </label>

										<div class="space"></div>

										<div class="clearfix">

											<button id="login" type="button"
												class="w-300 btn btn-sm btn-primary">登陆</button>
										</div>

										<div class="space-4"></div>
									</fieldset>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- login-container -->
			</div>
			<!-- row -->
		</div>
		<!-- main-content -->
	</div>
	<!-- main-container -->

	<script>
		$("document").ready(function() {
			//防止在frame里面出现登录页面  
			if (top.location !== self.location) { 
				top.location.href = self.location.href;
			}
			
			$("body").keydown(function(event) {
			//回车键登陆
			    if (event.keyCode == "13") {
			        $('#login').click();
			    }
			});    
		});
		
		/*用户登录*/
		$(function() {
			$('#login').click(function(e) {
				var usernameVal = $('#empUser').val();
				var passwordVal = $('#empPassword').val();
				$.post('${path }/common/login.action', {
					empUser : usernameVal,
					empPassword : passwordVal
				}, function(data) {
					var state = data['state'];
					if (state == '0') {
						$.alert({
							title : '警告',
							content : '用户名错误',
							confirmButton : '我知道了',
							confirmButtonClass : 'btn-info'
						});
					} else if (state == '1') {
						window.top.location.href = 'common/index.action';
					}
				});
			});
		});
	</script>
</body>
</html>
