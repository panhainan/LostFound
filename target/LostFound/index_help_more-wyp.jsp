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
    
    <title>More HelpInfo</title>
    
    <style type="text/css">
    .help_middle{
    position:relative;
    top:250px;
    margin:auto;
    padding:0;
    width:1004px;
    height:420px;
    border:solid 2px #EAEAEA;
    }
    .help_middle_left{
    position:relative;
    top:-244px;
    width:300px;
    height:420px;
    background-color:red;
    float:left;
    padding:0;
    margin:0;
    }
    
    .help_middle_right{
    position:relative;
    top:-244px;
    width:700px;
    height:420px;
    background-color:blue;
    float:left;
    padding:0;
    margin:0;
    }
    
    .ul1{
    list-style:none;
    margin-left:-70px;
    margin-top:-20px; 
    }
    
    .ul1-li{
    list-style-type:none; 
    line-height:30px;
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
  
  <body style="background-color:#FCFCFC;">
   <div class="lf_top_nav">
		<img src="./image/top.jpg"/>
		<jsp:include page="./lf_nav.jsp"></jsp:include>
	</div>
	
	
	
  </body>
</html>
    