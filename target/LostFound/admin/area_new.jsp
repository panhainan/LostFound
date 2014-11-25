<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加区域信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a>
			</li>
			<li><a href="#">区域管理</a>
			</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>添加区域信息</span>
		</div>
		<form action="area_NewInfo.action" method="post">
			<ul class="forminfo">
				<li><label>区域名称</label><input name="area.areaname" type="text"
					class="dfinput" /><i>区域名称不能超过30个字符</i>
				</li>

				<li><input type="submit" class="btn" value="确认保存" />
				</li>
			</ul>
		</form>

	</div>


</body>

</html>
