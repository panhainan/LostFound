<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.lf_navBody {
	text-align: center;
	width: 1004px;
	height: 203px;
	margin: auto;
	padding: 0px;
}

#lf_nav {
	width: 1004px;
	height: 40px;
	margin-top: 1px;
	float: left;
	/* 	background-color: #5DAF2C; */
	background-image: url("image/nav_bj.jpg");
}

#lf_nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
	list-style-type: none;
}

#lf_nav ul li {
	border-right: 1px solid white;
	position: relative;
	width: 140px;
	/* background: #5DAF2C; */
	float: left;
	text-align: center;
	font-weight: bolder;
	font-size: 22px;
}

#lf_nav ul li a { /* border-right: 1px solid #e9e9e9; */
	color: white;
	height: 40px;
	line-height: 40px;
	text-decoration: none;
	display: block;
	text-align: center;
	overflow: hidden;
	text-decoration: none;
}

#lf_nav ul li a:hover {
	font-weight: bolder;
	/* background: #62BC2B; */
	background-image: url("image/nav_ahover.jpg");
}
</style>

<body class="lf_navBody">
	<div id="lf_nav" align="center">
		<ul id="lf_navmenuNav">
			<li><a href="index.jsp">网站首页</a>
			</li>
			<li><a href="goods_GetAllLostFront.action">寻物启事</a>
			</li>
			<li><a href="goods_GetAllFoundFront.action">招领启事</a>
			</li>
			<li><a href="help_Getlist.action">帮助中心</a>
			</li>
			<li><a href="aboutUs.jsp">关于我们</a></li>
		</ul>
	</div>
</body>