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
			<th width="320px">评论的信息标题</th>
			<th width="80px">评论的信息类别</th>
			<th width="120px">评论时间</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="listComments" var="commentInfo">
			<tr>
				<td><s:property value="#commentInfo.commentgoods.goodsname" />
				</td>
				<td><s:if test="#commentInfo.commentgoods.goodsstatus==1">失物</s:if>
					<s:else>招领</s:else></td>
				<td><s:date name="#commentInfo.commenttime" format="yyyy-mm-dd" />
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');

	
</script>