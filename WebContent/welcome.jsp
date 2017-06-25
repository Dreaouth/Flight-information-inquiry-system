<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="information.Users"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html style="overflow-y: hidden;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="package/css/H-ui.css" rel="stylesheet" type="text/css" />
<link href="package/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="package/font/font-awesome.min.css" type="text/css"
	rel="stylesheet" />
<title>航班信息系统主页面</title>
</head>
<body>
	<%
		Users a = (Users) request.getAttribute("users");
		String title = a.getStatus() + "：" + a.getUsername();
		String status = a.getStatus();
	%>
	<header class="Hui-header cl">
		<a class="Hui-logo l" title="H-ui.admin v2.1" href="welcome.jsp">中国航空客户服务系统后台管理系统</a>
		<a class="Hui-logo-m l" href="welcome.jsp" title="H-ui.admin">my12306</a>
		<span class="Hui-subtitle l">V1.0</span> <span class="Hui-userbox"><span
			class="c-white"><%=title%></span> <a
			class="btn btn-danger radius ml-10" href="login.jsp" title="退出"><i
				class="icon-off"></i> 退出</a></span> <a aria-hidden="false"
			class="Hui-nav-toggle" id="nav-toggle" href="#"></a>
	</header>
	<div class="cl Hui-main">
		<aside class="Hui-aside" style="">
			<input runat="server" id="divScrollValue" type="hidden" value="" />
			<div class="menu_dropdown bk_2">
				<dl id="menu-user">
					<dt>
						<i class="icon-user"></i> 信息查询<b></b>
					</dt>
					<dd>
						<ul>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("数据管理员") == 0) {
								%><a _href="QueryServlet?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>城市查询
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("数据管理员") == 0) {
								%><a _href="QueryPlane?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>航班查询
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("数据管理员") == 0) {
								%><a _href="QueryplaneName?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>机型查询
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("数据管理员") == 0) {
								%><a _href="QueryCompany?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>航空公司查询
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("数据管理员") == 0) {
								%><a _href="Queryticket?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>机票查询
								</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-comments">
					<dt>
						<i class="icon-comments"></i> 计划管理<b></b>
					</dt>
					<dd>
						<ul>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("计划管理员") == 0) {
								%><a _href="add_airport.jsp"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>添加机场
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("计划管理员") == 0) {
								%><a _href="add_plane.jsp"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>添加航班
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("计划管理员") == 0) {
								%><a _href="add_mode.jsp"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>添加机型
								</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-article">
					<dt>
						<i class="icon-edit"></i> 调度管理<b></b>
					</dt>
					<dd>
						<ul>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("调度管理员") == 0) {
								%><a _href="UpdateAirport?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>更改城市(机场)
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("调度管理员") == 0) {
								%><a _href="UpdatePlane?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>更改航班
								</a>
							</li>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("调度管理员") == 0) {
								%><a _href="UpdateMode?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>更改机型
								</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-picture">
					<dt>
						<i class="icon-picture"></i> 财务管理<b></b>
					</dt>
					<dd>
						<ul>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0 || status.compareTo("财务管理员") == 0) {
								%><a _href="UpdateTicket?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>更改机票
								</a>
							</li>
						</ul>
					</dd>
				</dl>
				<dl id="menu-product">
					<dt>
						<i class="icon-beaker"></i> 用户管理<b></b>
					</dt>
					<dd>
						<ul>
							<li>
								<%
									if (status.compareTo("超级管理员") == 0) {
								%><a _href="AdminServlet?action=showall"> <%
 	} else {
 %> <a _href="forbid.jsp"> <%
 	}
 %>用户管理
								</a>
							</li>
						</ul>
					</dd>
				</dl>
			</div>
		</aside>
		<div class="dislpayArrow">
			<a class="pngfix" href="javascript:void(0);"></a>
		</div>
		<section class="Hui-article">
			<div id="Hui-tabNav" class="Hui-tabNav">
				<div class="Hui-tabNav-wp">
					<ul id="min_title_list" class="acrossTab cl">
						<li class="active"><span title="我的桌面"
							data-href="welcome.html">欢迎访问</span><em></em></li>
					</ul>
				</div>
				<div class="Hui-tabNav-more btn-group">
					<a id="js-tabNav-prev" class="btn radius btn-default btn-small"
						href="javascript:;"><i class="icon-step-backward"></i></a><a
						id="js-tabNav-next" class="btn radius btn-default btn-small"
						href="javascript:;"><i class="icon-step-forward"></i></a>
				</div>
			</div>
			<div id="iframe_box" class="Hui-articlebox">
				<div class="show_iframe">
					<div style="display: none" class="loading"></div>
					<iframe scrolling="yes" frameborder="0" src="load.jsp"></iframe>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="package/js/jquery.min.js"></script>
	<script type="text/javascript" src="package/js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript" src="package/layer/layer.min.js"></script>
	<script type="text/javascript" src="package/js/H-ui.js"></script>
	<script type="text/javascript" src="package/js/H-ui.admin.js"></script>
</body>
</html>