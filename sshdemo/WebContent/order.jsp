
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link href="css/admin.css" rel="stylesheet" type="text/css">
<link href="css/amazeui.css" rel="stylesheet" type="text/css">

<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/orstyle.css" rel="stylesheet" type="text/css">

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
						<a href="selectOrderAction" target="_top">&nbsp;&nbsp;<span>我的订单</span></a>
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

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<li><a href="#tab2">待付款</a></li>
							<li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
							<li><a href="#tab5">待评价</a></li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>


								<!--交易成功-->






								<c:if test="${ordersGoodss==null}">
									<p style="margin-top: 20px;">订单为空</p>
									<div>
										<a href="default.jsp"
											style="color: #000000; text-decoration: none; font-size: 20px;"margin-top: 260px;"" >去首页逛逛吧</a>
									</div>
								</c:if>
								<c:if test="${ordersGoodss!=null}">

									<c:forEach items="${ordersGoodss}" var="ite">
										<div class="order-status5">
											<div class="order-title">
												<div class="dd-num">订单编号：${ite.id}</div>
												<span>成交时间：${ite.buytime}</span>
												<!--    <em>店铺：小桔灯</em>-->
											</div>
											<div class="order-content">


												<div class="order-left">
													<ul class="item-list">
														<li class="td td-item">
															<div class="item-pic">
																<a href="detailAction?id=${ite.goodsId }"
																	class="J_MakePoint"> <img
																	src="images/${ite.images }" width="80px" height="80px"
																	class="itempic J_ItemImg">
																</a>
															</div>
															<div class="item-info">
																<div class="item-basic-info">
																	<a href="detailAction?id=${ite.goodsId }">
																		<p>${ite.goodsname }</p>
																		<p class="info-little">${ite.introduce}
																			<br />包装：裸装
																		</p>
																	</a>
																</div>
															</div>
														</li>
														<li class="td td-price">
															<div class="item-price">￥ ${ite.newprice}</div>
														</li>
														<li class="td td-number">
															<div class="item-number">
																<span>×</span>1
															</div>
														</li>
														<li class="td td-operation">
															<div class="item-operation"></div>
														</li>
													</ul>

												</div>
												<!-- 操作 -->
												<div class="order-right">
													<li class="td td-amount">
														<div class="item-amount">合计：￥ ${ite.newprice}</div>
													</li>
													<div class="move-right">
														<li class="td td-status">
															<div class="item-status">
																<p class="Mystatus" style="color: #DD514C">${ite.status}</p>
																<p class="order-info">
																	<a href="detailAction?id=${ite.goodsId }">订单详情</a>
																</p>

															</div>
														</li>
														<li class="td td-change">
															<div class="am-btn am-btn-danger anniu">
																<a href="delOrderAction?id=${ite.id}">删除订单</a>
															</div>
														</li>
													</div>
												</div>
											</div>
										</div>

									</c:forEach>
								</c:if>
								<!-- 便利 -->

							</div>
						</div>

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