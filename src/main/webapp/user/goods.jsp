<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>">
<link href="admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="admin/js/jquery.js"></script>

<table class="tablelist" style="width: 790px;overflow: scroll;">
	<thead>
		<tr>
			<th width="320px">信息标题</th>
			<th width="80px">信息类别</th>
			<th width="120px">物品所属类别</th>
			<th width="120px">丢失拾捡区域</th>
			<th width="120px">信息发布时间</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="listGoods" var="foundGoodsInfo">
			<tr>
				<td><s:property value="#foundGoodsInfo.goodsname" /></td>
				<td><s:if test="#foundGoodsInfo.goodsstatus==1">失物</s:if><s:else>招领</s:else>
				</td>
				<td><s:property value="#foundGoodsInfo.goodstype.typename" />
				</td>
				<td><s:property value="#foundGoodsInfo.goodsarea.areaname" />
				</td>
				<td><s:date name="#foundGoodsInfo.goodstime"
						format="yyyy-mm-dd" />
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
	</script>