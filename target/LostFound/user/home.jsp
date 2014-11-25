<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
.Homebackground {
	width: 1004px;
	margin: 0 auto;
	min-height: 500px;
}

.lf_top_nav {
	width: 1004px;
	height: 245px;
	float: left;
}

.leftBodyBlank {
	width: 22px;
	min-height: 100px;
	float: left;
}

.tBody {
	width: 1004px;
	font-family: 微软雅黑;
	float: left;
}

.topBody {
	width: 1004px;
	height: 24px;
	margin-top: 10px;
	float: left;
	font-size: 14px;
	font-family: 微软雅黑;
}

.userStyle {
	width: 1004px;
	margin-top: 15px;
	float: left;
	font-size: 14px;
	/* border: 1px solid #C2D5E3; */
	min-height: 300px;
}

.leftBodyNav {
	width: 140px;
	float: left;
	padding: 20px 20px 25px 20px;
	border: 6px solid #EAEAEA;
}

.leftBodyNavStyle {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	text-align:center;
	float: left;
	border-bottom: 1px solid #EAEAEA;
	border-top: 1px solid #EAEAEA;
	background-color: white;
}

.leftBodyNavStyle:hover {
	background-color: #BFDA6F;
	color: white;
		text-align:center;
}

.leftBodyNavDown {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size: 16px;
	font-weight: bolder;
	text-align:center;
	float: left;
	color: white;
	/* border-bottom: 1px solid white; */
	background-color: #BFDA6F;
}

.rightBody {
	width: 790px;
	margin-left:10px;
	min-height: 300px;
	float: left;
	border: 6px solid #EAEAEA;
}

.content {
	width: 790px;
	min-height: 300px;
	float: left;
}

.butt {
	background-color: white;
	width: 100px;
	height: 30px;
	border: 0;
	color: white;
	font-size: 18px;
}

.butt:hover {
	background-color: #BFDA6F;
	border: 0;
}

.leftBodyNav a:LINK,.leftBodyNav a:HOVER,.leftBodyNav a:ACTIVE,.leftBodyNav a:VISITED,.leftBodyNav a:FOCUS
	{
	text-decoration: none;
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
	if (self.location != top.location) {
		top.location.href = self.location.href;
	}
	function iFrameHeight(n) {
		var ifm = document.getElementById("test" + n);
		var subWeb = document.frames ? document.frames["test" + n].document
				: ifm.contentDocument;
		if (ifm != null && subWeb != null) {
			ifm.height = subWeb.body.scrollHeight;
		}
	}
	function test_item(n) {
		var menu = document.getElementById("leftBodyNav");
		var menuli = menu.getElementsByTagName("div");
		for ( var i = 1; i <= menuli.length; i++) {
			menuli[n - 1].className = "leftBodyNavDown";
			menuli[i - 1].className = "leftBodyNavStyle";
			document.getElementById("home").style.display = 'none';//隐藏
			document.getElementById("content").style.display = 'block';//隐藏  
		}
	};
</script>
</head>

<body class="Homebackground">
	<div class="lf_top_nav">
		<jsp:include page="../lf_top.jsp"></jsp:include>
		<jsp:include page="../lf_nav.jsp"></jsp:include>
	</div>

	<div class="tBody">

		<div class="userStyle">
			<div class="leftBodyNav" id="leftBodyNav">
				<a href="user_GetAllGoods.action" target="test1"
					onclick=""><div class="leftBodyNavStyle"
						id="leftBodyNavStyle_2" onclick="javascript:test_item(1);">我的启事</div>
				</a> <a href="user_GetAllComments.action" target="test1"
					onclick="return checkULogin()"><div class="leftBodyNavStyle"
						id="leftBodyNavStyle_3" onclick="javascript:test_item(2);">我的评论</div>
				</a> <a href="./user/updateInfo.jsp" target="test1"
					onclick=""><div class="leftBodyNavStyle"
						id="leftBodyNavStyle_5" onclick="javascript:test_item(3);">修改资料</div>
				</a> <a href="user_Logout.action" target="_top"
					onclick=""><div class="leftBodyNavStyle"
						style="color: red">安全退出</div> </a>
			</div>
			<div class="rightBody">
				<div id="home" style="background-color: white;">
				<div style="font-size: 20px;line-height: 30px;color: #6699CC;font-weight: bolder;padding-left: 60px;padding-top: 50px;">
							用户名： <s:property value="user.username" /><br /> 
							昵称： <s:property value="user.usernickname" />
							<br />电话：<s:property value="user.userphone" />
							<br />Q Q：<s:property value="user.userqq" />
</div>
				</div>
				<div class="content" id="content" style="display: none">
					<iframe id="test1" class="no" name="test1" frameBorder="0"
						scrolling="no" width="100%" height="100%" onLoad="iFrameHeight(1)"></iframe>
				</div>
			</div>
		</div>
	</div>

	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
</html>
