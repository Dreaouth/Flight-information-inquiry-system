<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="package/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="package/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="package/font/font-awesome.min.css"/>
<title>添加车站</title>
</head>
<body>
<script type="text/javascript">
		function check() {
			var username = document.forms[0].username.value;//获取所填的密码
			var password = document.forms[0].password.value;//获取用户名所填的内容
			if (cityname == "") {
				alert("错误提示：用户名不能为空！");
				return false;
			}
			if (password == "") {
				alert("错误提示：密码不能为空！");
				return false;
			}
		}
	</script>
<%
   String id=(String)request.getParameter("id");
   if(id==null){
	   id="";
   }
   String username=(String)request.getParameter("username");
   if(username==null){
	   username="";
   }
   String password=(String)request.getParameter("password");
   if(password==null){
	   password="";
   }
   String status=(String)request.getParameter("status");
   if(status==null){
	   status="";
   }
%>
<div class="pd-20">
  <div class="Huiform">
    <form action="AdminServlet?action=updateusers" method="post" onsubmit="return check()" target="_parent">
      <table class="table table-bg">
        <tbody>
         <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 用户ID：</th>
            <td><input type="text" style="width:300px" class="input-text" id="id" name="id" readonly="readonly" value=<%=id %>></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 用户名：</th>
            <td><input type="text" style="width:300px" class="input-text"  id="username" name="username" value=<%=username %>></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 密码：</th>
            <td><input type="text" style="width:300px" class="input-text" id="password" name="password" value=<%=password %>></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 权限：</th>
            							<td><select style="width: 300px" class="select" 
								id="status" name="status" value=<%=status %>>
					<option value="超级管理员">超级管理员</option>
					<option value="信息管理员">信息管理员</option>
					<option value="计划管理员">计划管理员</option>
					<option value="调度管理员">调度管理员</option>
					<option value="财务管理员">财务管理员</option>
							</select></td>
          </tr>
            <tr>
            <td><button class="btn btn-success radius" type="submit" ><i class="icon-ok"></i> 确定</button>
            </td></tr>
        </tbody>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript" src="package/js/jquery.min.js"></script>
<script type="text/javascript" src="package/js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="package/js/H-ui.js"></script> 
<script type="text/javascript" src="package/js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>

</body>
</html>