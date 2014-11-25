<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改区域信息</title>
<link href="admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link href="admin/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">区域管理</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>添加区域信息</span>
		</div>
		<form action="area_UpdateInfo.action" method="post">
			<ul class="forminfo">
				<li><label>区域名称</label><input name="area.areaname" type="text"
					value="<s:property value="area.areaname" />" class="dfinput" /><i>区域名称不能超过30个字符</i>
				</li>
				<li><input name="area.id" type="hidden"
					value="<s:property value="area.id" />" class="dfinput" />
				</li>
				<li><input type="submit" class="btn" value="确认保存" /></li>
			</ul>
		</form>

	</div>


</body>

</html>
