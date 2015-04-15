<%@ page language="java" import="java.util.*,com.phn.service.*,com.phn.entity.*" contentType="text/html;charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>More Announcement</title>
    
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript">
     $(function(){
    	$("#fp1").click(function(){
    		$("#right1").attr("src","Index_Page1.action");
    	});
    	
    	});
    </script>
    <style type="text/css">
    .anno_middle{
    position:relative;
    top:250px;
    margin:auto;
    padding:0;
    width:1004px;
    height:420px;
    border:solid 2px #EAEAEA;
    }
    .anno_middle_left{
    position:relative;
    top:-244px;
    width:300px;
    height:420px;
    background-color:#B4D4F4;
    float:left;
    padding:0;
    margin:0;
    }
    
    .anno_middle_right{
    position:relative;
    top:-244px;
    width:702px;
    height:420px;
    background-color:#4CAFE9;
    float:left;
    padding:0;
    margin:0;
    }
    
    .ul1{
    list-style:none;
    margin-left:0px;
    margin-top:-20px; 
    }
    
    .ul1-li{
    list-style-type:none; 
    line-height:30px;
    text-align:left;
    }
    
     .ul2{
    list-style:none;
    margin-left:-90px;
    }
    
    .ul2-li{
    list-style-type:none;
    display:inline;
    margin-left:30px;
    }
  
    </style>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/index.css" type="text/css"></link>
     
     
  </head>
  <%
  try{
  int PageNow=1;
  int PageSize=10;
  int RowCount=1;
  String SpageNow = request.getParameter("PageNow");
		if (SpageNow != null && SpageNow!="") {
			PageNow = Integer.parseInt(SpageNow);
		}
	
  String rowCount =(String)request.getAttribute("RowCount");
  if(rowCount!=null)
  RowCount=Integer.parseInt(rowCount);	
  int PageCount=RowCount%PageSize==0?RowCount/PageSize:(RowCount/PageSize)+1;
  
   %>
  <body style="background-color:#FCFCFC;">
   <div class="lf_top_nav">
		<img src="./image/top.jpg"/>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	<div class="anno_middle">
	<div class="anno_middle_left">
	<h3 style="font-size:30px;color:black;">最新通告信息</h3>
	<ul class="ul1">
	<s:iterator value="listanno" var="anno">
	<%
	int i=0;	
	%>
	<li class='ul1-li'><%=i%>.<a href='anno_FindAnno.action?annotitle=<s:property value="#anno.announcetitle" />'><s:property value="#anno.announcetitle" /></a></li>
	<%
	i++;
	 %>
	</s:iterator>
	
	</ul>

	<ul class="ul2">
	<li class="ul2-li"><a href="anno_pre.action?PageNow=<%=PageNow%>-1">上一页</a></li>
	<li class="ul2-li"><a href="anno_pre.action?PageNow=<%=PageNow%>+1">下一页</a></li>
	<li class="ul2-li">当前<%=PageNow%>/<%=PageCount%>页</li>
	</ul>
	</div>
	<div class="anno_middle_right" id="anno_right">
	<iframe src="index_anno_more_right.jsp" width="700px;" height="420px;"
			frameborder="0" scrolling="no"></iframe>
	</div>
	<%
	}catch(Exception e){
	System.out.println("通告界面报错！！！");
	}
	 %>
	</div>
  </body>
</html>
    