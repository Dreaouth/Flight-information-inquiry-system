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
		String query = (String) request.getAttribute("sta_name");
		if (query == null) {
			query = "";
		}
	%>

	<nav class="Hui-breadcrumb">
		<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 调度管理
		<span class="c-gray en">&gt;</span> 航班更新 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="icon-refresh"></i></a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="UpdatePlane?action=show" method="post">
				航班查询： <select class="select" id="sel_city" name="sel_city"
					onChange="SetSubID(this);">
					<option value="0">根据城市三字码</option>
					<option value="100">根据城市名</option>
				</select> &nbsp;&nbsp;&nbsp;起始城市：<input type="text" class="input-text"
					style="width: 200px" placeholder="输入城市名，城市三字码" id="sta_start"
					name="sta_start" value=<%=query%>>&nbsp;&nbsp;&nbsp; 到达城市：<input
					type="text" class="input-text" style="width: 200px"
					placeholder="输入城市名，城市三字码" id="sta_arrive" name="sta_arrive"
					value=<%=query%>>&nbsp;&nbsp;&nbsp;
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
						<th width="50">航班ID</th>
						<th width="80">起始城市</th>
						<th width="80">到达城市</th>
						<th width="120">所属航空公司</th>
						<th width="120">航线代码</th>
						<th width="120">起始机场</th>
						<th width="120">到达机场</th>
						<th width="120">起始时间</th>
						<th width="120">到达时间</th>
						<th width="80">飞机型号</th>
						<th width="40">经停</th>
						<th width="50">时间安排</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${planeList}" var="temp">
						<tr class="text-c">
							<td>${temp.id}</td>
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
							<td class="f-14 user-manage"><a title="编辑"
								href="javascript:;"
								onClick="user_edit('4','550','','修改航班信息','update_plane_in.jsp?add_id=${temp.id}&add_startcity=${temp.startCity}&add_lastcity=${temp.lastCity}&add_company=${temp.company}&add_arilineCode=${temp.arilineCode}&add_startDrome=${temp.startDrome}&add_arriveDrome=${temp.arriveDrome}&add_startTime=${temp.startTime}&add_arriveTime=${temp.arriveTime}&add_stop=${temp.arilineStop}&add_mode=${temp.mode}&add_week=${temp.week}')"
								class="ml-5" style="text-decoration: none"> <i
									class="icon-edit"></i></a><a title="删除" href="javascript:;"
								onClick="sta_del(this,${temp.id})" class="ml-5"
								style="text-decoration: none"><i class="icon-trash"></i></a></td>
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
var req;
window.onload=function(){}
function sta_del(obj,id)
{
	layer.confirm('确认删除该航班吗 ',function(index){
		 if (window.XMLHttpRequest) {
             req = new XMLHttpRequest();
         }else if (window.ActiveXObject) {
             req = new ActiveXObject("Microsoft.XMLHTTP");
         }
        if(req){
	   		req.open("POST","UpdatePlane?action=deleteplane",true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	        req.onreadystatechange = callback;      
			req.send("sta_id="+id);
         }	
		$(obj).parents("tr").remove();
		layer.msg('已删除!',1);
	}); }
function callback() {
    if (req.readyState == 4) {
        if (req.status == 200) {
                 parseMessage();
        }else{
            alert ("Not able to retrieve description" + req.statusText);
        }}}
   function parseMessage() {}
</script>
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