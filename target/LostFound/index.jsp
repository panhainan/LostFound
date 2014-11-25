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
<title>首页</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<style type="text/css">
.index_searchBody a:VISITED,.index_searchBody a:LINK {
	cursor: pointer;
	color: black;
	text-decoration: none;
}

.index_searchBody a:HOVER {
	cursor: pointer;
	color: red;
	text-decoration: underline;
}
</style>
</head>
<script type="text/javascript"></script>
<body class="index_Body">
	<div class="lf_top_nav">
		<jsp:include page="./lf_top.jsp"></jsp:include>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	<div class="index_searchBody">
		<form action="sear_SearchTxt.action" method="post">
			<input class="index_searchTxt" type="text" name="searchTxt" /><input
				class="index_searchBtn" type="submit" value="搜索" />
			&nbsp;&nbsp;&nbsp;&nbsp;<font
				style="font-size: 14px;font-family: 微软雅黑">热门搜索：&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=校园卡">校园卡</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=身份证">身份证</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=钱包">钱包</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=银行卡">银行卡</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=手机">手机</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=手机">手机</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=书">书</a>&nbsp;&nbsp;&nbsp;<a
				href="sear_SearchTxt.action?searchTxt=书包">书包</a> </font>
		</form>
	</div>
	<div class="index_lastNews">
		<iframe src="goods_GetLastGoodsIndex.action" width="992px;"
			height="208px;" frameborder="0" scrolling="no"></iframe>
	</div>
	<div class="index_lost">
		<iframe src="goods_GetAllLostIndex.action" width="340px;"
			height="800px;" frameborder="0" scrolling="no"></iframe>
	</div>
	<div class="index_found">
		<iframe src="goods_GetAllFoundIndex.action" width="340px;"
			height="800px;" frameborder="0" scrolling="no"></iframe>
	</div>
	<div class="index_addAnnoNewHelp">
		<div class="index_addAnnoNewHelp_add">
			<a href="goods_GoNewInfo.action"><div
					id="index_addAnnoNewHelp_addBtn"></div> </a>
		</div>
		<div class="index_addAnnoNewHelp_anno">
			<iframe src="anno_GetIndexAnno.action" width="268px;" height="220px;"
				frameborder="0" scrolling="no"></iframe>
		</div>
		<!-- <div class="index_addAnnoNewHelp_new">
			<iframe src="index_news.jsp" width="268px;" height="220px;"
				frameborder="0" scrolling="no"></iframe>
		</div> -->
		<div class="index_addAnnoNewHelp_help">
			<iframe src="help_GetIndexHelp.action" width="268px;" height="250px;"
				frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
	<div class="index_friend">
		<iframe src="index_friend.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
</html>