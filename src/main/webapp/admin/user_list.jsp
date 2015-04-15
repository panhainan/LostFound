<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

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


</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">后台管理</a>
			</li>
			<li><a href="#">用户管理</a>
			</li>
			<li><a href="#">所有用户</a>
			</li>
		</ul>
	</div>

	<div class="rightinfo">



		<table class="tablelist">
			<thead>
				<tr>
					<th width="40px"><input name="" type="checkbox" value="" />
					</th>
					<th width="40px">编号<i class="sort"><img
							src="images/px.gif" /> </i>
					</th>
					<th width="80px">用户名</th>
					<th width="100px">昵称</th>
					<th width="100px">电话</th>
					<th width="100px">Q Q</th>
					<th width="100px">操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="listUser" var="userInfo">
					<tr onclick="getIndex(<s:property value="#userInfo.id" />)"
						style="border-bottom: 1px solid #F5F8FA"
						class="userInfo<s:property value="#userInfo.id" />">
						<td><input name="" type="checkbox" value=""
							onclick="getIndex(<s:property value="#userInfo.id" />)"
							id="<s:property value="#userInfo.id" />" />
						</td>
						<td><s:property value="#userInfo.id" /></td>
						<td><s:property value="#userInfo.username" /></td>
						<td><s:property value="#userInfo.usernickname" /></td>
						<td><s:property value="#userInfo.userphone" /></td>
						<td><s:property value="#userInfo.userqq" /></td>
						<td><a href="#" class="tablelink">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
							style="color: red;cursor:pointer;" class="reverse">禁用</font></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>


		<div class="pagin">
			<div class="message">
				共&nbsp;<i class="blue"><s:property value="pageBean.allRecords" />
				</i>&nbsp;条记录，当前显示第&nbsp;<i class="blue"><s:property
						value="pageBean.currentPage" />/<s:property
						value="pageBean.totalPages" /> </i>&nbsp;页
			</div>
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:;"><span
						class="pagepre"></span> </a>
				</li>
				<%
					int pageAllrecords = Integer.parseInt(request.getAttribute(
							"pageBean.totalPages").toString());
				%>
				<%
					for (int i = 1; i <= pageAllrecords; i++) {
				%>
				<li class="paginItem"><a href="javascript:;"><%=i%></a>
				</li>
				<%
					}
				%>

				<li class="paginItem"><a href="javascript:;"><span
						class="pagenxt"></span> </a>
				</li>
			</ul>
			<script type="text/javascript">
				var liarr =$(".paginList li");
				var currentLi = "<s:property value="pageBean.currentPage" />";
				var allRecord = <s:property value="pageBean.allRecords" />;
				for(var i =0 ;i<liarr.length;i++){
					if(currentLi==liarr[i].getElementsByTagName("a")[0].innerHTML){
						liarr[i].className="paginItem current";
					}
					if(i>=allRecord&&i<liarr.length-1){
						liarr[i].className="paginItem more";
					}
					
				}
				
			</script>
		</div>


		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="images/ticon.png" /> </span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>

		</div>




	</div>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
