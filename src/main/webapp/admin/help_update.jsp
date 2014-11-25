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
<title>修改帮助信息</title>
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
			<li><a href="#">帮助管理</a>
			</li>
		</ul>
	</div>
	<div class="formbody">
		<div class="formtitle">
			<span>修改帮助信息</span>
		</div>
		<form action="help_UpdateInfo.action" method="post">
			<ul class="forminfo">
				<li><label>帮助信息标题</label><input name="help.helpTitle" type="text" value="<s:property value="help.helpTitle" />"
					class="dfinput" /><i>帮助标题不能超过30个字符</i>
				</li>
                 <li><label>帮助信息内容</label><input name="help.helpInfo" type="text" value="<s:property value="help.helpInfo" />"
					class="dfinput" />
				</li>
				<li><input type="hidden" name="help.id" value="<s:property value="help.id" />"></li>
				<li><input type="submit" class="btn" value="确认保存" />
				</li>
			</ul>
		</form>
	</div>
</body>
</html>
