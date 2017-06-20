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
			var startcity = document.forms[0].add_startcity.value;
			var lastcity = document.forms[0].add_lastcity.value;
			var company = document.forms[0].add_company.value;
			var arilinecode = document.forms[0].add_arilineCode.value;
			var startDrome = document.forms[0].add_startDrome.value;
			var arriveDrome = document.forms[0].add_arriveDrome.value;
			var startTime = document.forms[0].add_startTime.value;
			var arriveTime = document.forms[0].add_arriveTime.value;
			var stop = document.forms[0].add_stop.value;
			var mode = document.forms[0].add_mode.value;
			if (startcity == "") {
				alert("错误提示：城市代码不能为空！");
				return false;
			}
			if (lastcity == "") {
				alert("错误提示：城市代码不能为空！");
				return false;
			}
			if (arilinecode == "") {
				alert("错误提示：航线代码不能为空！");
				return false;
			}
			if (startDrome == "") {
				alert("错误提示：机场名不能为空！");
				return false;
			}
			if (arriveDrome == "") {
				alert("错误提示：机场名不能为空！");
				return false;
			}
			if (stop == "") {
				alert("错误提示：经停不能为空！");
				return false;
			}
			if (mode == "") {
				alert("错误提示：机型不能为空！");
				return false;
			}
		}
	</script>
<%
  String id=(String)request.getParameter("add_id");
  if(id==null){
	  id="";
  }
   String startcity=(String)request.getParameter("add_startcity");
   if(startcity==null){
	   startcity="";
   }
   String lastcity=(String)request.getParameter("add_lastcity");
   if(lastcity==null){
	   lastcity="";
   }
   String company=(String)request.getParameter("add_company");
   if(company==null){
	   company="";
   }
   String arilineCode=(String)request.getParameter("add_arilineCode");
   if(arilineCode==null){
	   arilineCode="";
   }
   String startDrome=(String)request.getParameter("add_startDrome");
   if(startDrome==null){
	   startDrome="";
   }
   String arriveDrome=(String)request.getParameter("add_arriveDrome");
   if(arriveDrome==null){
	   arriveDrome="";
   }
   String startTime=(String)request.getParameter("add_startTime");
   if(startTime==null){
	   startTime="";
   }
   String arriveTime=(String)request.getParameter("add_arriveTime");
   if(arriveTime==null){
	   arriveTime="";
   }
   String stop=(String)request.getParameter("add_stop");
   if(stop==null){
	   stop="";
   }
   String mode=(String)request.getParameter("add_mode");
   if(mode==null){
	   mode="";
   }
   String week=(String)request.getParameter("add_week");
   if(week==null){
	   week="";
   }
%>
	<div class="pd-20">
		<div class="Huiform">
			<form action="UpdatePlane?action=updateplane" onsubmit="return check()"
				method="post" target="_parent">
				<table class="table table-bg">
					<tbody>
					    <tr>
							<th width="100" class="text-r"><span class="c-red"></span>
								航班ID：</th>
							<td><input type="text" style="width: 300px" readonly="readonly"
								class="input-text" id="add_id" name="add_id" value=<%=id %>></td>
						</tr>
						<tr>
							<th width="100" class="text-r"><span class="c-red">*</span>
								起始城市：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_startcity" name="add_startcity" value=<%=startcity %>></td>
						</tr>
						<tr>
							<th width="100" class="text-r"><span class="c-red">*</span>
								到达城市：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_lastcity" name="add_lastcity" value=<%=lastcity %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 所属公司：</th>
							<td><select style="width: 300px" class="select" 
								id="add_company" name="add_company" value=<%=company %>>
									<option value="上海航空公司">上海航空公司</option>
									<option value="东星航空有限公司">东星航空有限公司</option>
									<option value="中国南方航空(集团)公司">中国南方航空(集团)公司</option>
									<option value="中国国际航空公司">中国国际航空公司</option>
									<option value="四川航空股份有限公司">四川航空股份有限公司</option>
									<option value="大新华航空有限公司">大新华航空有限公司</option>
									<option value="奥凯航空">奥凯航空</option>
									<option value="海航集团祥鹏航空公司">海航集团祥鹏航空公司</option>
									<option value="鹰联航空公司">鹰联航空公司</option>
							</select></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 航线号：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_arilineCode" name="add_arilineCode" value=<%=arilineCode %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 起始机场：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_startDrome" name="add_startDrome" value=<%=startDrome %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 到达机场：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_arriveDrome" name="add_arriveDrome" value=<%=arriveDrome %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 起始时间：</th>
							<td><input type="text" id="add_startTime"
								name="add_startTime" value=<%=startTime %>
								onfocus="WdatePicker({skin:'whyGreen',dateFmt:'HH:mm:ss'})"
								class="Wdate" /></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 到达时间：</th>
							<td><input type="text" id="add_arriveTime"
								name="add_arriveTime" value=<%=arriveTime %>
								onfocus="WdatePicker({skin:'whyGreen',dateFmt:'HH:mm:ss'})"
								class="Wdate" /></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 机型号：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_mode" name="add_mode" value=<%=mode %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 经停：</th>
							<td><input type="text" style="width: 300px"
								class="input-text" id="add_stop" name="add_stop" value=<%=stop %>></td>
						</tr>
						<tr>
							<th class="text-r"><span class="c-red">*</span> 时间安排：</th>
							<td><input TYPE="checkbox" name="add_week" VALUE="1">
								星期一 &nbsp;&nbsp;&nbsp;<input TYPE="checkbox" name="add_week"
								VALUE="2"> 星期二 &nbsp;&nbsp; <input TYPE="checkbox"
								name="add_week" VALUE="3"> 星期三 <BR> <input
								TYPE="checkbox" name="add_week" VALUE="4"> 星期四 &nbsp;&nbsp;
								<input TYPE="checkbox" name="add_week" VALUE="5">
								星期五 &nbsp;&nbsp; <input TYPE="checkbox" name="add_week"
								VALUE="6"> 星期六 <BR> <input TYPE="checkbox"
								name="add_week" VALUE="日"> 星期日 <BR>
							</td>
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