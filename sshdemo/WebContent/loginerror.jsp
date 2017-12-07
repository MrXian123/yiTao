<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center" style="margin-top: 200px;">
		登录失败！用户名或者密码输入错误！
		<p>
			3秒后返回登录页面->><a href="login.jsp">点击此处返回登录界面</a>
			<%
				String path = request.getContextPath();
				response.setHeader("Refresh", "3;URL=login.jsp");
			%>
		
	</div>
</body>
</html>