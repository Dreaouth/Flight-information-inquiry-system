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
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
<link type="text/css" rel="stylesheet"
	href="package/font/font-awesome.min.css" />
<title>Insert title here</title>
</head>
<body>
<%
   String query=(String)request.getAttribute("plane_name");
   if(query==null){
	   query="";
   }
%>

	<nav class="Hui-breadcrumb">
		<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 财务管理
		<span class="c-gray en">&gt;</span> 票价查询 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="icon-refresh"></i></a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="UpdateTicket?action=show" method="post">
				起始城市： <input type="text" class="input-text" style="width: 200px"
					placeholder="输入城市名，城市三字码" id="ticket_start" name="ticket_start" value=<%=query %>>&nbsp;&nbsp;&nbsp;
					到达城市：<input type="text" class="input-text" style="width: 200px"
					placeholder="输入城市名，城市三字码" id="ticket_arrive" name="ticket_arrive" value=<%=query %>>&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-success">
					<i class="icon-search"></i> 查询
				</button>
			</form>
		</div>
		  <div class="mt-20">
		<table id="page"
			class="table table-border table-bordered table-hover table-bg order_table">
			<thead>
				<tr class="text-c">
					<th width="20">ID</th>
					<th width="50">起始城市代码</th>
					<th width="70">起始城市</th>
					<th width="50">到达城市代码</th>
					<th width="70">到达城市</th>
					<th width="40">数量</th>
					<th width="40">单价</th>
					<th width="150">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ticketlist}" var="temp">
					<tr class="text-c">
						<td>${temp.id}</td>
						<td>${temp.startCode}</td>
						<td>${temp.startcityname}</td>
						<td>${temp.arriveCode}</td>
						<td>${temp.arriveCityname}</td>
						<td>${temp.number}</td>
						<td>${temp.price}</td>
						<td class="f-14 user-manage"><a title="编辑"
								href="javascript:;"
								onClick="user_edit('4','550','','修改机票信息','update_ticket_in.jsp?add_id=${temp.id}&add_startCode=${temp.startCode}&add_startcityname=${temp.startcityname}&add_arriveCode=${temp.arriveCode}&add_arriveCityname=${temp.arriveCityname}&add_number=${temp.number}&add_price=${temp.price}')"
								class="ml-5" style="text-decoration: none"> <i
									class="icon-edit"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div id="pageNav" class="pageNav"></div>
	</div>
	<script type="text/javascript" src="package/layer/layer.min.js"></script>
	<script type="text/javascript" src="package/js/pagenav.cn.js"></script>
	<script type="text/javascript" src="package/js/H-ui.js"></script>
	<script type="text/javascript"
		src="package/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="package/js/H-ui.admin.js"></script>
	<script type="text/javascript">
    $(document).ready( function () { 
    $('.order_table').DataTable({  
        //开启搜索框  
        "searching": true,  
        //允许分页  
       "paging": true,  
        //左下角信息 showing 1 to 7 of 7entries  
        "info":true,  
        //支持国际化，将search转为中文  
        language: {  
            "search": "在表格中搜索:",  
            "oPaginate": {  
                "sPrevious": "上页",  
                "sNext": "下页",  
            },  
        },  
        "columnDefs": [  
            {  
                //targets指定列禁止排序功能  
                "orderable": false,
            }  
        ]  
    });
});
</script>
</body>
</html>