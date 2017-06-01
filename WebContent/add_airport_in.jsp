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
<div class="pd-20">
  <div class="Huiform">
    <form action="inserttrain.do" method="post" onsubmit="return hidediv();" target="_parent">
      <table class="table table-bg">
        <tbody>
         <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 车次号码：</th>
            <td><input type="text" style="width:300px" class="input-text"  id="tra_id" name="tra_id" ></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 车次代码：</th>
            <td><input type="text" style="width:300px" class="input-text"  id="tra_tid" name="tra_tid"></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 始发站：</th>
            <td><input type="text" style="width:300px" class="input-text" id="tra_begin" name="tra_begin"></td>
          </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 终点站：</th>
            <td><input type="text" style="width:300px" class="input-text"   id="tra_end" name="tra_end"></td>
          </tr>
          <tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 车体分类：</th>
            <td><select style="width:300px" name="sta_condition" class="select">
            <option value="空调">空调</option>
            <option value="非空调">非空调</option>
            
            </select></td>
            </tr>
          <tr>
            <th class="text-r"><span class="c-red">*</span> 列车类别：</th>
            <td><select style="width:300px" name="sta_kind" class="select">
            <option value="普快">普快</option>
            <option value="特快">特快</option>
            </select></td></tr>
           <th></th>
            <td><button class="btn btn-success radius" type="submit" ><i class="icon-ok"></i> 确定</button></td>
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
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>

</body>
</html>