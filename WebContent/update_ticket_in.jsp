<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="package/css/H-ui.css" />
<link type="text/css" rel="stylesheet" href="package/css/H-ui.admin.css" />
<link type="text/css" rel="stylesheet"
	href="package/font/font-awesome.min.css" />
<title>添加车站</title>
</head>
<body>
	<script type="text/javascript">
		function check() {
			var id = document.forms[0].add_id.value;
			var startcode = document.forms[0].add_startCode.value;
			var startcityname = document.forms[0].add_startcityname.value;
			var arriveCode = document.forms[0].add_arriveCode.value;
			var arriveCityname = document.forms[0].add_arriveCityname.value;
			var number = document.forms[0].add_number.value;
			var price = document.forms[0].add_price.value;
			if (number == "") {
				alert("错误提示：数量不能为空！");
				return false;
			}
			if (price == "") {
				alert("错误提示：单价不能为空！");
				return false;
			}
		}
	</script>
<%
  String id=(String)request.getParameter("add_id");
  if(id==null){
	  id="";
  }
   String startcode=(String)request.getParameter("add_startCode");
   if(startcode==null){
	   startcode="";
   }
   String startcityname=(String)request.getParameter("add_startcityname");
   if(startcityname==null){
	   startcityname="";
   }
   String arriveCode=(String)request.getParameter("add_arriveCode");
   if(arriveCode==null){
	   arriveCode="";
   }
   String arriveCityname=(String)request.getParameter("add_arriveCityname");
   if(arriveCityname==null){
	   arriveCityname="";
   }
   String number=(String)request.getParameter("add_number");
   if(number==null){
	   number="";
   }
   String price=(String)request.getParameter("add_price");
   if(price==null){
	   price="";
   }
%>
	<div class="pd-20">
		<div class="Huiform">
			<form action="UpdateTicket?action=updateticket" onsubmit="return check()"
				method="post" target="_parent">
				<table class="table table-bg">
					<tbody>
					    <tr>
							<th width="100" class="text-r"><span class="c-red"></span>
								机票ID：</th>
							<td><input type="text" style="width: 300px" readonly="readonly"
								class="input-text" id="add_id" name="add_id" value=<%=id %>></td>
						</tr>
						<tr>
							<th width="100" class="text-r"><span class="c-red"></span>
								起始城市代码：</th>
							<td><input type="text" style="width: 300px" readonly="readonly"
								class="input-text" id="add_startCode" name="add_startCode" value=<%=startcode %>></td>
						</tr>
						<tr>
							<th width="100" class="text-r"><span class="c-red"></span>
								起始城市：</th>
							<td><input type="text" style="width: 300px" readonly="readonly"
								class="input-text" id="add_startcityname" name="add_startcityname" value=<%=startcityname %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red"></span> 到达城市代码：</th>
							<td><input type="text" style="width: 300px" readonly="readonly"
								class="input-text" id="add_arriveCode" name="add_arriveCode" value=<%=arriveCode %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red"></span> 到达城市：</th>
							<td><input type="text" style="width: 300px" readonly="readonly"
								class="input-text" id="add_arriveCityname" name="add_arriveCityname" value=<%=arriveCityname %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 数量：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_number" name="add_number" value=<%=number %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 单价：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_price" name="add_price" value=<%=price %>></td>
						</tr>
						<tr>
							<td><button class="btn btn-success radius" type="submit">
									<i class="icon-ok"></i> 确定
								</button></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="package/js/jquery.min.js"></script>
	<script type="text/javascript" src="package/js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript" src="package/js/H-ui.js"></script>
	<script type="text/javascript" src="package/js/H-ui.admin.js"></script>
	<script type="text/javascript"
		src="package/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		$(".Huiform").Validform();
	</script>

</body>
</html>