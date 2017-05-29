<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="package/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="package/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="package/font/font-awesome.min.css"/>
<title>添加航线</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form action="insertstation.do" method="post" onsubmit="return hidediv();" target="_parent">
      <table class="table table-bg">
        <tbody>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 车站代码：</th>
            <td><input type="text" style="width:300px" class="input-text" id="sta_id" name="sta_id" datatype="*2-16" nullmsg="车站代码不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 车站名：</th>
             <td><input type="text" style="width:300px" class="input-text" id="sta_name" name="sta_name" ></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 拼音码：</th>
           <td><input type="text" style="width:300px" class="input-text" id="sta_code" name="sta_code" ></td>
          </tr>
          <tr>
            <th width="100" class="text-r">所属铁路局：</th>
             <td><input type="text" style="width:300px" class="input-text" id="sta_bureau" name="sta_bureau" ></td>
          </tr>
          <tr>
            <th width="100" class="text-r">车站等级：</th>
            <td><select style="width:300px" class="select"  name="sta_grade" ">
            <option value="一级">一级</option>
            <option value="二级">二级</option>
            <option value="三级">三级</option>
             <option value="四级">四级</option>
            <option value="五级">五级</option>
           </select>
          </tr>
          <tr>
            <th width="100" class="text-r">所属行政区：</th>
             <td><input type="text" style="width:300px" class="input-text" id="sta_region" name="sta_region" ></td>
          </tr>
          <tr>
            <th width="100" class="text-r">联系地址：</th>
            <td><input type="text" style="width:300px" class="input-text" id="sta_add" name="sta_add" ></td>
          </tr>
          <tr>
            <th></th>
            <td><button class="btn btn-success radius" type="submit"><i class="icon-ok"></i> 确定</button></td>
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