<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
</head>


<style type="text/css">
.index_lastnews_Body {
	width: 1000px;
	height: 200px;
	padding: 0;
	margin: auto;
}

.index_lastnews_top {
	width: 975px;
	height: 40px;
	padding-left: 15px;
	padding-top: 10px;
	float: left;
}

#w600 {
	margin-top: 2px;
	float: left;
	width: 1000px;
	overflow: hidden;
	height: 145px;
}

.w400 {
	width: 1000px;
	float: left;
}

.w1800 {
	width: 2000px;
}

.w400 div {
	width: 166px;
	height: 140px;
	float: left;
	overflow: hidden;
	text-align: center;
	font-family: 微软雅黑;
	font-size: 13px;
	color: #666666;
}

.w400 div:LINK,.w400 div:VISITED {
	color: #666666;
	text-decoration: none;
}

.w400 div:HOVER {
	color: red;
	text-decoration: underline;
}

.index_lastnews_img {
	margin-left: 8px;
	height: 118px;
	width: 156px;
	border: 1px solid silver;
}
</style>
<body class="index_lastnews_Body">
	<div class="index_lastnews_top">
		<img src="image/lastnew.jpg"></img><img src="image/lastlostfound.jpg"></img>
	</div>
	<div id="w600">
		<div id="w400" class="w1800">
			<div id="w4" class="w400">
				<s:iterator value="listLastGoods" var="lastGoods">
					<a target="_blank"
						title="<s:property
									value="#lastGoods.goodsname" />"
						href="goods_GoTheInfo.action?index=<s:property
									value="#lastGoods.id" />"><div>
							<s:if test="#lastGoods.goodspictures==''">
								<img class="index_lastnews_img" src="image/top.jpg"></img>
							</s:if><s:else>
							<img class="index_lastnews_img"
								onerror="this.src='image/top.jpg'"
								src="<s:property value="#lastGoods.goodspictures" />"></img>
							<s:property value="#lastGoods.goodsname" /></s:else>
						</div> </a>
				</s:iterator>
			</div>
			<div id="wp4" class="w400"></div>
		</div>
		<div style="clear:both;"></div>
	</div>
	<script type="text/javascript">
		document.all.wp4.innerHTML = document.all.w4.innerHTML;
		function autoPlay(divW, speed) {
			function scr() {
				mBox = document.all.w600;
				iBox = document.all.w4;
				if (mBox.scrollLeft < iBox.offsetWidth) {
					mBox.scrollLeft += divW;
				} else {
					mBox.scrollLeft = -mBox.offsetWidth;
				}
				//var numC = document.all.num;
				//numC.innerHTML = mBox.scrollLeft;//获取滚动数据
			}
			t = setInterval(scr, speed);
		}

		autoPlay(1, 50);//自动播放 （滚动像素，滚动时间）
	</script>
</body>
</html>