<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.index_help_Body {
	width: 268px;
	height: 220px;
	padding: 0;
	margin: auto;
}

.index_help_top {
	width: 253px;
	height: 40px;
	margin-left: 15px;
	margin-top: 15px;
	float: left;
}

.index_help_bottom {
	margin-left: -10px;
	margin-top: -5px;
	width: 253px;
	height: 170px;
	float: left;
}
li{list-style:none; }
.index_help_top a:VISITED,.index_help_top a:LINK {
	cursor: pointer;
	color: black;
	text-decoration: none;
}
.tableDiv {
	width: 270px;
	height: 115px;
	float: left;
}
.index_help_top a:HOVER {
	cursor: pointer;
	color: red;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link rel="stylesheet" href="css/tablelist.css" type="text/css"></link>
<body class="index_help_Body">
	<div class="index_help_top">
		<div style="float: left;width: 80%"><img src="image/lastnew.jpg"></img><img src="image/help.jpg"></img></div><div  style="float: left;height: 30px;line-height: 30px;font-family: 微软雅黑;width: 20%;font-size: 18px;"><a href="help_Getlist.action" target="_top">&gt;&gt;</a></div>
	</div>
    <div class="tableDiv">
		<hr style="width: 220px">
		<table class="tablelist">
			<tbody>
				<s:iterator value="listhelp" var="helpInfo">
					<tr class="helpInfo<s:property value="#helpInfo.id" />">
						<td style="font-size: 14px;text-align: left;"><div
								style="width:260px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;float: left;">
								&nbsp;&nbsp;<a target="_top"
									title="<s:property
										value="#helpInfo.helpTitle" />"
									href="help_GoTheInfo.action?index=<s:property
									value="#helpInfo.id" />"><s:property
										value="#helpInfo.helpTitle" /> </a>
							</div>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
    </div>
</body>
