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
<title>所有招领信息</title>
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
	
	function reverse(deleteId){
		$(".deleteId").val(deleteId);
		return true;
	}
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
			<li><a href="#">后台管理</a></li>
			<li><a href="#">物品信息管理</a></li>
			<li><a href="#">所有招领信息</a></li>
		</ul>
	</div>

	<div class="rightinfo">



		<table class="tablelist">
			<thead>
				<tr>
					<th width="60px">编号<i class="sort"><img
							src="admin/images/px.gif" /> </i></th>
					<th width="300px">招领信息标题</th>
					<th width="120px">物品所属类别</th>
					<th width="120px">物品拾捡区域</th>
					<th width="120px">信息发布时间</th>
					<th width="120px">信息发布作者</th>
					<th width="100px">删除操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="listFoundGoods" var="foundGoodsInfo">
					<tr onclick="getIndex(<s:property value="#foundGoodsInfo.id" />)"
						class="foundGoodsInfo<s:property value="#foundGoodsInfo.id" />">
						<td><s:property value="#foundGoodsInfo.id" />
						</td>
						<td><s:property value="#foundGoodsInfo.goodsname" />
						</td>
						<td><s:property value="#foundGoodsInfo.goodstype.typename" />
						</td>
						<td><s:property value="#foundGoodsInfo.goodsarea.areaname" />
						</td>
						<td><s:date name="#foundGoodsInfo.goodstime"
								format="yyyy-mm-dd" /></td>
						<td><s:property
								value="#foundGoodsInfo.goodsuser.usernickname" />
						</td>
						<td><font style="color: red;cursor:pointer;"
							id="<s:property value="#foundGoodsInfo.id" />"
							onclick="return reverse(this.id);" class="reverse">删除</font>
						</td>
					</tr>
					<div class="tip">
						<div class="tiptop">
							<span>提示信息</span><a></a>
						</div>

						<div class="tipinfo">
							<span><img src="admin/images/ticon.png" /> </span>
							<div class="tipright">
								<p>是否确认对信息的删除操作？</p>
								<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
							</div>
						</div>

						<div class="tipbtn">
							<form action="goods_DeleteInfo.action">
								<input name="index" value="0" class="deleteId" type="hidden"><input
									name="goodsStatus"
									value="<s:property value="#foundGoodsInfo.goodsstatus" />"
									type="hidden"> <input name="" type="submit"
									class="sure" value="确定" />&nbsp; <input name="" type="button"
									class="cancel" value="取消" />
							</form>
						</div>

					</div>
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
				<li class="paginItem"><a
					href="area_GetAll.action?nowPage=<s:property
						value="pageBean.currentPage-1" />"><span
						class="pagepre"></span> </a></li>
				<%
					int pageAllrecords = Integer.parseInt(request.getAttribute(
							"pageBean.totalPages").toString());
				%>
				<%
					for (int i = 1; i <= pageAllrecords; i++) {
				%>
				<li class="paginItem"><a
					href="area_GetAll.action?nowPage=<%=i%>"><%=i%></a></li>
				<%
					}
				%>

				<li class="paginItem"><a
					href="area_GetAll.action?nowPage=<s:property
						value="pageBean.currentPage+1" />"><span
						class="pagenxt"></span> </a></li>
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







	</div>

	<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
