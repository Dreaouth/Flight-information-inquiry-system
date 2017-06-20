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
		String query = (String) request.getAttribute("plane_name");
		if (query == null) {
			query = "";
		}
	%>

	<nav class="Hui-breadcrumb">
		<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 调度管理
		<span class="c-gray en">&gt;</span> 更新机型 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="icon-refresh"></i></a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="UpdateMode?action=show" method="post">
				机型查询： <input type="text" class="input-text" style="width: 250px"
					placeholder="输入机型" id="plane_name" name="plane_name"
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
						<th width="50">ID</th>
						<th width="150">机型号</th>
						<th width="150">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${planenamelist}" var="temp">
						<tr class="text-c">
							<td>${temp.id}</td>
							<td>${temp.name}</td>
							<td class="f-14 user-manage"><a title="编辑"
								href="javascript:;"
								onClick="user_edit('4','550','','修改机型信息','update_mode_in.jsp?add_mode_id=${temp.id}&add_mode_name=${temp.name}')"
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
window.onload=selectShow;
var req;
window.onload=function(){}
function sta_del(obj,id)
{
	layer.confirm('确认删除该机场吗 ',function(index){
		 if (window.XMLHttpRequest) {
             req = new XMLHttpRequest();
         }else if (window.ActiveXObject) {
             req = new ActiveXObject("Microsoft.XMLHTTP");
         }
        if(req){
	   		req.open("POST","UpdateMode?action=deleteMode",true);
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