<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/register.css" />

<script type="text/javascript" src="./js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="./js/pStrength.jquery.js"></script>
<script type="text/javascript" src="./js/layer.js"></script>
<script type="text/javascript" src="./js/register.js"></script>
<script type="text/javascript" src="./js/placeholder.js"></script>
</head>
<body>
	<!-- 页眉 -->
	<div class="bigContainer header">
		<div class="container clearFix">
			<a class="logo floatL" href="index.jsp"><img src="images/yt.png" /></a>
			<span class="welcome floatL">欢迎注册</span>
			<div class="login floatR">
				<span>已有账号</span> <a href="login.jsp">请登录</a>
			</div>
		</div>
	</div>
	
	<!-- 注册内容区域 -->
	<div class="bigContainer">
		<div class="container">
			<div class="registerMain clearFix">
				<!-- 注册表单 -->
				<div class="registerForm floatL">
					<form id="formRegister" action="registerAction" method="post">
						<!-- 用户名 -->
						<div class="inputDiv clearFix inputUserNameDiv">
							<span class="inputSpan floatL">用&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;名</span>
							<input class="inputField floatL inputUserName" type="text"
								name="user.loginid" placeholder="您的用户名" id="idUserName"
								maxlength="20" /> <span class="inputResult inputUserNameResult"></span>
						</div>
						<!-- 用户名提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintUserName">

								支持中文、字母、数字组合，4-20个字符 </span> <span
								class="inputError inputUserNameError"> <span
								class="inputErrorIcon"></span> cuowu
							</span>
						</div>
						<!-- 设置密码 -->
						<div class="inputDiv clearFix inputPasswordDiv">
							<span class="inputSpan floatL">设&nbsp;置&nbsp;密&nbsp;码</span>
							<input
								class="inputField floatL inputPassword" type="password"
								name="user.password" placeholder="请输入密码" id="idPassword"
								maxlength="20" /> <span class="inputResult inputPasswordResult"></span>
						</div>
						<!-- 设置密码提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintPassword">

								建议使用字母、数字和符号两种及以上的组合，6-20个字符 </span> <span
								class="inputError inputPasswordError"> <span
								class="inputErrorIcon"></span> cuowu
							</span>

						</div>
						<!-- 确认密码 -->
						<div class="inputDiv clearFix inputPasswordConfirmDiv">
							<span class="inputSpan floatL">确&nbsp;认&nbsp;密&nbsp;码</span> <input
								class="inputField floatL inputPasswordConfirm" type="password"
								placeholder="请再次输入密码" id="idPasswordConfirm" maxlength="20" />
							<span class="inputResult inputPasswordConfirmResult"></span>
						</div>
						<!-- 确认密码提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintPasswordConfirm"> 请再次输入密码
							</span> <span class="inputError inputPasswordConfirmError"> <span
								class="inputErrorIcon"></span> cuowu
							</span>
						</div>
						<!-- 姓名 -->
						<div class="inputDiv clearFix inputNameDiv">
							<span class="inputSpan floatL">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
							<input class="inputField floatL inputName" type="text"
								name="user.name" placeholder="您的姓名" id="idName"
								maxlength="20" /> <span class="inputResult inputNameResult"></span>
						</div>
						<!-- 姓名提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintName">

								请输入你的真实姓名 </span> <span
								class="inputError inputNameError"> <span
								class="inputErrorIcon"></span> cuowu
							</span>
						</div>
						<!-- 手机号 -->
						<div class="inputDiv clearFix inputPhoneDiv">
							<span class="inputSpan floatL selectedArea" item_id="0086">中国 ＋86
								<span class="selectedAreaIcon"></span>
							</span>
							<input class="inputField floatL inputPhone" type="text" name="user.phone" placeholder="建议使用常用手机" id="idPhone" maxlength="11" />
							<span class="inputResult inputPhoneResult"></span>
							<input type="hidden" name="phoneArea" class="phoneAreaClassName" />
							
						</div>
						<!-- 手机号提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintPhone">
								
								输入11位手机号完成验证。
							</span>
							<span class="inputError hintPhoneError">
								<span class="inputErrorIcon"></span>
								cuowu
							</span>
							
						</div>
						<!-- 地址 -->
						<div class="inputDiv clearFix inputdzDiv">
							<span class="inputSpan floatL">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</span>
							<input class="inputField floatL inputdz" style="color: #000;" type="text"
								name="user.address" placeholder="您的常用地址" id="iddz"
								maxlength="20" /> <span class="inputResult inputdzResult"></span>
						</div>
						<!-- 地址提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintdz">

								请输入你的地址  </span> <span
								class="inputError inputdzError"> <span
								class="inputErrorIcon"></span> cuowu
							</span>
						</div>
						<!-- 邮箱 -->
						<div class="inputDiv clearFix inputyxDiv">
							<span class="inputSpan floatL">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
							<input class="inputField floatL inputyx" style="color: #000;" type="text"
								name="user.mail" placeholder="您的常用邮箱" id="idyx"
								maxlength="20" /> <span class="inputResult inputyxResult"></span>
						</div>
						<!-- 邮箱提示 -->
						<div class="inputHint">
							<span class="inputHintNormal hintyx">

								请输入你的邮箱，如xx@qq.com </span> <span
								class="inputError inputyxError"> <span
								class="inputErrorIcon"></span> cuowu
							</span>
						</div>



						<!-- 登录按钮 -->
						<input type="submit" value="立即注册" class="registerBtn" />
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 页脚 -->
	<div class="bigContainer">
		<div class="container footer">
			<div class="footerLine01">
				关于我们<span class="footerColLine"></span> 我的易淘
			</div>
			<span class="footerLine02">Copyright 2017 xxXX.com 版权所有</span>
		</div>
	</div>
</body>
</html>