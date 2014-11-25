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
<title>修改通告信息</title>
<link href="admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link href="admin/css/style.css" rel="stylesheet" type="text/css" />
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
			<span>修改通告信息</span>
		</div>
		<form action="anno_UpdateInfo.action" method="post">
			<ul class="forminfo">
				<li><label>通告标题</label><input name="announcement.announcetitle" type="text" value="<s:property value="announcement.announcetitle" />"
					class="dfinput" /><i>通告不能超过30个字符</i>
				</li>
                 <li><label>通告内容</label><input name="announcement.announceinfo" type="text" value="<s:property value="announcement.announceinfo" />"
					class="dfinput" />
				</li>
				<li><input type="hidden" name="announcement.id" value="<s:property value="announcement.id" />"></li>
				<li><input type="submit" class="btn" value="确认保存" />
				</li>
			</ul>
		</form>
	</div>
</body>
</html>
