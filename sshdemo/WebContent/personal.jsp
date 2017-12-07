<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link href="css/admin.css" rel="stylesheet" type="text/css">
<link href="css/amazeui.css" rel="stylesheet" type="text/css">

<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/infstyle.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.js"></script>
</head>
<body>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
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

		<!--悬浮搜索框-->

		<div class="nav white">
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
	</div>
	</article> </header>
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
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />

					<!--个人信息 -->
					<div class="info-main">
						<form class="am-form am-form-horizontal" action="passwordAction"
							method="post">

							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">用户名：</label>
								<div class="am-form-content">
									<c:if test="${loginid!=null }">
										<input type="text" name="user.loginid" id="user-name2"
											value="${loginid }">
									</c:if>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">密码：</label>
								<div class="am-form-content">
									<c:if test="${password!=null }">
										<input type="password" name="user.password" id="user-name2"
											value="${password }">
									</c:if>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">角色：</label>
								<div class="am-form-content">
									<c:if test="${role!=null }">
										
										<input type="text" name="user.role" id="user-name2"
											value="${role}">
										
										
										<small>0 为管理员 1 为普通用户</small>
									</c:if>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">姓名：</label>
								<div class="am-form-content">
									<c:if test="${name!=null }">
										<input type="text" name="user.name" id="user-name2"
											value="${name }">
									</c:if>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">手机号：</label>
								<div class="am-form-content">
									<c:if test="${phone!=null }">
										<input id="user-phone" name="user.phone" type="tel"
											value="${phone }">
									</c:if>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">地址：</label>
								<div class="am-form-content">
									<c:if test="${address!=null }">
										<input type="text" name="user.address" id="user-name2"
											value="${address }">
									</c:if>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-email" class="am-form-label">邮箱</label>
								<div class="am-form-content">
									<c:if test="${mail!=null }">
										<input id="user-email" name="user.mail" type="email"
											value="${mail }">
									</c:if>
								</div>
							</div>

							<div class="info-btn">
								<input type="submit" value="保存修改" class="am-btn am-btn-danger" />
							</div>

						</form>
					</div>

				</div>

			</div>

		</div>

		<aside class="menu">
		<ul>
			<li class="person active"><a href="personal.jsp"><i
					class="am-icon-user"></i>个人中心</a></li>
			<li class="person">
				<p>
					<i class="am-icon-newspaper-o"></i>个人资料
				</p>

			</li>
			<li class="person">
				<p>
					<i class="am-icon-balance-scale"></i>我的交易
				</p>
				<ul>
					<li><a href="selectOrderAction">订单管理</a></li>
				</ul>
			</li>
		</ul>

		</aside>
	</div>

</body>
</html>