<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
<link type="text/css" rel="stylesheet" href="package/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="package/font/font-awesome.min.css" />
<title>Insert title here</title>
<title>管理员列表</title>
</head>
<body>
<script type="text/javascript">
		function check() {
			var adminname = document.forms[0].adminname.value;//获取用户名所填的内容
			var newpassword = document.forms[0].newpassword.value;//获取所填的密码
			var newpassword2 = document.forms[0].newpassword2.value;//获取用户名所填的内容
			if (adminname == "") {
				alert("错误提示：用户名不能为空！");
				return false;
			}
			if (newpassword == "") {
				alert("错误提示：密码不能为空！");
				return false;
			}
			if (newpassword2 == "") {
				alert("错误提示：密码不能为空！");
				return false;
			}
		}
	</script>
	<nav class="Hui-breadcrumb"> <i class="icon-home"></i> 首页 <span
		class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span>
	管理员列表 <a class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="icon-refresh"></i></a></nav>
				<br>
	<div class="pd-20">
		<div class="text-c">
			<form class="Huiform" method="post" action="AdminServlet?action=addusers"
				id="loginform" onsubmit="return check()">
				<div id="span_name"></div>
				&nbsp; <input type="text" placeholder="帐号" autocomplete="off"
					id="adminname" name="adminname" class="input-text"
					onkeyup="validate()"> <input name="newpassword"
					id="newpassword" class="input-text" type="password"
					placeholder="设置密码" tabindex="2"
					 > <input
					name="newpassword2" id="newpassword2" class="input-text"
					type="password" placeholder="确认新密码" tabindex="3" >
				<select class="select" id="status" name="status">
					<option value="超级管理员">超级管理员</option>
					<option value="信息管理员">信息管理员</option>
					<option value="计划管理员">计划管理员</option>
					<option value="调度管理员">调度管理员</option>
					<option value="财务管理员">财务管理员</option>
				</select>
				<button type="submit" class="btn btn-success"
					id="admin-password-save" name="admin-password-save">
					<i class="icon-plus"></i> 添加
				</button>
			</form>
		</div>
		<br> <br>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="7">管理员列表</th>
				</tr>
				<tr class="text-c">
					<th width="40">ID</th>
					<th width="150">登录名</th>
					<th width="250">角色</th>
					<th width="150">密码</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist}" var="temp">
					<tr class="text-c">
						<td>${temp.id}</td>
						<td>${temp.username}</td>
						<td>${temp.password}</td>
						<td>${temp.status}</td>
						<td class="f-14 admin-manage"><a title="编辑"
							href="javascript:;"
							onClick="admin_permission_edit('23','751','','修改管理员信息','update_admin_list.jsp?id=${temp.id}&username=${temp.username}&password=${temp.password}&status=${temp.status}')"
							class="ml-5" style="text-decoration: none"><i
								class="icon-edit"></i></a> <a title="删除" href="javascript:;"
							onClick="admin_del(this,'${temp.id}')" class="ml-5"
							style="text-decoration: none"><i class="icon-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="package/js/jquery.min.js"></script>
	<script type="text/javascript" src="package/layer/layer.min.js"></script>
	<script type="text/javascript" src="package/js/pagenav.cn.js"></script>
	<script type="text/javascript" src="package/js/H-ui.js"></script>
	<script type="text/javascript"
		src="package/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="package/js/H-ui.admin.js"></script>
	<script type="text/javascript">
		var req;
		window.onload = function() {
		}
		function admin_del(obj, id) {
			layer.confirm('确认删除该管理员吗 ', function(index) {
				if (window.XMLHttpRequest) {
					req = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					req = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (req) {
					req.open("POST", "AdminServlet?action=deleteusers", true);
					req.setRequestHeader("Content-Type",
							"application/x-www-form-urlencoded");
					req.onreadystatechange = callback;
					req.send("sta_id=" + id);
				}
				$(obj).parents("tr").remove();
				layer.msg('已删除!', 1);
			});
		}
		function callback() {
			if (req.readyState == 4) {
				if (req.status == 200) {
					parseMessage();
				} else {
					alert("Not able to retrieve description" + req.statusText);
				}
			}
		}
		function parseMessage() {
		}
	</script>
</body>
</html>