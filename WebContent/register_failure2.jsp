<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册失败</title>
</head>
<body>
<h1>注册失败</h1>
<%
  String username=request.getParameter("username");
%>
    注册失败，该用户名已存在<%=username %><br>
    <a href="register.jsp">返回注册页面</a>
</body>
</html>