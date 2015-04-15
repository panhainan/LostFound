<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>寻物启事</title>
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/tablelist.css" type="text/css"></link>
<style type="text/css">
.newSelectType_Body {
	width: 1004px;
	padding: 0px;
	margin: 0px auto;
}

.newSelectType_select {
	width: 700px;
	height: 800px;
	float: left;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
	text-align: center;
}

.goodsInfoTop {
	margin-left: 5px;
	margin-top: 10px;
	height: 40px;
	text-align: left;
}

.newSelectType_add {
	margin-left: 10px;
	margin-top: 8px;
	width: 280px;
	height: 50px;
	float: left;
}

.newSelectType_help {
	width: 270px;
	height: 400px;
	float: left;
	margin-left: 10px;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
}

.newSelectType_news {
	width: 270px;
	height: 300px;
	float: left;
	margin-left: 10px;
	margin-top: 8px;
	border: 6px solid #EAEAEA;
}

.tablelist td {
	line-height: 40px;
	text-indent: 11px;
	font-size: 14px;
	font-family: 仿宋;
}
</style>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
</head>
<script type="text/javascript"></script>
<body class="newSelectType_Body">
	<div class="lf_top_nav">
		<jsp:include page="./lf_top.jsp"></jsp:include>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	<div class="newSelectType_select">
		<div class="goodsInfoTop">
			<img src="image/tzico.jpg"><img src="image/lost.jpg"></img>
		</div>
		<div
			style="font-size: 14px;font-weight: normal;text-align: left;width: 700px">
			<table class="tablelist">
				<thead>
					<tr>
						<th width="300px">信息标题</th>
						<th width="100px">所属类别</th>
						<th width="100px">丢失区域</th>
						<th width="100px">联系人</th>
						<th width="90px">发布时间</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="listLostGoods" var="lostGoodsInfo">
						<tr class="lostGoodsInfo<s:property value="#lostGoodsInfo.id" />">
							<td><div
									style="width:300px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;float: left;">
									<a target="_blank"
										title="<s:property
									value="#lostGoodsInfo.goodsname" />"
										href="goods_GoTheInfo.action?index=<s:property
									value="#lostGoodsInfo.id" />"><s:property
											value="#lostGoodsInfo.goodsname" /> </a>
								</div>
							</td>
							<td><s:property value="#lostGoodsInfo.goodstype.typename" />
							</td>
							<td><s:property value="#lostGoodsInfo.goodsarea.areaname" />
							</td>
							<td><s:property
									value="#lostGoodsInfo.goodsuser.usernickname" />
							</td>
							<td><s:date name="#lostGoodsInfo.goodstime"
									format="yyyy-MM-dd" /></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>

	</div>
	<div class="newSelectType_add">
		<a href="goods_GoNewInfo.action"><div
				id="index_addAnnoNewHelp_addBtn"></div> </a>
	</div>
	<!-- <div class="newSelectType_news">
		<iframe src="index_news.jsp" width="268px;" height="220px;"
			frameborder="0" scrolling="no"></iframe>
	</div> -->
	<div class="newSelectType_help">
		<iframe src="help_GetIndexHelp.action" width="268px;" height="250px;"
			frameborder="0" scrolling="no"></iframe>
	</div>
	<div class="lf_bottom">
		<iframe src="lf_bottom.jsp" width="992px" height="100px"
			frameborder="0" scrolling="no"></iframe>
	</div>
</body>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
</html>