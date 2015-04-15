<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">

<style type="text/css">
#home {
	background-color: white;
	width: 778px;
	height: 300px;;
	font-size: 14px;
	font-family: 微软雅黑;
	font-size: 14px;
}

.inputText {
	width: 180px;
	height: 30px;
	font-size: 16px;
}

.butt {
	background-color: #6C8F00;
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

</style>
<script type="text/javascript" src="./JS/jquery-1.11.0.js"></script>
<script type="text/javascript" src="./JS/uploadPic.js"></script>

<div id="home">

		<form action="user_UpdateInfo.action" method="post"
			onsubmit="return checkUpdate()">
			<div  align="center"
				style="float: left;background-color: white;width: 100%;height: 60%;line-height: 28px;">
				<table>
					<tr height="30px;">
						<td width="60px;">用户名</td>
						<td><s:property value="#session.sessionUser.username" />
						</td>
					</tr>
					<tr>
						<td>昵&nbsp;&nbsp;&nbsp;称</td>
						<td><input type="text" class="inputText"
							value="<s:property value="#session.sessionUser.usernickname" />"
							name="userNic" maxlength="16"  /></td>
					
					</tr>
					<tr>
						<td>电&nbsp;&nbsp;&nbsp;话</td>
						<td><input type="text" name="userEmail" class="inputText"
						
							value="<s:property value="#session.sessionUser.userphone" />"
							 /></td>
						
					</tr>
					<tr>
						<td>Q&nbsp;&nbsp;&nbsp;Q</td>
						<td><input type="text" class="inputText" name="userProfe"
							value="<s:property value="#session.sessionUser.userqq" />">
						</td>
					</tr>

				</table>

			</div>
			<div align="center"
				style="float: left;background-color: white;width: 100%;height:40%;margin-top: 10px;">
				<input type="submit" value="保存资料" class="butt" />
			</div>
		</form>

</div>




