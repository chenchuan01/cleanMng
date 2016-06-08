<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="base/baseh.jspf" %>
	<!-- TABLE CLOTH -->
	<link rel="stylesheet" type="text/css" href="${ctx }/static/js/tablecloth/css/tablecloth.min.css" />
	<!-- FONTS -->
	<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
		<div class="container">
				<div class="navbar-brand">
					<!-- COMPANY LOGO -->
					
					<h3 style="display: inline;color: #fff;">
						<img src="${ctx }/static/img/logo/logo.jpg"  alt="logo name" /><b>嘉阳保洁业务系统 </b>
					</h3>
					<!-- /COMPANY LOGO -->
				</div>
				<!-- COMPANY LOGO -->
				
				<!-- /COMPANY LOGO -->
				<!-- BEGIN TOP NAVIGATION MENU -->					
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown" id="header-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-user"></i>
							<span class="username">${sysuser.name }(${sysuser.userName })</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="javascript:;" onclick="autoWin('信息修改', 'sys/userForm.do?id=${sysuser.id}',300,350)"><i class="fa fa-cog"></i>信息修改</a></li>
							<li><a href="login/logout.do"><i class="fa fa-power-off"></i> 安全退出</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-cog"></i>
							<span class="name">设置</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu skins">
							<li class="dropdown-title">
								<span><i class="fa fa-leaf"></i>网站主题</span>
							</li>
							<li><a href="javascript:;" data-skin="default">默认</a></li>
							<li><a href="javascript:;" data-skin="night">夜晚</a></li>
							<li><a href="javascript:;" data-skin="earth">地球</a></li>
							<li><a href="javascript:;" data-skin="nature">自然</a></li>
							<li><a href="javascript:;" data-skin="graphite">石墨</a></li>
						 </ul>
					</li>
				</ul>
				<!-- END TOP NAVIGATION MENU -->
		</div>
	</header>
	<!--/HEADER -->
	<!-- PAGE -->
	<section id="page">
		<div id="sidebar" class="sidebar">
					<div class="sidebar-menu nav-collapse">
						<!-- SIDEBAR MENU -->
						<ul>
							<%-- <c:if test="${'0' eq sysuser.roles }">
							<li><a class="pageViewItem" onclick="pageView('${ctx}/item/servList.do');"><i class="fa fa-th-large"></i> <span class="menu-text">保洁服务</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/plan/myissue.do');"><i class="fa fa-th"></i><span class="menu-text">我的服务</span></a></li>
							</c:if> --%>
							<c:if test="${'1' eq sysuser.roles }">
							<li><a class="pageViewItem" onclick="pageView('${ctx}/plan/myissue.do');"><i class="fa fa-th"></i><span class="menu-text">我的服务</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/myuserInfo.do');"><i class="fa fa-user"></i> <span class="menu-text">个人信息</span></a></li>
							</c:if>
							<c:if test="${'2' eq sysuser.roles }">
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/planMng.do');"><i class="fa fa-check-square-o"></i><span class="menu-text">预约管理</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/userMng.do');"><i class="fa fa-users"></i><span class="menu-text">用户管理</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/empMng.do');"><i class="fa fa-sitemap"></i><span class="menu-text">保洁人员</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/toolMng.do');"><i class="fa fa-wrench"></i><span class="menu-text">工具管理</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/itemMng.do');"><i class="fa fa-th-large"></i><span class="menu-text">服务管理</span></a></li>
							<li><a class="pageViewItem" onclick="pageView('${ctx}/home/configMng.do');"><i class="fa fa-gear"></i><span class="menu-text">系统配置 </span></a></li>
							</c:if>
						</ul>
						<!-- /SIDEBAR MENU -->
					</div>
				</div>
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="pageContent"></div>
					<div class="footer-tools">
							<span class="go-top">
								<i class="fa fa-chevron-up"></i> Top
							</span>
						</div>
					</div>
					<!-- /CONTENT-->
				<div class="separator"></div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
	
	
	<%@include file="base/basef.jspf" %>
	<!-- TABLE CLOTH -->
	<script type="text/javascript" src="${ctx }/static/js/tablecloth/js/jquery.tablecloth.js"></script>
	<script type="text/javascript" src="${ctx }/static/js/tablecloth/js/jquery.tablesorter.min.js"></script>
	<script>
		var sysuser = {
				'roles':'${sysuser.roles}',
				'name':'${sysuser.name}',
				'userName':'${sysuser.userName}'
		};
		jQuery(document).ready(function() {		
			App.setPage("simple_table");  //Set current page
			App.init(); //Initialise plugins and elements
			if(0==sysuser.roles){
				 pageView('${ctx}/item/servList.do');
			}else if(1==sysuser.roles){
				pageView('${ctx}/plan/myissue.do');
			}else if(2==sysuser.roles){
				pageView('${ctx}/home/planMng.do');
			}
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>
