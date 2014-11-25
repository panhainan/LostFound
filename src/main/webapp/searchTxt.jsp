<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找結果</title>
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
	min-height: 800px;
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
	line-height: 150px;
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
			<div style="height: 40px;float: left;"><img src="image/tzico.jpg"></div>
			<div  style="width:658px;text-align:center;font-size: 16px;font-family: 仿宋;height: 40px;line-height: 40px;background-color:#F5F8FA;float: left;">
			关于“
			<s:property value="searchTxt" />
			”的查询结果</div>
		</div>
		<div
			style="font-size: 14px;font-weight: normal;text-align: left;width: 700px">
			<table class="tablelist">
				<tbody>
					<s:iterator value="listGoods" var="goodsInfo">
						<tr class="goodsInfo<s:property value="#goodsInfo.id" />">
							<td><div style="width: 690px;">
									<div
										style="height: 40px;line-height:40px;width: 690px;float: left;">
									<font style="font-weight:bolder;">标题：</font><a target="_blank" style="font-size: 18px;font-family: 仿宋;"
											title="<s:property
									value="#goodsInfo.goodsname" />"
											href="goods_GoTheInfo.action?index=<s:property
									value="#goodsInfo.id" />">
											<s:property value="#goodsInfo.goodsname" /> </a>
									</div>
									<div style="height: 110px;width: 690px;float: left;">
										<textarea rows="4" readonly="readonly"
											style="width: 660px;resize: none;font-size: 14px;font-family: 仿宋;"><s:property value="#goodsInfo.goodsdescribe" /></textarea>
									</div>
								</div>
							</td>
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
	<div class="newSelectType_help">
		<iframe src="index_help.jsp" width="268px;" height="250px;"
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