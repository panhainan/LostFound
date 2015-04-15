<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<title>关于本站</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<style type="text/css">
.background {
	width: 1004px;
	overflow: auto;
	margin: 0 auto;
}


.tBody {
	width: 992px;
	margin-top: 10px;
	min-height: 400px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
	border: 6px solid #EAEAEA;
}
.lf_bottom {
	width: 992px;
	height: 120px;
	float: left;
	margin-top: 10px;
	border: 6px solid #EAEAEA;
}
</style>
</head>

<body>
	<div class="background">	<div class="lf_top_nav">
			<jsp:include page="./lf_top.jsp"></jsp:include>
			<jsp:include page="./lf_nav.jsp"></jsp:include>
		</div>
		<div class="leftBodyBlank"></div>
		<div class="tBody" style="float: left;">
			<div
				style="float: left;margin-top: 5px;width: 880px;margin-left:60px;word-wrap: break-word; word-break: normal;escape:false;text-align: left;">

				<p style="text-align: center;font-size: 24px;">
					<span style=";font-size:24px;font-family:'宋体'">关于本站</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
							 长沙理工大学失物招领网由<a href="http://www.dreamstation.cn" style="color: red" target="_blank">梦之站</a>团队（英文名<a href="http://www.dreamstation.cn" style="color: red" target="_blank">DreamStation</a>，缩写DS）创立于2014年8月，旨在为方便失主寻找丢失物品、拾主归还捡拾物品和减轻失物招领中心的管理员的工作负担，以及发扬拾金不昧的美好品德和提高中国人民的道德水平，我们开发长沙理工大学失物招领网。</span>
				</p>
				<p style="line-height: 2em;">
					<span style=";font-size:14px;font-family:'宋体'">&nbsp;&nbsp;&nbsp;
						目前本站还在初步建设中，还有很多功能会陆续推出，敬请期待，谢谢大家的支持！</span>
				</p>
				<p>
					<br>
				</p>

			</div>
		</div>
		<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
	</div>
</body>
</html>
