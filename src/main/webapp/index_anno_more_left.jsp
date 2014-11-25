<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.index_anno_Body {
	width: 268px;
	height: 220px;
	padding: 0;
	margin: auto;
}

.index_anno_top {
	width: 253px;
	height: 40px;
	margin-left: 15px;
	margin-top: 15px;
	float: left;
}

.index_anno_bottom {
	margin-left: -10px;
	margin-top: -5px;
	width: 253px;
	height: 170px;
	float: left;
}
li{list-style:none; }
.index_anno_top a:VISITED,.index_anno_top a:LINK {
	cursor: pointer;
	color: black;
	text-decoration: none;
}
.tableDiv {
	width: 270px;
	height: 115px;
	float: left;
}
.index_anno_top a:HOVER {
	cursor: pointer;
	color: red;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="admin/js/jquery.js"></script>
<link rel="stylesheet" href="css/tablelist.css" type="text/css"></link>
<body class="index_anno_Body">
	<div class="index_anno_top">
		<div style="float: left;width: 80%"><img src="image/lastnew.jpg"></img><img src="image/announce.jpg"></img></div>
	</div>
    <div class="tableDiv">
		<hr style="width: 220px">
		<table class="tablelist">
			<tbody>
				<s:iterator value="listanno" var="annoInfo">
					<tr class="annoInfo<s:property value="#annoInfo.id" />">
						<td style="font-size: 14px;"><div
								style="width:260px; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;float: left;">
								<a target="_top"
									title="<s:property
										value="#annoInfo.announcetitle" />"
									href="anno_GoTheInfo.action?index=<s:property
									value="#annoInfo.id" />"><s:property
										value="#annoInfo.announcetitle" /> </a>
							</div>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
    </div>
</body>
