<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布闲置页面</title>
<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/personal.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/amazeui.js" type="text/javascript"></script>
<script type="text/javascript" src="js/adddate.js"></script>
</head>
<body>
	<!-- 页头 -->
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
						<a href="selectOrderAction" target="_top">&nbsp;&nbsp;<span>我的订单</span></a>
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

		</div>
	</div>
	<b class="line"></b>
	<!-- 发布区域 -->
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">发布闲置</strong>
					</div>
				</div>
				<hr />
				<!-- 商品图片 -->
				<div class="suggestmain" id="div1">
					<form action="loadAction" method="post"
						enctype="multipart/form-data">
						<p>商品图片：</p>
						<div class="suggestn">
							<input type="file" name="upload" />
						</div>
						
						<p>商品名称：</p>
						<div class="suggestn">
							<input type="text" name="goods.goodsname" placeholder="请输入商品名称" />
						</div>
						<p>商品价格：</p>
						<div class="suggestn">
							<input type="text" name="goods.newprice" placeholder="请输入商品价格" />
						</div>
						
						<p>商品类型：</p>
						<div class="suggestlist">
							<select name="goods.category" data-am-selected>
								<option value="数码" selected>数码</option>
								<option value="手机">手机</option>
								<option value="百货">百货</option>
								<option value="家居">家居</option>
								<option value="家电">家电</option>
								<option value="鞋子">鞋子</option>
								<option value="服饰">服饰</option>
								<option value="珠宝">珠宝</option>
								<option value="其他">其他</option>
							</select>
						</div>
						<div class="suggestDetail">
							<p>商品描述：</p>
							<blockquote class="textArea">
								<textarea name="goods.introduce" id="say_some" cols="60" rows="5"
									autocomplete="off" placeholder="在此介绍你发布商品的内容"></textarea>
								<div class="fontTip">
									<i class="cur">0</i> / <i>200</i>
								</div>
							</blockquote>
						</div>
						<div>
							<input type="submit" value="发布" name="btnUpload"
								class="am-btn am-btn-danger anniu" />
						</div>
					</form>

				</div>
				
			</div>
		</div>
	</div>
</body>
</html>