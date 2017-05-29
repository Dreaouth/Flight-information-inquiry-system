<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>详情界面</title>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">菜鸟教程</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">iOS</a></li>
            <li><a href="#">SVN</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Java <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">jmeter</a></li>
                    <li><a href="#">EJB</a></li>
                    <li><a href="#">Jasper Report</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">另一个分离的链接</a></li>
                </ul>
            </li>
        </ul>
    </div>
    </div>
</nav>
<ul class="pagination" >
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">菜鸟教程</a>
		</div>
		<div>
			<form class="navbar-form navbar-left" action="login_failure.jsp"
				role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">提交</button>
			</form>
		</div>
	</div>
	</nav>
	
	
	
	<div class="container">
  <h2>动态标签</h2>
  <p><strong>提示:</strong> 与 .tab-pane 和 data-toggle="tab" (data-toggle="pill" ) 一同使用, 设置标签页对应的内容随标签的切换而更改。</p>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">首页</a></li>
    <li><a data-toggle="tab" href="#menu1">菜单 1</a></li>
    <li><a data-toggle="tab" href="#menu2">菜单 2</a></li>
    <li><a data-toggle="tab" href="#menu3">菜单 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>首页</h3>
      <p>菜鸟教程 —— 学的不仅是技术，更是梦想！！！</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>菜单 1</h3>
      <p>这是菜单 1 显示的内容。这是菜单 1 显示的内容。这是菜单 1 显示的内容。</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>菜单 2</h3>
      <p>这是菜单 2 显示的内容。这是菜单 2 显示的内容。这是菜单 2 显示的内容。</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>菜单 3</h3>
      <p>这是菜单 3 显示的内容。这是菜单 3 显示的内容。这是菜单 3 显示的内容。</p>
    </div>
  </div>
</div>


	<div class="table-responsive">
		<table class="table">
			<caption>响应式表格布局</caption>
			<thead>
				<tr>
					<th>产品</th>
					<th>付款日期</th>
					<th>状态</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>产品1</td>
					<td>23/11/2013</td>
					<td>待发货</td>
				</tr>
				<tr>
					<td>产品2</td>
					<td>10/11/2013</td>
					<td>发货中</td>
				</tr>
				<tr>
					<td>产品3</td>
					<td>20/10/2013</td>
					<td>待确认</td>
				</tr>
				<tr>
					<td>产品4</td>
					<td>20/10/2013</td>
					<td>已退货</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>