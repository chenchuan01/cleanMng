<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="../base/baseh.jspf" %>
</head>
<body class="login">	
	<!-- PAGE -->
	<section id="page">
			<!-- LOGIN -->
			<section id="login" class="visible">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box-plain">
								<div id="logo">
								<a href="javascript:;"><img src="${ctx }/static/img/logo/logo.jpg"  alt="logo name" /></a>
								</div>
								<h6 class="bigintro">嘉阳保洁</h6>
								<div class="divide-40"></div>
								<form role="form" id="loginForm" action="login/verify.do" method="post">
								  <div class="form-group">
									<i class="fa fa-user"></i>
									<input type="text" class="form-control" id="login_username" placeholder="登录账号" name="userName" valid="required" valid-msg="请输入用户名"/>
								  </div>
								  <div class="form-group"> 
									<i class="fa fa-lock"></i>
									<input type="password" class="form-control" id="login_pwd" placeholder="密码" name="password" valid="required" valid-msg="请输入密码"/>
								  </div>
								  <div class="form-actions">
									<button type="button" class="btn btn-danger" onclick="valid('#loginForm',loginUser)">登录</button>
								  </div>
								</form>
								<div class="login-helpers">
									还没有账号? <a href="javascript:;" onclick="swapScreen('register');return false;">注册走这边!</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/LOGIN -->
			<!-- REGISTER -->
			<section id="register">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box-plain">
								<h2 class="bigintro">用户注册</h2>
								<div class="divide-40"></div>
								<form role="form" id="registForm" action="login/regist.do" method="post">
								  <div class="form-group">
									<i class="fa fa-font"></i>
									<input type="text" class="form-control" id="exampleInputName" placeholder="真实姓名" name="name"  valid="required" valid-msg="请输入姓名"/>
								  </div>
								  <div class="form-group">
									<i class="fa fa-phone"></i>
									<input type="text" class="form-control" id="exampleInputEmail1" placeholder="联系电话" name="tel"  valid="tel" />
								  </div>
								  <div class="form-group">
									<i class="fa fa-home"></i>
									<input type="text" class="form-control" id="exampleInputaddress" placeholder="家庭地址" name="address"  valid="required" />
								  </div>
								  <div class="form-group">
									<i class="fa fa-user"></i>
									<input type="text" class="form-control" id="exampleInputUsername" placeholder="登录账户(电话或姓名拼音)" name="userName"  valid="required" valid-msg="请输入用户名"/>
								  </div>
								  <div class="form-group"> 
									<i class="fa fa-lock"></i>
									<input type="password" class="form-control" id="exampleInputPassword1"  placeholder="系统登录密码" name="password"  valid="required" valid-msg="请输入密码"/>
								  	<input type="hiddden" name="roles" value="0"/>
								  </div>
								  <div class="form-actions">
									<button type="button" class="btn btn-success" onclick="valid('#registForm',registUser)">注册</button>
								  </div>
								</form>
								<div class="login-helpers">
									<a href="javascript:;" onclick="swapScreen('login');return false;"> 返回登录</a> <br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/REGISTER -->
	</section>
	<!--/PAGE -->
	<%@include file="../base/basef.jspf" %>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("login");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<script type="text/javascript">
		function swapScreen(id) {
			jQuery('.visible').removeClass('visible animated fadeInUp');
			jQuery('#'+id).addClass('visible animated fadeInUp');
		}
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>