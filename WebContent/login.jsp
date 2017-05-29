<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<link href="package/css/H-ui.css" rel="stylesheet" type="text/css" />
<link href="package/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<title>后台登录</title>
<meta name="keywords" content="my12306">
<meta name="description" content="my12306">
</head>
<body>
<script type="text/javascript">
		function check() {
			var userName = document.forms[0].username.value;//获取用户名所填的内容
			var password = document.forms[0].password.value;//获取所填的密码
			if (userName == "") {
				alert("错误提示：用户名不能为空！");
				return false;
			}
			if (password == "") {
				alert("错误提示：密码不能为空！");
				return false;
			}
		}
	</script>
<div class="loginWraper">
<h1 align="center" >后台登录</h1>
  <div id="loginform" class="loginBox">
    <form onsubmit="return check()" action="LoginServlet" method="post">
      <div class="formRow user">
      <div>${b_error}</div>
        <input id="username" name="username" type="text" placeholder="请输入账户" class="input_text input-big" autocomplete="off">
      </div>
      <div class="formRow password">
        <input id="password" name="password" type="password" placeholder="请输入密码" class="input_text input-big">
      </div>
      <div class="formRow">
        <input  type="submit" class="btn radius btn-success btn-big" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
        <input  type="button" class="btn radius btn-default btn-big" value="&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;" onclick="location.href='register.jsp'"/>
      </div>
    </form>
  </div>
</div>
<div class="footer">航空客户服务系统后台管理系统</div>
<script type="text/javascript" src="package/js/jquery.min.js"></script>
<script type="text/javascript" src="package/js/H-ui.js"></script>

</body>
</html>