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
</head>
<body>
<%
   String query=(String)request.getAttribute("sta_name");
   if(query==null){
	   query="";
   }
%>
	<nav class="Hui-breadcrumb">
		<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 计划管理
		<span class="c-gray en">&gt;</span> 添加航班 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="icon-refresh"></i></a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="QueryPlane?action=show" method="post">
				航班查询： <select class="select" id="sel_city" name="sel_city"
					onChange="SetSubID(this);">
					<option value="0">根据城市三字码</option>
					<option value="100">根据城市名</option>
				</select> &nbsp;&nbsp;&nbsp;起始城市：<input type="text" class="input-text" style="width: 200px"
					placeholder="输入城市名，城市三字码" id="sta_start" name="sta_start" value=<%=query %>>&nbsp;&nbsp;&nbsp;
					到达城市：<input type="text" class="input-text" style="width: 200px"
					placeholder="输入城市名，城市三字码" id="sta_arrive" name="sta_arrive" value=<%=query %>>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-success">
					<i class="icon-search"></i> 查询
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a
				onClick="user_add('550','','添加航班','add_plane_in.jsp')"
				class="btn btn-primary radius"><i class="icon-plus"></i> 添加航班</a></span>
		</div>
		<table id="page"
			class="table table-border table-bordered table-hover table-bg order_table">
			<thead>
				<tr class="text-c">
					<th width="80">起始城市</th>
					<th width="80">到达城市</th>
					<th width="120">所属航空公司</th>
					<th width="70">航线代码</th>
					<th width="120">起始机场</th>
					<th width="120">到达机场</th>
					<th width="90">起始时间</th>
					<th width="90">到达时间</th>
					<th width="80">飞机型号</th>
				    <th width="40">经停</th>
					<th width="50">时间安排</th>																				
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${planeList}" var="temp">
					<tr class="text-c">
						<td>${temp.startCity}</td>
						<td>${temp.lastCity}</td>
						<td>${temp.company}</td>
						<td>${temp.arilineCode}</td>
						<td>${temp.startDrome}</td>
						<td>${temp.arriveDrome}</td>
						<td>${temp.startTime}</td>
						<td>${temp.arriveTime}</td>
						<td>${temp.mode}</td>
						<td>${temp.arilineStop}</td>
						<td>${temp.week}</td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pageNav" class="pageNav"></div>
	</div>
	<script type="text/javascript" src="package/layer/layer.min.js"></script>
	<script type="text/javascript" src="package/js/pagenav.cn.js"></script>
	<script type="text/javascript" src="package/js/H-ui.js"></script>
	<script type="text/javascript"
		src="package/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="package/js/H-ui.admin.js"></script>
	<!-- <script type="text/javascript">
		$(document).ready(function() {
			$('.order_table').DataTable({
				//开启搜索框  
				"searching" : true,
				//允许分页  
				"paging" : true,
				//左下角信息 showing 1 to 7 of 7entries  
				"info" : true,
				//支持国际化，将search转为中文  
				language : {
					"search" : "在表格中搜索:",
					"oPaginate" : {
						"sPrevious" : "上页",
						"sNext" : "下页",
					},
				},
				"columnDefs" : [ {
					//targets指定列禁止排序功能  
					"orderable" : false,
				} ]
			});
		});
	</script>
	 -->
</body>
</html>