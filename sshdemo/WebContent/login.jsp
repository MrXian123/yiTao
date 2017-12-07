<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/login.css" />

<script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="./js/placeholder.js"></script>
<script type="text/javascript" src="./js/login.js"></script>
<base href="<%=basePath%>">
</head>
<body>
<!-- 页头 -->
	<div class="bigContainer">
		<div class="container clearFix header">
			<a class="logo floatL" href="default.jsp"><img src="images/yt.png" /></a>
			<span class="headerText floatL"></span>
		</div>
	</div>
	<!-- 登录内容区域 -->
	<div class="bigContainer login01">
		<div class="container login02">
			<div class="login03">
				<div class="loginType clearFix">
					<a class="loginTypeActive floatL loginBtnAccount" href="#">账户登录</a>
				</div>
				
				<!-- 账户登录 -->
				<div class="accountLogin">
					<div class="loginHint">

						<span class="loginError">
							<span class="loginErrorIcon"></span>
							登录错误
						</span>
					</div>
					<form id="formLogin" action="loginAction"  name="user_form" method="post">
						<div class="inputNameLine clearFix">
							<span class="inputNameIcon floatL"></span>
							<input type="text" name="user.loginid" class="inputName floatL" placeholder="用户名/手机号" id="inputNameId" />
							<span class="inputTextDelete inputTextDelete01 floatL"></span>
						</div>
						<div class="inputPasswordLine clearFix">
							<span class="inputPasswordIcon floatL"></span>
							<input type="password" name="user.password" class="inputPassword floatL" placeholder="密码" id="inputPasswordId" />
							<span class="inputTextDelete inputTextDelete02 floatL"></span>
						</div>
						<div class="loginLine">
							<input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" class="loginBtn" />
						</div>
					</form>
					<div class="otherTypeLogin clearFix">
						<a class="register" href="register.jsp">立即注册</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 页脚 -->
	<div class="bigContainer">
		<div class="container footer">
			<div class="footerLine01">
				关于我们<span class="footerColLine"></span>
				我的易淘
			</div>
			<span class="footerLine02">Copyright  2017  xxXX.com 版权所有</span>
		</div>
	</div>
</body>
</html>