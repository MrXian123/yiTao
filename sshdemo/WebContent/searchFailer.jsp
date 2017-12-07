<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>暂无商品</title>
<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/demo.css" rel="stylesheet" type="text/css" />
<link href="css/seastyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<style type="text/css">
.inner {
	width: 400px;
	height: 200px;
}
</style>
</head>
<body>
	<!-- 页头 -->
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:if test="${loginid==null }">
							<a href="login.jsp" target="_top" class="h">亲，请登录</a>
						</c:if>
						<c:if test="${loginid!=null }">
						欢迎来到易淘，您好！<span style="color: red;">${loginid }</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="loginout.jsp">退出登录</a>
						</c:if>

						&nbsp;&nbsp;&nbsp;&nbsp; <a href="register.jsp" target="_top">免费注册</a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="default.jsp" target="_top" class="h">易淘首页</a>
					</div>
				</div>

				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<c:if test="${loginid==null }">
							<a href="login.jsp" onclick="a()" target="_top">&nbsp;&nbsp;<span>个人中心</span></a>
						</c:if>
						<c:if test="${loginid!=null }">
							<a href="personalAction?id=${id }" target="_top">&nbsp;&nbsp;<span>个人中心</span></a>
						</c:if>
					</div>
				</div>

				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="#" target="_top">&nbsp;&nbsp;<span>购物车</span></a>
					</div>
				</div>

				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="order.jsp" target="_top">&nbsp;&nbsp;<span>我的订单</span></a>
					</div>
				</div>
			</ul>
		</div>

		<!--搜索框-->
		<div class="nav white">
			<div class="logo">
				<img src="images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img src="images/yt.png" /></li>
			</div>
			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form action="searchAction" method="post">
					<input id="searchInput" name="goods.category" type="text"
						placeholder="搜索你想要的商品" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<div class="nav-cont">
					<ul>
						<li class="index"><a href="default.jsp">首页</a></li>
						<li class="qc"><a href="#">电器城</a></li>
						<li class="qc"><a href="#">易抢购</a></li>
						<li class="qc"><a href="#">易天地</a></li>
						<li class="qc last"><a href="#">智能生活</a></li>
					</ul>
					<div class="nav-extra">
						<!-- 发布闲置 -->
						<c:if test="${loginid==null }">
							<a href="login.jsp" style="color: #ffffff; font-size: 18px;"
								onclick="a()">
								<button style="background: #D2364C; width: 120px; height: 40px;">发布闲置
								</button>
							</a>
						</c:if>
						<c:if test="${loginid!=null }">
							<a href="publish.jsp" style="color: #ffffff; font-size: 18px;">
								<button style="background: #D2364C; width: 120px; height: 40px;">发布闲置
								</button>
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- 暂无商品区域 -->
		<center>
			<div class="inner">
				<img src="images/zw.png">
			</div>
		</center>

	</div>
</body>
</html>