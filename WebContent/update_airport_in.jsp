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
			var citycode = document.forms[0].add_citycode.value;//获取用户名所填的内容
			var cityname = document.forms[0].add_cityname.value;//获取所填的密码
			var province = document.forms[0].add_province.value;//获取用户名所填的内容
			var drome = document.forms[0].add_drome.value;//获取用户名所填的内容
			if (citycode == "") {
				alert("错误提示：城市代码不能为空！");
				return false;
			}
			if (cityname == "") {
				alert("错误提示：城市名不能为空！");
				return false;
			}
			if (province == "") {
				alert("错误提示：省份不能为空！");
				return false;
			}
			if (drome == "") {
				alert("错误提示：机场名不能为空！");
				return false;
			}
		}
	</script>
<%
   String citycode=(String)request.getParameter("add_citycode");
   if(citycode==null){
	   citycode="";
   }
   String cityname=(String)request.getParameter("add_cityname");
   if(cityname==null){
	   cityname="";
   }
   String province=(String)request.getParameter("add_province");
   if(province==null){
	   province="";
   }
   String drome=(String)request.getParameter("add_drome");
   if(drome==null){
	   drome="";
   }
%>
<div class="pd-20">
  <div class="Huiform">
    <form action="UpdateAirport?action=updatecity" method="post" onsubmit="return check()" target="_parent">
      <table class="table table-bg">
        <tbody>
         <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 城市代码：</th>
            <td><input type="text" style="width:300px" placeholder="请输入城市三字码" class="input-text" id="add_citycode" name="add_citycode" value=<%=citycode %>></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 城市名：</th>
            <td><input type="text" style="width:300px" class="input-text"  id="add_cityname" name="add_cityname" value=<%=cityname %>></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 所属省份：</th>
            <td><input type="text" style="width:300px" class="input-text" id="add_province" name="add_province" value=<%=province %>></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 机场名：</th>
            <td><input type="text" style="width:300px" class="input-text" id="add_drome" name="add_drome" value=<%=drome %>></td>
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