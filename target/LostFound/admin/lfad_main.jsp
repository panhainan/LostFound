<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>失物招领系统后台管理界面</title>
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0"
	framespacing="0">
	<frame src="admin/lfad_top.jsp" name="topFrame" scrolling="no"
		noresize="noresize" id="topFrame" title="topFrame" />
	<frameset cols="187,*" frameborder="no" border="0" framespacing="0">
		<frame src="admin/lfad_left.jsp" name="leftFrame" scrolling="no"
			noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame src="admin/lfad_index.jsp" name="rightFrame" id="rightFrame"
			title="rightFrame" />
	</frameset>
</frameset>
<noframes>
	<body>
	</body>
</noframes>
</html>
