<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加失败</title>
</head>
<body>
<h1>添加航班失败</h1>
<%
   String query=(String)request.getAttribute("judge");
   if(query==null){
	   query="";
   }
%>
    添加失败，<%=query %><br>
    <a href="javascript:history.back(-1);">返回添加页面</a>
</body>
</html>