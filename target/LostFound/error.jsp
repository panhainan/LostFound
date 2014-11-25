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
<title>操作失败</title>


<style type="text/css">

.tbody {
	width: 992px;
	margin-top: 10px;
	min-height: 200px;
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
<script type="text/javascript">
	function countDown(secs, surl) {
		//alert(surl);     
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (--secs >= 0) {
			setTimeout("countDown(" + secs + ",'" + surl + "')", 1000);
		} else {
			location.href = surl;
		}
	}
</script>

</head>

<body>
	<div class="lf_top_nav">
		<jsp:include page="./lf_top.jsp"></jsp:include>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	<div class="tbody" style="background-color: #F5F5F5;text-align: center; "   >
	<br/>	<br/>	<br/>
		<font color="#6699CC" style="font-size: 24px;font-weight: bolder;">操作失败!</font>
		请稍等<span id="jumpTo"
			style="font-size: 20px;font-weight: bolder;color:#6699CC">5</span>秒后自动跳返回先前界面
		<script type="text/javascript">
			countDown(4, 'javascript:history.go(-1);');
		</script>
		<p align="center" style="font-size: 16px;">
			如果您的浏览器不支持跳转,<a style="text-decoration: none"
				href="javascript:history.go(-1);"><font color="#FF0000">请点击这里</font>
			</a>.
		</p>
	</div>
	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
</html>
