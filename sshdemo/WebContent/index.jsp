<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<title>首页</title>
<link href="css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="css/admin.css" rel="stylesheet" type="text/css" />
<link href="css/demo.css" rel="stylesheet" type="text/css" />
<link href="css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="css/seastyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/amazeui.min.js"></script>
<style type="text/css">
.bigContainer {
	min-width: 1000px;
}

.container {
	width: 990px;
	margin: 0 auto;
}

.footer {
	text-align: center;
	font-size: 12px;
	line-height: 12px;
	color: #666;
	margin-top: 14px;
	padding-bottom: 32px;
}

.footerLine01 {
	margin-bottom: 14px;
}

.footerLine01 a {
	color: #666;
}

.footerLine01 a:hover {
	color: #e4393c;
	text-decoration: underline;
}

.footerColLine {
	border-left: 1px solid #555;
	margin: 0 13px;
	line-height: 12px;
	height: 12px;
	display: inline-block;
	position: relative;
	top: 2px;
	*position: relative;
	*top: 0px;
	*width: 1px;
}
</style>
<script type="text/javascript">
	function a() {
		alert("你好！请先登录后再操作！")
	}
</script>
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
						<c:if test="${loginid==null }">
							<a href="selectOrderAction" onclick="a()" target="_top">&nbsp;&nbsp;<span>我的订单</span></a>
						</c:if>
						<c:if test="${loginid!=null }">
							<a href="selectOrderAction" target="_top">&nbsp;&nbsp;<span>我的订单</span></a>
						</c:if>

					</div>
				</div>
			</ul>
		</div>

		<!--搜索框-->
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
	<b class="line"></b>
	<!-- 主页区 -->
	<div class="shopNav">
		<div class="slideall" style="height: auto;">

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

			<div class="bannerTwo">
				<!--轮播 -->
				<div class="am-slider am-slider-default" data-am-flexslider
					id="demo-slider-0">
					<ul class="am-slides">
						<li class="banner1"><a href="#"><img src="images/a1.jpg" /></a></li>
						<li class="banner2"><a href="#"><img src="images/a2.jpg" /></a></li>
						<li class="banner3"><a href="#"><img src="images/a3.jpg" /></a></li>
						<li class="banner4"><a href="#"><img src="images/a4.jpg" /></a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull" style="position: static;">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category" style="box-shadow: none; margin-top: 2px;">
							<ul class="category-list navTwo" id="js_climit_li">
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-22" title="数码">闲置数码</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>手机</span>
															</dt>
															<dd>
																<a rel="nofollow" title="Apple/苹果" target="_blank"
																	href="#" rel="nofollow"><span class="red">Apple/苹果</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="Huawei/华为" target="_blank"
																	href="#" rel="nofollow"><span>Huawei/华为</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="Samsung/三星" target="_blank"
																	href="#" rel="nofollow"><span class="red">Samsung/三星</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="MIUI/小米" target="_blank"
																	href="#" rel="nofollow"><span>MIUI/小米</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="OPPO" target="_blank" href="#"
																	rel="nofollow"><span class="red">OPPO</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="ViVo" target="_blank" href="#"
																	rel="nofollow"><span class="red">ViVo</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-22" title="百货">闲置百货</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>居家日用</span>
															</dt>
															<dd>
																<a rel="nofollow" title="雨伞雨具" target="_blank" href="#"
																	rel="nofollow"><span class="red">雨伞雨具</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="迷你风扇" target="_blank" href="#"
																	rel="nofollow"><span class="red">迷你风扇</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="毛巾" target="_blank" href="#"
																	rel="nofollow"><span>毛巾</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="口罩" target="_blank" href="#"
																	rel="nofollow"><span>口罩</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="护膝护腰" target="_blank" href="#"
																	rel="nofollow"><span class="red">护膝护腰</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="家用梯" target="_blank" href="#"
																	rel="nofollow"><span>家用梯</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="眼罩" target="_blank" href="#"
																	rel="nofollow"><span>眼罩</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="炭包" target="_blank" href="#"
																	rel="nofollow"><span class="red">炭包</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-22" title="家居">家居日用</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>床上用品</span>
															</dt>
															<dd>
																<a rel="nofollow" title="床上四件套" target="_blank" href="#"
																	rel="nofollow"><span class="red">床上四件套 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="枕头枕芯" target="_blank" href="#"
																	rel="nofollow"><span>枕头枕芯</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="春秋被  " target="_blank" href="#"
																	rel="nofollow"><span class="red">春秋被 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="床单 " target="_blank" href="#"
																	rel="nofollow"><span>床单 </span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-22" title="影音">影音家电</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>大家电</span>
															</dt>
															<dd>
																<a rel="nofollow" title="洗衣机" target="_blank" href="#"
																	rel="nofollow"><span class="red">洗衣机</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="平板电视" target="_blank" href="#"
																	rel="nofollow"><span>平板电视</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="冰箱" target="_blank" href="#"
																	rel="nofollow"><span>冰箱</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="电热水器" target="_blank" href="#"
																	rel="nofollow"><span>电热水器</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-22" title="鞋服">鞋服配饰</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>女装</span>
															</dt>
															<dd>
																<a rel="nofollow" title="连衣裙" target="_blank" href="#"
																	rel="nofollow"><span class="red">连衣裙</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="半身裙" target="_blank" href="#"
																	rel="nofollow"><span>半身裙</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="T恤" target="_blank" href="#"
																	rel="nofollow"><span class="red">T恤</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="衬衫" target="_blank" href="#"
																	rel="nofollow"><span>衬衫</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="卫衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">卫衣</span></a>
															</dd>
														</dl>
													</div>
												</div>

												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>男装</span>
															</dt>
															<dd>
																<a rel="nofollow" title="夹克" target="_blank" href="#"
																	rel="nofollow"><span class="red">夹克</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="牛仔裤" target="_blank" href="#"
																	rel="nofollow"><span>牛仔裤</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="T恤" target="_blank" href="#"
																	rel="nofollow"><span class="red">T恤</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="衬衫" target="_blank" href="#"
																	rel="nofollow"><span>衬衫</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="卫衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">卫衣</span></a>
															</dd>
														</dl>
													</div>
												</div>

											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li>
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-22" title="珠宝">珠宝收藏</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>珠宝</span>
															</dt>
															<dd>
																<a rel="nofollow" title="YYKCLOT" target="_blank"
																	href="#" rel="nofollow"><span class="red">YYKCLOT</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="翡翠 " target="_blank" href="#"
																	rel="nofollow"><span class="red">翡翠</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="黄金" target="_blank" href="#"
																	rel="nofollow"><span>黄金</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="钻石" target="_blank" href="#"
																	rel="nofollow"><span>钻石</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="珍珠" target="_blank" href="#"
																	rel="nofollow"><span class="red">珍珠</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="碧玺" target="_blank" href="#"
																	rel="nofollow"><span class="red">碧玺</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
			<!--导航 -->
			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>

			<!--各类活动-->
			<div class="row">
				<li><a><img src="images/row1.jpg" /></a></li>
				<li><a><img src="images/row2.jpg" /></a></li>
				<li><a><img src="images/row3.jpg" /></a></li>
				<li><a><img src="images/row4.jpg" /></a></li>
			</div>
			<div class="clear"></div>

			<!-- 易淘头条 -->
			<div class="marqueenTwo">
				<span class="marqueen-title">易淘头条</span>
				<div class="demo">

					<ul>
						<li class="title-first"><span>[特惠]</span>洋河年末大促，低至两件五折</li>
						<li class="title-first"><span>[公告]</span>商城与广州市签署战略合作协议</li>
						<li><span>[特惠]</span>女生节商城爆品1分秒</li>
						<li><span>[公告]</span>华北、华中部分地区配送延迟</li>
						<li><span>[特惠]</span>家电狂欢千亿礼券买1送1！</li>
						<li><span>[特惠]</span>洋河年末大促，低至两件五折</li>
						<li><span>[公告]</span>华北、华中部分地区配送延迟</li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>

		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">


			<div class="f1">
				<!--易天地-->
				<div class="am-container">
					<div class="shopTitle">
						<h4 class="floor-title">易天地</h4>
						<div class="floor-subtitle">
							<em class="am-icon-caret-left"></em>
							<h3>易起寻找故事</h3>
						</div>
					</div>
				</div>
				
				<div class="search-content">
					<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
						<c:forEach items="${goodslist }" var="goods">
							
								<li><a href="detailAction?id=${goods.id }">
										<div class="i-pic limit">
											<img src="images/${goods.images }" />
											<p class="title fl" name="goods.goodsname">${goods.goodsname }</p>
											<p class="price fl">
												<b>¥</b> <strong>${goods.newprice }</strong>
											</p>
											<p class="number fl">${goods.status }</p>
										</div>
								</a></li>
							

						</c:forEach>
					</ul>
				</div>
				 
				<div class="clear "></div>
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