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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>所有帮助信息</title>
<link href="admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="admin/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".reverse").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
	// 根据得到的行对象得到所在的行数的id
	function getIndex(index) {
		if($("#"+index).attr("checked")==true){
			$("#"+index).removeAttr("checked");
		}else{
			$("#"+index).attr("checked","true");
		}
	}
</script>
<script src='js/jquery.js' type='text/javascript'></script>
<script src='js/jquery.simplemodal.js' type='text/javascript'></script>
<!-- Confirm JS and CSS files -->
<script src='js/confirm.js' type='text/javascript'></script>
<link type='text/css' href='css/confirm.css' rel='stylesheet'
	media='screen' />

</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">后台管理</a>
			</li>
			<li><a href="#">帮助管理</a>
			</li>
			<li><a href="#">所有帮助信息</a>
			</li>
		</ul>
	</div>

	<div class="rightinfo">



		<table class="tablelist">
			<thead>
				<tr>
					<th width="60px">编号<i class="sort"><img
							src="admin/images/px.gif" /> </i>
					</th>
					<th width="200px">帮助标题</th>
					<th width="200px">帮助内容</th>
					<th width="150px">更新操作</th>
					<th width="150px">删除操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="listhelp" var="helpInfo">
					<tr onclick="getIndex(<s:property value="#helpInfo.id" />)"
						class="helpInfo<s:property value="#helpInfo.id" />">
						<td><s:property value="#helpInfo.id" /></td>
						<td><s:property value="#helpInfo.helpTitle" /></td>
						<td><s:property value="#helpInfo.helpInfo" /></td>
						<td><a
							href="help_GoUpdateInfo.action?index=<s:property value="#helpInfo.id" />">更新</a>
						</td>
						<td><font style="color: red;cursor:pointer;" class="reverse">删除</font></td>
					</tr>
					<div id='confirm' style='display:none'>
						<a href='#' title='Close' class='modalCloseX simplemodal-close'>x</a>
						<div class='header'>
							<span>Confirm</span>
						</div>
						<p class='message'></p>
						<div class='buttons'>
							<div class='no simplemodal-close'>No</div>
							<div class='yes'>Yes</div>
						</div>
					</div>
					<div class="tip">
						<div class="tiptop">
							<span>提示信息</span><a></a>
						</div>

						<div class="tipinfo">
							<span><img src="admin/images/ticon.png" /> </span>
							<div class="tipright">
								<p>是否确认删除该信息？</p>
								<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
							</div>
						</div>

						<div class="tipbtn">
							<form action="help_DeleteInfo.action" method="post">
								<input name="index" value="<s:property value="#helpInfo.id" />"
									type="text"> <input name="" type="submit" class="sure"
									value="确定" />&nbsp; <input name="" type="button"
									class="cancel" value="取消" />
							</form>
						</div>

					</div>
				</s:iterator>
			</tbody>
		</table>


	</div>
	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
