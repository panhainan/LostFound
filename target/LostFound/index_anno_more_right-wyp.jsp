<%@ page language="java" import="java.util.*,com.phn.entity.*" contentType="text/html; charset=UTF-8"
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
    
    <style type="text/css">
   
    </style>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/index.css" type="text/css"></link>
     
     
  </head>
  
  <body>
 
   <h1><s:property value="#announcement.announcetitle" /></h1>
   <div><s:property value="#announcement.announceinfo" /></div>
   
  </body>
</html>
    