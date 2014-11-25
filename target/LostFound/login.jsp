<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%><html>
<body>
	<h2>登录</h2>
	<form action="user_Login.action" method="post">
		用户名：<input type="text" name="user.username" /><br /><br /> 密&nbsp;&nbsp;码：<input
			type="password" name="user.userpassword" /><br /> <br />&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"
			value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"
			value="注册" />
	</form>

</body>
</html>
