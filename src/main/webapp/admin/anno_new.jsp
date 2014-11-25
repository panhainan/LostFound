<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加通告信息</title>
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
			<li><a href="#">通告管理</a>
			</li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>添加通告信息</span>
		</div>
		<form action="anno_Addanno.action" method="post">
			<ul class="forminfo">
				<li><label>通告标题</label><input name="announcement.announcetitle" type="text"
					class="dfinput" /><i>通告标题不能超过30个字符</i>
				</li>
                <li><label>通告内容</label><input name="announcement.announceinfo" type="text"
					class="dfinput" />
				</li>
				<li><input type="submit" class="btn" value="确认保存" />
				</li>
			</ul>
		</form>

	</div>


</body>

</html>
