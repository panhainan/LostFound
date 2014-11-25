<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.lf_topBody {
	width: 1004px;
	height: 203px;
	margin: auto;
	padding: 0px;
}

.lf_top {
	width: 1004px;
	height: 203px;
	background-image: url('./image/top.jpg');
}

.lf_topBlank {
	width: 1004px;
	height: 173px;
}

.lf_toplogFrom {
	height: 30px;
	line-height: 30px;
	margin-left: 500px;
	font-family: "微软雅黑";
	font-weight: bolder;
	color: #5A7D00;
}

.lf_topuserTxt,.lf_toppswTxt {
	border: 0;
	height: 20px;
	width: 140px;
	font-family: "微软雅黑";
	font-weight: bolder;
}

.lf_topbtn {
	height: 20px;
	width: 40px;
	border: 0;
	background-color: #7FB540;
	font-weight: bolder;
	font-family: "微软雅黑";
}
</style>
<body class="lf_topBody">
	<div class="lf_top">
		<div class="lf_topBlank"></div>
		<div class="lf_toplogFrom">
			<%
				HttpSession s = request.getSession();
				if (s.getAttribute("sessionUser") == null) {
			%>
			<form action="user_Login.action" method="post">
				用户名&nbsp;<input class="lf_topuserTxt" name="user.username"
					type="text" /> &nbsp;密码&nbsp;<input class="lf_toppswTxt"
					name="user.userpassword" type="password" /> &nbsp;<input
					class="lf_topbtn" type="submit" value="登录">
			</form>
			<%
				} else {
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您，
			<s:property value="#session.sessionUser.username" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #FF5603;" href="user_Logout.action">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="user_GoHome.action" style="color: #5A7D00" target="_top">个人中心</a>
			<%
				}
			%>
		</div>
	</div>
</body>