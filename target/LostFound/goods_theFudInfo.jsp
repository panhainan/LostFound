<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="goods.goodsname" /></title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<style type="text/css">
.theFoundInfo_Body {
	width: 1004px;
	padding: 0px;
	margin: 0px auto;
}

.theFoundInfo_InfoBody {
	width: 700px;
	min-height: 880px;
	float: left;
	text-align: center;
}

.theFoundInfo_Goods {
	width: 700px;
	height: 660px;
	float: left;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
	text-align: center;
}

.theFoundInfo_comment {
	width: 680px;
	height: 170px;
	float: left;
	margin-top: 8px;
	padding: 5px 5px 5px 15px;
	border: 6px solid #EAEAEA;
	text-align: left;
	font-family: 仿宋;
	font-size: 16px;
}
.theFoundInfo_commentInfo{
	width: 680px;
	height: 125px;
	float: left;
	margin-top: 8px;
	padding: 5px 5px 5px 15px;
	border: 6px solid #EAEAEA;
	text-align: left;
	font-family: 仿宋;
	font-size: 16px;
}
.goodsInfoTop {
	margin-left: 35px;
	margin-top: 20px;
	height: 40px;
	text-align: left;
}

.theFoundInfo_help {
	width: 270px;
	height: 400px;
	float: left;
	margin-left: 22px;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
}

.theFoundInfo_news {
	width: 270px;
	height: 400px;
	float: left;
	margin-left: 22px;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
}
.btn {
	width: 100px;
	height: 38px;
	border:0px;
	background: url(image/comment_bg.jpg) no-repeat;
	cursor: pointer;
}
.btn:hover {
	width: 100px;
	height: 38px;
	border:0px;
	background: url(image/comment_ahover.jpg) no-repeat;
	cursor: pointer;
}
</style>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
</head>
<script type="text/javascript"></script>
<body class="theFoundInfo_Body">
	<div class="lf_top_nav">
		<jsp:include page="./lf_top.jsp"></jsp:include>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	<div class="theFoundInfo_InfoBody">
		<div class="theFoundInfo_Goods">
			<div class="goodsInfoTop">
				<img src="image/found.jpg"></img>
			</div>
			<hr style="width: 620px;color: #EAEAEA">
			<div
				style="font-size: 18px;font-weight: normal;text-align: left;margin-left:40px;">
				<table>
					<tr style="height: 40px;line-height: 40px;">
						<th width="100px"><img src="image/tzico.jpg"></img>
						</th>
						<td
							style="width: 500px;text-align: left;font-weight: bolder;border-bottom:1px dashed #A4A4A4 ;"><s:property
								value="goods.goodsname" />
						</td>
					</tr>
				</table>
				<table
					style="height:120px;width: 300px;float: left;margin-top: 40px;">
					<tr style="height: 34px;line-height: 34px;">
						<th style="width: 100px;">物品类型:</th>
						<td><u><s:property value="goods.goodstype.typename" /> </u>
						</td>
					</tr>
					<tr style="height: 30px;line-height: 30px;">
						<th>拾捡地点:</th>
						<td><u><s:property value="goods.goodsarea.areaname" /> </u>
						</td>
					</tr>
					<tr style="height: 40px;line-height: 40px;">
						<th>拾捡时间:</th>
						<td><u><s:date name="goods.goodstime" format="yyyy-MM-dd" />
						</u></td>
					</tr>
				</table>
				<table style="height:200px;width: 300px;">
					<tr style="height: 40px;line-height: 40px;">
						<td><img alt="" onerror="this.src='image/top.jpg'"
							style="height:160px;width: 300px;border: 1px solid silver ;"
							src="<s:property value="goods.goodspictures" />">
						</td>
					</tr>
				</table>

				<table style="height: 200px;">
					<tr>
						<th>详细描述:<br /> <br /> <br /> <br /> <br /> <br /> <br />
							<br /></th>
						<td valign="top"><textarea rows="8" readonly="readonly"
								style="width: 500px;resize: none;"><s:property value="goods.goodsdescribe" /></textarea>
						</td>
					</tr>

					<tr style="height: 34px;line-height: 34px;">
						<th>联系人昵称:</th>
						<td><u><s:property value="goods.goodsuser.usernickname" />
						</u></td>
					</tr>
					<tr style="height: 34px;line-height: 34px;">
						<th>联系人电话:</th>
						<td><u><s:property value="goods.goodsuser.userphone" />
						</u></td>
					</tr>
					<tr style="height: 34px;line-height: 34px;">
						<th>联系人 Q Q:</th>
						<td><u><s:property value="goods.goodsuser.userqq" /> </u>
						</td>
					</tr>
				</table>

			</div>
		</div>
		<div class="theFoundInfo_comment">
			<form action="comment_NewInfo.action" method="post">
				<font style="height: 32px;line-height: 32px;">联 系 人 : <s:if test="#session.sessionUser.usernickname!=''"><s:property
						value="#session.sessionUser.usernickname" /></s:if><s:else>请先登录！</s:else>
				</font><br /><input type="hidden" name="goods.id" value="<s:property value="goods.id" />">
				<textarea name="comment.commentcontent" class="commentFoundDescribe"
					style="width: 660px;resize: none;font-family: 仿宋;font-size: 16px;"
					rows="3"></textarea>
				 <div style="height: 56px;line-height:56px;"><input type="submit" value="" class="btn">&nbsp;&nbsp;请文明留言,不得违反国家法律法规！</div>
			</form>
		</div>
		
		<s:iterator value="listComment" var="commentInfo">
			<div class="theFoundInfo_commentInfo">
				<div><div style="width:60px;float: left;height: 32px;line-height: 32px;"><img src="image/comment.jpg"></img></div><div style="width: 300px;float: left;height: 32px;line-height: 32px;">联 系 人 : <s:property value="#commentInfo.commentuser.usernickname" /></div>
				<div style="width: 160px;float: left;height: 32px;line-height: 32px;font-size: 13px;">电话 : <s:property value="#commentInfo.commentuser.userphone" /></div>
				<div  style="width: 120px;height: 32px;line-height: 32px;float: left;font-size: 12px;">留言时间：<s:date name="#commentInfo.commenttime" format="yyyy-MM-dd" /></div></div><br />
				<textarea
					style="width: 660px;resize: none;font-family: 仿宋;font-size: 16px;" readonly="readonly"
					rows="3"><s:property value="#commentInfo.commentcontent" /></textarea>
			</div>
		</s:iterator>
	</div>
	<div class="theFoundInfo_help">
		<iframe src="index_help.jsp" width="268px;" height="250px;"
			frameborder="0" scrolling="no"></iframe>
	</div>
	<!-- <div class="theFoundInfo_news">
		<iframe src="index_news.jsp" width="268px;" height="220px;"
			frameborder="0" scrolling="no"></iframe>
	</div> -->
	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
</html>