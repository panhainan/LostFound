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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站公告</title>
<style type="text/css">
.tbody {
	width:1004px;
	margin-top: 10px;
	min-height: 200px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
}

.lf_bottom {
	width: 992px;
	height: 120px;
	float: left;
	margin-top: 10px;
	border: 6px solid #EAEAEA;
}
.left {
	width: 268px;
	min-height: 220px;
	float: left;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
}
.right{
	width: 620px;
	min-height: 300px;
	margin-left:10px;
	padding-left:40px;
	padding-right:40px;
	float: left;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
}
</style>

</head>

<body>
	<div class="lf_top_nav">
		<jsp:include page="./lf_top.jsp"></jsp:include>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	<div class="tbody"
		style="text-align: left; ">
		<div class="left">
			<iframe src="anno_GetAll.action" width="268px;" height="220px;"
				frameborder="0" scrolling="no"></iframe>
		</div>
		<div class="right">
			<h2 style="text-align: center;"><s:property value="announcement.announcetitle" /> </h2>
			<div>
				<s:property value="announcement.announceinfo" />
			</div>
		</div>
	</div>
	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
</html>
