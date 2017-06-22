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
			var id = document.forms[0].add_mode_id.value;
			var name = document.forms[0].add_mode_name.value;
			if (id == "") {
				alert("错误提示：机型ID不能为空！");
				return false;
			}
			if (name == "") {
				alert("错误提示：机型名字不能为空！");
				return false;
			}
		}
	</script>
	<%
	   String id=(String)request.getParameter("add_mode_id");
	   if(id==null){
		   id="";
	   }
	   String name=(String)request.getParameter("add_mode_name");
	   if(name==null){
		   name="";
	   }
	%>
<div class="pd-20">
  <div class="Huiform">
    <form action="UpdateMode?action=updateMode" method="post" onsubmit="return check()" target="_parent">
      <table class="table table-bg">
        <tbody>
         <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 机型ID：</th>
            <td><input type="text" style="width:300px"  class="input-text" id="add_mode_id" name="add_mode_id" readonly="readonly" value=<%=id %>></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 机型名字：</th>
            <td><input type="text" style="width:300px" class="input-text"  id="add_mode_name" name="add_mode_name" value=<%=name %>></td>
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