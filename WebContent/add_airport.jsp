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
	<nav class="Hui-breadcrumb">
		<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 基础数据
		<span class="c-gray en">&gt;</span> 车站管理 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="icon-refresh"></i></a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="../getstationbycondition.do" method="post">
				车站查询： <input type="text" class="input-text" style="width: 250px"
					placeholder="输入站名，拼音码，或所属铁路局" id="sta_name" name="sta_name">&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-success">
					<i class="icon-search"></i> 查询
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a
				onClick="user_add('550','','添加车站','add_airport_in.jsp')"
				class="btn btn-primary radius"><i class="icon-plus"></i> 添加车站</a></span>
		</div>
		<table
			class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="100">城市ID</th>
					<th width="150">城市名字</th>
					<th width="100">所属省份</th>
					<th width="200">所属机场</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${citylist}" var="temp">
					<tr class="text-c">
						<td>${temp.cityCode}</td>
						<td>${temp.cityName}</td>
						<td>${temp.province}</td>
						<td>${temp.dromeName}</td>
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