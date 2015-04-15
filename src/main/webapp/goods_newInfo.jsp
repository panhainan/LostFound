<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布信息</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/goods_newInfo.css" type="text/css"></link>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="admin/js/jquery.js"></script>
<script type="text/javascript" src="js/goods_newInfo.js"></script>

</head>
<script type="text/javascript"></script>
<body class="newSelectType_Body">
	<div class="lf_top_nav">
		<jsp:include page="./lf_top.jsp"></jsp:include>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>

	<div class="newSelectType_select">
		<div class="selecttxtimg">
			<img src="image/selecttxt.jpg"></img>
		</div>
		<div class="test">
			<ul id="menu">
				<li class="yes" onclick="javascript:test_item(0);"><a href="#"
					onfocus="this.blur()">寻物启事</a></li>
				<li onclick="javascript:test_item(1);"><a href="#"
					onfocus="this.blur()">招领启事</a></li>
			</ul>
			<div class="selecttxtimg">
				<img src="image/selecttxt02.jpg"></img>
			</div>
			<div class="content" id="test0">
				<form action="goods_NewLostInfo.action" method="post"
					onsubmit="return validateLost();" enctype="multipart/form-data">
					<table
						style="font-size: 18px;font-weight: normal;text-align: left;">
						<tr style="height: 40px;line-height: 40px;">
							<th>信息标题<sup style="color:red"> *</sup></th>
							<td style="width: 500px;"><input type="text"
								class="lostTitle"
								style="font-size: 14px;height: 20px;width: 480px;"
								name="goods.goodsname" /></td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>物品类型<sup style="color:red"> *</sup></th>
							<td style="border:1px solid silver ;" id="lostTypeDiv"><s:iterator
									value="listType" var="typeInfo">
									<input type="radio" name="goods.goodstype.id"
										class="lostTypeRadio"
										id="radiobutton0<s:property value="#typeInfo.id" />"
										value="<s:property value="#typeInfo.id" />" />
									<label style="font-size: 14px;"
										for="radiobutton0<s:property value="#typeInfo.id" />"><s:property
											value="#typeInfo.typename" /> </label>

								</s:iterator></td>

						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>丢失地点<sup style="color:red"> *</sup></th>
							<td style="border:1px solid silver ;"  id="lostAreaDiv"><s:iterator
									value="listArea" var="areaInfo">
									<input type="radio" name="goods.goodsarea.id"
										class="lostAreaRadio"
										id="radiobutton1<s:property value="#areaInfo.id" />"
										value="<s:property value="#areaInfo.id" />" />
									<label style="font-size: 14px;"
										for="radiobutton1<s:property value="#areaInfo.id" />"><s:property
											value="#areaInfo.areaname" /> </label>
								</s:iterator>
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>丢失时间<sup style="color:red"> *</sup></th>
							<td class="lostDateTd"><input id="d11" class="Wdate"
								type="text" name="goods.goodstime"
								style="font-size: 14px;height: 20px;width: 260px;"
								onClick="WdatePicker({readOnly:true})" /></td>
						</tr>
						<tr style="">
							<th>详细描述<sup style="color:red"> *</sup><br /> <br /> <br />
								<br /> <br /></th>
							<td><textarea name="goods.goodsdescribe"
									class="lostDescribe"
									style="width: 480px;resize: none;font-size: 16px;" rows="6"></textarea>
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>物品图片</th>
							<td><input class="inputText"
								style="font-size: 14px;height: 20px;width: 200px;" id="f_file"
								type="text"> <input value="选择" class="butt"
								style="width: 50px;height: 26px;" onclick="fu.click()"
								type="button"> <input name="fileUpload" id="fu"
								onchange="f_file.value=this.value" style="display:none"
								type="file"></td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>联 系 人<sup style="color:red"> *</sup></th>
							<td style="width: 200px;"><input type="text"
								name="user.usernickname" class="lostUserNickname"
								style="font-size: 14px;height: 20px;width: 260px;"
								value="<s:property value="#session.sessionUser.usernickname" />" />
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>联系电话<sup style="color:red"> *</sup></th>
							<td style="width: 200px;"><input type="text"
								name="user.userphone" class="lostUserPhone"
								style="font-size: 14px;height: 20px;width: 260px;"
								value="<s:property value="#session.sessionUser.userphone" />" />
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>联系 Q Q</th>
							<td style="width: 200px;"><input type="text"
								name="user.userqq"
								style="font-size: 14px;height: 20px;width: 260px;"
								value="<s:property value="#session.sessionUser.userqq" />" /></td>
						</tr>
						<tr style="height: 80px;line-height: 80px;">
							<th><input type="hidden" name="goods.goodsstatus" value="1" />
							</th>
							<td align="left" style="padding-left: 120px;"><input
								type="submit" value="确认提交" style="width: 100px;height: 30px;" />
							</td>
						</tr>
					</table>
				</form>

			</div>
			<div id="test1" class="no">
				<form action="goods_NewFoundInfo.action" method="post"
					onsubmit="return validateFound();" enctype="multipart/form-data">
					<table
						style="font-size: 18px;font-weight: normal;text-align: left;">
						<tr style="height: 40px;line-height: 40px;">
							<th>信息标题<sup style="color:red"> *</sup></th>
							<td style="width: 500px;"><input type="text"
								class="foundTitle"
								style="font-size: 14px;height: 20px;width: 480px;"
								name="goods.goodsname" /></td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>物品类型<sup style="color:red"> *</sup></th>
							<td style="border:1px solid silver ;"  id="foundTypeDiv"><s:iterator
									value="listType" var="typeInfo">
									<input type="radio" name="goods.goodstype.id"
										class="foundTypeRadio"
										id="radiobutton2<s:property value="#typeInfo.id" />"
										value="<s:property value="#typeInfo.id" />" />
									<label style="font-size: 14px;"
										for="radiobutton2<s:property value="#typeInfo.id" />"><s:property
											value="#typeInfo.typename" /> </label>

								</s:iterator></td>

						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>拾捡地点<sup style="color:red"> *</sup></th>
							<td style="border:1px solid silver ;"  id="foundAreaDiv"><s:iterator
									value="listArea" var="areaInfo">
									<input type="radio" name="goods.goodsarea.id"
										class="foundAreaRadio"
										id="radiobutton3<s:property value="#areaInfo.id" />"
										value="<s:property value="#areaInfo.id" />" />
									<label style="font-size: 14px;"
										for="radiobutton3<s:property value="#areaInfo.id" />"><s:property
											value="#areaInfo.areaname" /> </label>
								</s:iterator>
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>拾捡时间<sup style="color:red"> *</sup></th>
							<td class="foundDateTd"><input id="d11" class="Wdate"
								type="text" name="goods.goodstime"
								style="font-size: 14px;height: 20px;width: 260px;"
								onClick="WdatePicker({readOnly:true})" /></td>
						</tr>
						<tr style="">
							<th>详细描述<sup style="color:red"> *</sup><br /> <br /> <br />
								<br /> <br /></th>
							<td><textarea name="goods.goodsdescribe"
									class="foundDescribe"
									style="width: 480px;resize: none;font-size: 16px;" rows="6"></textarea>
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>物品图片</th>
							<td><input class="inputText"
								style="font-size: 14px;height: 20px;width: 200px;" id="f_file"
								type="text"> <input value="选择" class="butt"
								style="width: 50px;height: 26px;" onclick="fu.click()"
								type="button"> <input name="fileUpload" id="fu"
								onchange="f_file.value=this.value" style="display:none"
								type="file"></td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>联 系 人<sup style="color:red"> *</sup></th>
							<td style="width: 200px;"><input type="text"
								name="user.usernickname" class="foundUserNickname"
								style="font-size: 14px;height: 20px;width: 260px;"
								value="<s:property value="#session.sessionUser.usernickname" />" />
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>联系电话<sup style="color:red"> *</sup></th>
							<td style="width: 200px;"><input type="text"
								name="user.userphone" class="foundUserPhone"
								style="font-size: 14px;height: 20px;width: 260px;"
								value="<s:property value="#session.sessionUser.userphone" />" />
							</td>
						</tr>
						<tr style="height: 40px;line-height: 40px;">
							<th>联系 Q Q</th>
							<td style="width: 200px;"><input type="text"
								name="user.userqq"
								style="font-size: 14px;height: 20px;width: 260px;"
								value="<s:property value="#session.sessionUser.userqq" />" /></td>
						</tr>
						<tr style="height: 80px;line-height: 80px;">
							<th><input type="hidden" name="goods.goodsstatus" value="2" />
							</th>
							<td align="left" style="padding-left: 120px;"><input
								type="submit" value="确认提交" style="width: 100px;height: 30px;" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</div>

	<div class="newSelectType_help">
		<iframe src="index_help.jsp" width="268px;" height="250px;"
			frameborder="0" scrolling="no"></iframe>
	</div>
	<!-- <div class="newSelectType_news">
		<iframe src="index_news.jsp" width="268px;" height="220px;"
			frameborder="0" scrolling="no"></iframe>
	</div> -->
	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
</html>