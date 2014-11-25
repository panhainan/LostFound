<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link rel="stylesheet" href="css/tablelist.css" type="text/css"></link>
<style type="text/css">
.index_lost_Body {
	width: 340px;
	height: 800px;
	padding: 0;
	margin: auto;
}

.index_lost_top {
	margin-left: 15px;
	margin-top: 15px;
	width: 325px;
	height: 35px;
	float: left;
}

.tableDiv {
	height: 760px;
	width: 340px;
	float: left;
}
.index_lost_Body a:VISITED,.index_lost_Body a:LINK {
	cursor: pointer;
	color: black;
	text-decoration: none;
}

.index_lost_Body a:HOVER {
	cursor: pointer;
	color: red;
	text-decoration: none;
}
</style>
<body class="index_lost_Body">
	<div class="index_lost_top">
		<div style="float: left;width: 80%"><img src="image/lastnew.jpg"></img><img src="image/lost.jpg"></img></div><div  style="float: left;height: 30px;line-height: 30px;font-family: 微软雅黑;width: 20%;font-size: 18px;"><a href="goods_GetAllLostFront.action" target="_top">&gt;&gt;</a></div>
	</div>
	<div class="tableDiv">
	<hr style="width: 300px">
		<table class="tablelist">
			<tbody>
				<s:iterator value="listLostGoods" var="lostGoodsInfo">
					<tr class="goodsInfo<s:property value="#lostGoodsInfo.id" />">
						<td style="font-size: 14px;"><div
								style="width:260px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;float: left;">
								<a target="_blank"
									title="<s:property
									value="#lostGoodsInfo.goodsname" />"
									href="goods_GoTheInfo.action?index=<s:property
									value="#lostGoodsInfo.id" />"><s:property
										value="#lostGoodsInfo.goodsname" /> </a>
							</div></td>
						<td style="font-size: 12px;width: 80px;text-align: left;"
							align="left"><s:date name="#lostGoodsInfo.goodstime"
								format="yyyy-MM-dd" />
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>