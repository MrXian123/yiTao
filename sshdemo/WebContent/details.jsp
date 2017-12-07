<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="css/demo.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/optstyle.css" rel="stylesheet" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/quick_links.js"></script>
<script type="text/javascript" src="js/amazeui.js"></script>
<script type="text/javascript" src="js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider.js"></script>
<script type="text/javascript" src="js/list.js"></script>
</head>
<body>
	<!-- 页头 -->
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
	<b class="line"></b>
	<div class="listMain">
		<!--分类-->
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

		<div class="item-inform" style="margin-top: 50px;">
			<div class="clearfixLeft" id="clearcontent">
				<div class="tb-booth tb-pic tb-s310">
					<c:if test="${sesssionScope.images==null }">
						<img src="images/${images }" />

					</c:if>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clearfixRight" style="margin-top: 70px;">
				<!--名称 台湾莱彩（Rich）P1 照相机家用数码相机美颜-->
				<div class="tb-detail-hd">
					<h1>
						<c:if test="${sesssionScope.goodsname==null }">
					${goodsname }
					</c:if>
					</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>价格</dt>
							<dd>
								<em>¥</em> <b class="sys_item_price"><c:if
										test="${sesssionScope.newprice==null }">${newprice }</c:if></b>
							</dd>
						</li>
						<!-- 类型 -->
						<li class="price iteminfo_mktprice">
							<dt>类型：</dt>
							<dd>
								<c:if test="${sesssionScope.category==null }">${category }</c:if>
							</dd>
						</li>
						<div class="clear"></div>
					</div>
					<!--销量-->
					<ul class="tm-ind-panel" style="margin-top: 10px;">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">月销量</span><span class="tm-count">1015</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">累计销量</span><span class="tm-count">6015</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<span class="tm-label">累计评价</span><span class="tm-count">640</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>
					<!-- 状态 -->

					<dl class="iteminfo_parameter freight">
						<dt>状态</dt>
						<div style="color: #E4393C; margin-top: 5px;">
							<c:if test="${sesssionScope.status==null }">${status }</c:if>
						</div>
					</dl>
					<div class="clear"></div>

					<!-- 描述 -->
					<div class="shopPromotion gold">
						<div class="hot">
							<dt class="tb-metatit">描述：</dt>
							<div class="gold-list">
								<p>
									<c:if test="${sesssionScope.introduce==null }">
								${fn:substring(introduce,0,50) }
								</c:if>
								</p>
							</div>
						</div>
						<div class="clear"></div>
					</div>

				</div>
				<div class="pay">
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<c:if test="${sesssionScope.goodsId==null }">
								<a id="LikBasket" title="加入购物车"
									href="addorderAction?id=${goodsId}"><i></i>加入订单</a>
							</c:if>
						</div>
					</li>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<!-- 图文详情 -->
		<div class="match">
			<div class="match-title">商品参数：</div>
			<div class="match-comment">
				<div class="J_Brand">
					<ul id="J_AttrUL">
						<li title="">商品名称:&nbsp;<c:if
								test="${sesssionScope.goodsname==null }">${goodsname }</c:if></li>
						<li title="">商品类型:&nbsp;数码</li>
						<li title="">售后服务:&nbsp;全国联保</li>

					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>

	</div>

</body>
</html>