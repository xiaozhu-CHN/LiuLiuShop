<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/assets/lib/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/assets/lib/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/assets/lib/select2/css/select2.min.css" />
<link rel="stylesheet" type="text/css"
	href="/assets/lib/jquery.bxslider/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css"
	href="/assets/lib/owl.carousel/owl.carousel.css" />
<link rel="stylesheet" type="text/css"
	href="/assets/lib/jquery-ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="/assets/lib/fancyBox/jquery.fancybox.css" />
<link rel="stylesheet" type="text/css" href="/assets/css/animate.css" />
<link rel="stylesheet" type="text/css" href="/assets/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/assets/css/style.css" />
<link rel="stylesheet" type="text/css" href="/assets/css/responsive.css" />
<!-- Script-->
<script type="text/javascript"
	src="/assets/lib/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/select2/js/select2.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/owl.carousel/owl.carousel.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.actual.min.js"></script>
<script type="text/javascript"
	src="/assets/lib/fancyBox/jquery.fancybox.js"></script>
<script type="text/javascript" src="/assets/lib/jquery.elevatezoom.js"></script>
<script type="text/javascript" src="/assets/js/theme-script.js"></script>



<title>溜溜商城-商品评价</title>
<style>

/* 星级评分 */
.shop-rating {
	height: 25px;
	overflow: hidden;
	zoom: 1;
	padding: 2px 0px;
	position: relative;
	z-index: 999;
}

.shop-rating span {
	height: 23px;
	display: block;
	line-height: 23px;
	float: left;
}

.shop-rating span.title {
	width: 125px;
	text-align: right;
	margin-right: 5px;
}

.shop-rating ul {
	float: left;
	margin: 0;
	padding: 0
}

.shop-rating .result {
	margin-left: 20px;
	padding-top: 2px;
}

.shop-rating .result span {
	color: #ff6d02;
}

.shop-rating .result em {
	color: #f60;
	font-family: arial;
	font-weight: bold;
}

.shop-rating .result strong {
	color: #666666;
	font-weight: normal;
}

.rating-level, .rating-level a {
	background: url(http://a.tbcdn.cn/app/rc/img/star_v2.png) no-repeat
		scroll 1000px 1000px;
}

.rating-level {
	background-position: 0px 0px;
	width: 120px;
	height: 23px;
	position: relative;
	z-index: 1000;
}

.rating-level li {
	display: inline;
}

.rating-level a {
	line-height: 23px;
	height: 23px;
	position: absolute;
	top: 0px;
	left: 0px;
	text-indent: -999em;
	*zoom: 1;
	outline: none;
}

.rating-level a.one-star {
	width: 20%;
	z-index: 6;
}

.rating-level a.two-stars {
	width: 40%;
	z-index: 5;
}

.rating-level a.three-stars {
	width: 60%;
	z-index: 4;
}

.rating-level a.four-stars {
	width: 80%;
	z-index: 3;
}

.rating-level a.five-stars {
	width: 100%;
	z-index: 2;
}

.rating-level .current-rating, .rating-level a:hover {
	background-position: 0 -28px;
}

.rating-level a.one-star:hover, .rating-level a.two-stars:hover,
	.rating-level a.one-star.current-rating, .rating-level a.two-stars.current-rating
	{
	background-position: 0 -116px;
}

.rating-level .three-stars .current-rating, .rating-level .four-stars .current-rating,
	.rating-level .five-stars .current-rating {
	background-position: 0 -28px;
}

</style>
</head>
<body class="category-page">
	<!-- HEADER -->
	<div id="header" class="header">
	    <div class="top-header">
	        <div class="container">
	            <div class="nav-top-links">
	                <a class="first-item" href="#"><img alt="phone" src="/assets/images/phone.png" />6666-66-66-66</a>
	                <a href="#"><img alt="email" src="/assets/images/email.png" />联系我们</a>
	            </div>
	            <div class="currency ">
	                <div class="dropdown">
	                      <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">人民币</a>
	                      <ul class="dropdown-menu" role="menu">
	                        <li><a href="#">人民币</a></li>
	                        <li><a href="#">美元</a></li>
	                      </ul>
	                </div>
	            </div>
	            <div class="language ">
	                <div class="dropdown">
	                      <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
	                      <img alt="email" src="/assets/images/ch.jpg" />中文
	                      
	                      </a>
	                      <ul class="dropdown-menu" role="menu">
	                        <li><a href="#"><img alt="email" src="/assets/images/ch.jpg" />中文</a></li>
	                        <li><a href="#"><img alt="email" src="/assets/images/en.jpg" />English</a></li>
	                    </ul>
	                </div>
	            </div>
	            
	            <div class="support-link">
	                <a href="/user/selectOrderByUserId">我的订单</a>
	                <a href="/user/user_wishlist">愿望单</a>
	            </div>
				
	            <div id="user-info-top" class="user-info pull-right">
	             
	                <div class="dropdown">
	                	<#if (user.userCall)??><img src="/imgs/user/${user.userImg!}" alt="pic" height="20" width="20"><#else><img src="/imgs/user/default.png" alt="pic" height="20" width="20"></#if>
	                	<#if (user.userCall)??><a href="/user/user_update">${user.userCall!}</a><#else><a href="/publicpage/user_login">未登录用户</#if>
	                    <a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><span>我的账户</span></a>
	                    <ul class="dropdown-menu mega_dropdown" role="menu">
	                        <#if (user.userCall)??><#else><li><a href="/publicpage/user_login">登录</a></li></#if>
	                        <li><a href="/user/user_email">通知信息</a></li>
	                        <li><a href="/user/toAddress">我的地址</a></li>
	                        <li><a href="/user/selectIntegralByUserId">我的积分</a></li>
	                        <#if (user.userCall)??><li><a href="/user/user_exit">退出</a></li></#if>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!--/.top-header -->
	    <!-- MAIN HEADER -->
	    <div class="container main-header">
	        <div class="row">
	            <div class="col-xs-12 col-sm-3 logo">
	                <a href="/"><img alt="Kute Shop" src="/assets/images/logo.png" /></a>
	            </div>
	            <div class="col-xs-7 col-sm-7 header-search-box">
	                <form class="form-inline" action="/publicpage/category" method="post">
	                      <div class="form-group form-category">
	                        <select class="select-category">
	                            <option value="2">所有类别</option>
	                        </select>
	                      </div>
	                      <div class="form-group input-serach">
	                        <input type="text" name="proName" placeholder="输入关键字">
	                      </div>
	                      <button type="submit" class="pull-right btn-search"></button>
	                </form>
	            </div>
	            <div id="cart-block" class="col-xs-5 col-sm-2 shopping-cart-box">
			                <a class="cart-link" href="/user/user_shopping_cart">
			                    <span class="title">购物车</span>
			                    <span class="total">前往我的购物车</span>
			                    <span class="notify notify-left" id="shopping_cart_number">${shoppingCartNumber!0}</span>
			                </a>
			    </div>
	        </div>    
	    </div>
	    <!-- END MANIN HEADER -->


		<div id="nav-top-menu" class="nav-top-menu">
			<div class="container">
				<div class="row">
					<div class="col-sm-3" id="box-vertical-megamenus">
						<div class="box-vertical-megamenus">
							<h4 class="title">
								<span class="title-menu">商品类别</span> <span
									class="btn-open-mobile pull-right home-page"><i
									class="fa fa-bars"></i></span>
							</h4>
							<div class="vertical-menu-content is-home">
								<ul class="vertical-menu-list">
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/1.png">数码产品</a></li>
									<li><a class="parent" href="category2.html"><img
											class="icon-menu" alt="Funky roots" src="/assets/data/2.png">运动
											&amp; 户外</a>
										<div class="vertical-dropdown-menu">
											<div class="vertical-groups col-sm-12">
												<div class="mega-group col-sm-4">
													<h4 class="mega-group-header">
														<span>网球</span>
													</h4>
													<ul class="group-link-default">
														<li><a href="#">网球</a></li>
														<li><a href="#">外套 &amp; 夹克</a></li>
														<li><a href="#">上衣 &amp; 衬衫</a></li>
														<li><a href="#">吊带衫 &amp; 球座</a></li>
														<li><a href="#">连帽衫 &amp; 运动衫</a></li>
														<li><a href="#">贴身</a></li>
													</ul>
												</div>
												<div class="mega-group col-sm-4">
													<h4 class="mega-group-header">
														<span>游泳</span>
													</h4>
													<ul class="group-link-default">
														<li><a href="#">连衣裙</a></li>
														<li><a href="#">外套 &amp; 夹克</a></li>
														<li><a href="#">上衣 &amp; 衬衫</a></li>
														<li><a href="#">吊带衫 &amp; 球座</a></li>
														<li><a href="#">连帽衫 &amp; 运动衫</a></li>
														<li><a href="#">贴身</a></li>
													</ul>
												</div>
												<div class="mega-group col-sm-4">
													<h4 class="mega-group-header">
														<span>鞋子</span>
													</h4>
													<ul class="group-link-default">
														<li><a href="#">连衣裙</a></li>
														<li><a href="#">外套 &amp; 夹克</a></li>
														<li><a href="#">上衣 &amp; 衬衫</a></li>
														<li><a href="#">吊带衫 &amp; 球座</a></li>
														<li><a href="#">连帽衫 &amp; 运动衫</a></li>
														<li><a href="#">贴身</a></li>
													</ul>
												</div>
												<div class="mega-custom-html col-sm-12">
													<a href="#"><img src="/assets/data/banner-megamenu.jpg"
														alt="Banner"></a>
												</div>
											</div>
										</div></li>
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/3.png">手机 &amp; 平板</a></li>
									<li><a href="category2.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/4.png">健康 &amp; 美容</a></li>
									<li><a class="parent" href="category.html"> <img
											class="icon-menu" alt="Funky roots" src="/assets/data/5.png">鞋子
											&amp; 配饰
									</a>
										<div class="vertical-dropdown-menu">
											<div class="vertical-groups col-sm-12">
												<div class="mega-group col-sm-12">
													<h4 class="mega-group-header">
														<span>特色产品</span>
													</h4>
													<div class="row mega-products">
														<div class="col-sm-3 mega-product">
															<div class="product-avatar">
																<a href="#"><img src="/assets/data/p10.jpg"
																	alt="product1"></a>
															</div>
															<div class="product-name">
																<a href="#">时尚包包</a>
															</div>
															<div class="product-price">
																<div class="new-price">¥38</div>
																<div class="old-price">¥45</div>
															</div>
															<div class="product-star">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-half-o"></i>
															</div>
														</div>
														<div class="col-sm-3 mega-product">
															<div class="product-avatar">
																<a href="#"><img src="/assets/data/p11.jpg"
																	alt="product1"></a>
															</div>
															<div class="product-name">
																<a href="#">时尚包包</a>
															</div>
															<div class="product-price">
																<div class="new-price">¥38</div>
																<div class="old-price">¥45</div>
															</div>
															<div class="product-star">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-half-o"></i>
															</div>
														</div>
														<div class="col-sm-3 mega-product">
															<div class="product-avatar">
																<a href="#"><img src="/assets/data/p12.jpg"
																	alt="product1"></a>
															</div>
															<div class="product-name">
																<a href="#">时尚包包</a>
															</div>
															<div class="product-price">
																<div class="new-price">¥38</div>
																<div class="old-price">¥45</div>
															</div>
															<div class="product-star">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-half-o"></i>
															</div>
														</div>
														<div class="col-sm-3 mega-product">
															<div class="product-avatar">
																<a href="#"><img src="/assets/data/p13.jpg"
																	alt="product1"></a>
															</div>
															<div class="product-name">
																<a href="#">时尚包包</a>
															</div>
															<div class="product-price">
																<div class="new-price">¥38</div>
																<div class="old-price">¥45</div>
															</div>
															<div class="product-star">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-half-o"></i>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div></li>
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/6.png">玩具 &amp; 爱好</a></li>
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/7.png">电脑 &amp; 网络</a></li>
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/8.png">笔记本 &amp; 配件</a></li>
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/9.png">珠宝 &amp; 手表</a></li>
									<li><a href="category.html"><img class="icon-menu"
											alt="Funky roots" src="/assets/data/10.png">台灯 &amp;
											手电筒</a></li>
									<li><a href="category.html"> <img class="icon-menu"
											alt="Funky roots" src="/assets/data/11.png"> 相机 &amp;
											相片
									</a></li>
									<li class="cat-link-orther"><a href="category.html"> <img
											class="icon-menu" alt="Funky roots" src="/assets/data/5.png">
											电视
									</a></li>
									<li class="cat-link-orther"><a href="category.html"> <img
											class="icon-menu" alt="Funky roots" src="/assets/data/7.png">
											电脑 &amp; 网络
									</a></li>
									<li class="cat-link-orther"><a href="category.html"> <img
											class="icon-menu" alt="Funky roots" src="/assets/data/6.png">
											玩具 &amp; 爱好
									</a></li>
									<li class="cat-link-orther"><a href="category.html"><img
											class="icon-menu" alt="Funky roots" src="/assets/data/9.png">
											珠宝 &amp; 手表 </a></li>
								</ul>
								<div class="all-category">
									<span class="open-cate">所有类别</span>
								</div>
							</div>
						</div>
					</div>
					<div id="main-menu" class="col-sm-9 main-menu">
						<nav class="navbar navbar-default">
							<div class="container-fluid">
								<div class="navbar-header">
									<button type="button" class="navbar-toggle collapsed"
										data-toggle="collapse" data-target="#navbar"
										aria-expanded="false" aria-controls="navbar">
										<i class="fa fa-bars"></i>
									</button>
									<a class="navbar-brand" href="#">菜单</a>
								</div>
								<div id="navbar" class="navbar-collapse collapse">
									<ul class="nav navbar-nav">
										<li class="active dropdown"><a class="dropdown-toggle"
											data-toggle="dropdown" href="#">首页</a>
											<ul class="dropdown-menu container-fluid">
												<li class="block-container">
													<ul class="block">
														<li class="link_container"><a href="index.html">Home
																Style 1</a></li>

													</ul>
												</li>
											</ul></li>
										<li class="dropdown"><a href="category.html"
											class="dropdown-toggle" data-toggle="dropdown">时尚</a>
											<ul class="dropdown-menu mega_dropdown" role="menu"
												style="width: 830px;">
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="img_container"><a href="#"> <img
																class="img-responsive" src="/assets/data/men.png"
																alt="sport">
														</a></li>
														<li class="link_container group_header"><a href="#">男士</a>
														</li>
														<li class="link_container"><a href="#">外套</a></li>
														<li class="link_container"><a href="#">夹克</a></li>
														<li class="link_container"><a href="#">上衣</a></li>
														<li class="link_container"><a href="#">围巾</a></li>
														<li class="link_container"><a href="#">裤子</a></li>
													</ul>
												</li>
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="img_container"><a href="#"> <img
																class="img-responsive" src="/assets/data/women.png"
																alt="sport">
														</a></li>
														<li class="link_container group_header"><a href="#">女士</a>
														</li>
														<li class="link_container"><a href="#">裙子</a></li>
														<li class="link_container"><a href="#">夹克</a></li>
														<li class="link_container"><a href="#">上衣</a></li>
														<li class="link_container"><a href="#">围巾</a></li>
														<li class="link_container"><a href="#">裤子</a></li>
													</ul>
												</li>
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="img_container"><a href="#"> <img
																class="img-responsive" src="/assets/data/kid.png"
																alt="sport">
														</a></li>
														<li class="link_container group_header"><a href="#">儿童</a>
														</li>
														<li class="link_container"><a href="#">鞋子</a></li>
														<li class="link_container"><a href="#">衣服</a></li>
														<li class="link_container"><a href="#">上衣</a></li>
														<li class="link_container"><a href="#">围巾</a></li>
														<li class="link_container"><a href="#">配饰</a></li>
													</ul>
												</li>
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="img_container"><a href="#"> <img
																class="img-responsive" src="/assets/data/trending.png"
																alt="sport">
														</a></li>
														<li class="link_container group_header"><a href="#">趋向</a>
														</li>
														<li class="link_container"><a href="#">男士衣服</a></li>
														<li class="link_container"><a href="#">女士衣服</a></li>
														<li class="link_container"><a href="#">儿童衣服</a></li>
														<li class="link_container"><a href="#">类别</a></li>
													</ul>
												</li>
											</ul></li>
										<li><a href="category.html">运动</a></li>
										<li class="dropdown"><a href="category.html"
											class="dropdown-toggle" data-toggle="dropdown">食物</a>
											<ul class="mega_dropdown dropdown-menu" style="width: 830px;">
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="link_container group_header"><a href="#">亚洲</a>
														</li>
														<li class="link_container"><a href="#">越南</a></li>
														<li class="link_container"><a href="#">面条</a></li>
														<li class="link_container"><a href="#">海鲜</a></li>
														<li class="link_container group_header"><a href="#">香肠</a>
														</li>
														<li class="link_container"><a href="#">肉类</a></li>
														<li class="link_container"><a href="#">甜点</a></li>
														<li class="link_container"><a href="#">高级</a></li>
														<li class="link_container"><a href="#">高级</a></li>
													</ul>
												</li>
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="link_container group_header"><a href="#">欧洲</a>
														</li>
														<li class="link_container"><a href="#">希腊马铃薯</a></li>
														<li class="link_container"><a href="#">意大利面</a></li>
														<li class="link_container"><a href="#">意大利面</a></li>
														<li class="link_container group_header"><a href="#">鸡肉</a>
														</li>
														<li class="link_container"><a href="#">意大利披萨</a></li>
														<li class="link_container"><a href="#">法国蛋糕</a></li>
														<li class="link_container"><a href="#">高等</a></li>
														<li class="link_container"><a href="#">高等</a></li>
													</ul>
												</li>
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="link_container group_header"><a href="#">快餐</a>
														</li>
														<li class="link_container"><a href="#">汉堡</a></li>
														<li class="link_container"><a href="#">披萨</a></li>
														<li class="link_container"><a href="#">面条</a></li>
														<li class="link_container group_header"><a href="#">三明治</a>
														</li>
														<li class="link_container"><a href="#">沙拉</a></li>
														<li class="link_container"><a href="#">面团</a></li>
														<li class="link_container"><a href="#">高等的</a></li>
														<li class="link_container"><a href="#">高级的</a></li>
													</ul>
												</li>
												<li class="block-container col-sm-3">
													<ul class="block">
														<li class="img_container"><img
															src="/assets/data/banner-topmenu.jpg" alt="Banner">
														</li>
													</ul>
												</li>

											</ul></li>
										<li class="dropdown"><a href="category.html"
											class="dropdown-toggle" data-toggle="dropdown">数码产品</a>
											<ul class="dropdown-menu container-fluid">
												<li class="block-container">
													<ul class="block">
														<li class="link_container"><a href="#">手机</a></li>
														<li class="link_container"><a href="#">平板</a></li>
														<li class="link_container"><a href="#">笔记本电脑</a></li>
														<li class="link_container"><a href="#">记忆卡</a></li>
														<li class="link_container"><a href="#">配件</a></li>
													</ul>
												</li>
											</ul></li>
										<li><a href="category.html">家具</a></li>
										<li><a href="category.html">珠宝</a></li>
										<li class="dropdown"><a href="category.html"
											class="dropdown-toggle" data-toggle="dropdown">Pages</a>
											<ul class="mega_dropdown dropdown-menu" style="width: 830px;">
												<li class="block-container col-sm-4">
													<ul class="block">
														<li class="link_container group_header"><a href="#">Page</a>
														</li>
														<li class="link_container"><a href="category.html">分类左侧边栏</a>
														</li>
														<li class="link_container"><a href="category2.html">分类右侧边栏</a>
														</li>
														<li class="link_container"><a href="detail.html">产品左侧边栏</a>
														</li>

														<li class="link_container"><a href="detail2.html">产品全览</a>
														</li>
														<li class="link_container"><a href="detail3.html">产品右边栏</a>
														</li>
													</ul>
												</li>
												<li class="block-container col-sm-4">
													<ul class="block">
														<li class="link_container group_header"><a href="#">Page</a>
														</li>
														<li class="link_container"><a href="wishlist.html">愿望单</a>
														</li>
														<li class="link_container"><a href="compare.html">比较</a>
														</li>
														<li class="link_container"><a href="order.html">订购</a>
														</li>
														<li class="link_container"><a href="checkout.html">结算</a>
														</li>
														<li class="link_container"><a href="login.html">登录</a>
														</li>
													</ul>
												</li>
												<li class="block-container col-sm-4">
													<ul class="block">
														<li class="link_container group_header"><a href="#">Page</a>
														</li>
														<li class="link_container"><a href="blog.html">Blog</a>
														</li>
														<li class="link_container"><a href="blog-detail.html">Blog
																Post</a></li>
														<li class="link_container"><a href="about.html">About
																Us</a></li>
														<li class="link_container"><a href="contact.html">Contact
																Us</a></li>
													</ul>
												</li>
											</ul></li>
									</ul>
								</div>
								<!--/.nav-collapse -->
							</div>
						</nav>
					</div>
				</div>
				<!-- userinfo on top-->
				<div id="form-search-opntop"></div>
				<!-- userinfo on top-->
				<div id="user-info-opntop"></div>
				<!-- CART ICON ON MMENU -->
				<div id="shopping-cart-box-ontop">
					<i class="fa fa-shopping-cart"></i>
					<div class="shopping-cart-box-ontop-content"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->
	<div class="container" id="columns">
		<!-- breadcrumb -->
		<div class="breadcrumb clearfix">
			<a class="home" href="#" title="Return to Home">首页</a> 
			<span class="navigation-pipe">&nbsp;</span> <span class="navigation_page">我的订单</span>
			<span class="navigation-pipe">&nbsp;</span> <span class="navigation_page">商品评论</span>
		</div>
		<!-- ./breadcrumb -->
		<!-- row -->
		<div class="row">

			<!-- Center colunm-->
			<div class="center_column col-xs-12 col-sm-12" id="center_column">
				<!-- Product -->
				<div id="product">
					<div class="primary-box row">
						<div class="pb-left-column col-xs-12 col-sm-3">
							<!-- product-imge-->
							<div class="product-image">
								<div class="product-full">
									<img id="product" src='/imgs/property/${proprImg!}'
										style="height: 230px;">
								</div>
							</div>
							<!-- product-imge-->
						</div>
						<div class="pb-right-column col-xs-12 col-sm-6">
							<h1 class="product-name">${proName!}</h1>
							<div class="product-price-group">
								<span class="price">¥${proprPromotePrice!}</span>
							</div>
							<div class="form-option">
								<!-- <div class="form-share">
									<div class="sendtofriend-print">
										<a href="#"><i class="fa fa-envelope-o fa-fw"></i>分享</a>
									</div>
									<div class="network-share"></div>
								</div> -->
							</div>
						</div>
						<!-- tab product -->
							<div class="tab-container">
								<div id="product-detail" class="tab-panel active">
									<table class="table table-bordered">
										<!-- <table --class="table table-border table-bordered table-hover table-bg table-sort"> -->
										
										<div class="panel-body">
								<div id="myTabContent" class="tab-content category-list">
									<div class="tab-pane active " id="grid-container">
										<div class="category-product">
											
									</div>
								</div>
							</div>
							
						</div>
									</table>
								</div>
							</div>
							
					<div><br></div>		
					<div class="product-tab">
						<ul class="nav-tab">
							<li class="active"><a aria-expanded="false"
								data-toggle="tab" >立即评价</a></li>

						</ul>
						<div class="tab-container">
							<div id="product-detail" class="tab-panel active">
								<table class="table table-bordered">
									<tr>
										<td width="30px"><font size="3">星级评分</font></td>

										<td>
											<div class="shop-rating">
												<span class="title">商品评分：</span>
												<ul class="rating-level" id="stars1">
													<li><a class="one-star" star:value="1" href="#">1</a></li>
													<li><a class="two-stars" star:value="2" href="#">2</a></li>
													<li><a class="three-stars" star:value="3" href="#">3</a></li>
													<li><a class="four-stars" star:value="4" href="#">4</a></li>
													<li><a class="five-stars" star:value="5" href="#">5</a></li>
												</ul>
												<span class="result" id="stars1-tips"></span> <input
													type="hidden" id="stars1-input" name="a" value="0" size="2" />
											</div>

											<div class="shop-rating">
												<span class="title">物流评分：</span>
												<ul class="rating-level" id="stars2">
													<li><a class="one-star" star:value="1" href="#">1</a></li>
													<li><a class="two-stars" star:value="2" href="#">2</a></li>
													<li><a class="three-stars" star:value="3" href="#">3</a></li>
													<li><a class="four-stars" star:value="4" href="#">4</a></li>
													<li><a class="five-stars" star:value="5" href="#">5</a></li>
												</ul>
												<span class="result" id="stars2-tips"></span> <input
													type="hidden" id="stars2-input" name="b" value="0" size="2" />
											</div>

											<div class="shop-rating">
												<span class="title">服务评分：</span>
												<ul class="rating-level" id="stars3">
													<li><a class="one-star" star:value="1" href="#">1</a></li>
													<li><a class="two-stars" star:value="2" href="#">2</a></li>
													<li><a class="three-stars" star:value="3" href="#">3</a></li>
													<li><a class="four-stars" star:value="4" href="#">4</a></li>
													<li><a class="five-stars" star:value="5" href="#">5</a></li>
												</ul>
												<span class="result" id="stars3-tips"></span> <input
													type="hidden" id="stars3-input" name="c" value="0" size="2" />
											</div> <br />
										</td>
									</tr>
									<tr>
										<td><font size="3">文字评价</font></td>
										<td><textarea class="review-content" id="review-content"
												placeholder="您的评价将有助于其他买家参考"
												style="width: 1124px; height: 105px;"></textarea></td>
									</tr>
								</table>
							</div>
							<div style="text-align: center; padding: 20px;">
								<button class="button" onclick="review_add_submit()">
									<i class="fa fa-check"></i> 提交评价
								</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<div id="footer-menu-box">
				<p class="text-center">Copyrights &#169; 2019 LiuLiuShop. All
					Rights Reserved. Designed by liuliu.com</p>
			</div>
		</div>
	</footer>
	<a href="#" class="scroll_top" title="回到顶部" style="display: inline;">回到顶部</a>
	<!-- Footer -->
</body>
<script>
		/* $("#test").click(function() {
			alert("物流评分=" + $("#stars1-input").val() + " 分");
			alert("商品评分=" + $("#stars2-input").val() + " 分");
			alert("服务态度="'' + $("#stars3-input").val() + " 分");
		}); */


		var Class = {
			create: function() {
				return function() {
					this.initialize.apply(this, arguments);
				}
			}
		}
		var Extend = function(destination, source) {
			for (var property in source) {
				destination[property] = source[property];
			}
		}

		function stopDefault(e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			} else {
				window.event.returnValue = false;
			}
			return false;
		}
		/**
		 * 星星打分组件
		 *
		 * @author    Yunsd
		 * @date        2010-7-5
		 */
		var Stars = Class.create();
		Stars.prototype = {
			initialize: function(star, options) {
				this.SetOptions(options); //默认属性
				var flag = 999; //定义全局指针
				var isIE = (document.all) ? true : false; //IE?
				var starlist = document.getElementById(star).getElementsByTagName('a'); //星星列表
				var input = document.getElementById(this.options.Input) || document.getElementById(star + "-input"); // 输出结果
				var tips = document.getElementById(this.options.Tips) || document.getElementById(star + "-tips"); // 打印提示
				var nowClass = " " + this.options.nowClass; // 定义选中星星样式名
				var tipsTxt = this.options.tipsTxt; // 定义提示文案
				var len = starlist.length; //星星数量


				for (i = 0; i < len; i++) { // 绑定事件 点击 鼠标滑过
					starlist[i].value = i;
					starlist[i].onclick = function(e) {
						stopDefault(e);
						this.className = this.className + nowClass;
						flag = this.value;
						input.value = this.getAttribute("star:value");
						tips.innerHTML = tipsTxt[this.value]
					}
					starlist[i].onmouseover = function() {
						if (flag < 999) {
							var reg = RegExp(nowClass, "g");
							starlist[flag].className = starlist[flag].className.replace(reg, "")
						}
					}
					starlist[i].onmouseout = function() {
						if (flag < 999) {
							starlist[flag].className = starlist[flag].className + nowClass;
						}
					}
				};
				if (isIE) { //FIX IE下样式错误
					var li = document.getElementById(star).getElementsByTagName('li');
					for (var i = 0, len = li.length; i < len; i++) {
						var c = li[i];
						if (c) {
							c.className = c.getElementsByTagName('a')[0].className;
						}
					}
				}
			},
			//设置默认属性
			SetOptions: function(options) {
				this.options = { //默认值
					Input: "", //设置触保存分数的INPUT
					Tips: "", //设置提示文案容器
					nowClass: "current-rating", //选中的样式名
					tipsTxt: ["1分-非常不满意", "2分-不满意", "3分-一般", "4分-很好", "5分-非常好"] //提示文案
				};
				Extend(this.options, options || {});
			}
		}

		var Stars1 = new Stars("stars1");
		var Stars2 = new Stars("stars2");
		var Stars3 = new Stars("stars3");

		//var review_userId=${userId!};
		
		
		/*提交评论*/
		function review_add_submit(){
			var pro_id = ${proId!};
			var oi_id= ${oiId!};
			var review_content=$("#review-content").val();
			//var review_proId=${proId!};
			//var review_reImg=$("#review_file").val();
			var re_commodity = $("#stars1-input").val();
			var re_logistics = $("#stars2-input").val();
			var re_shop = $("#stars3-input").val();

			if(re_commodity!=0){
				if(re_logistics!=0){
					if(re_shop!=0){
						if(review_content!==""){
							 $.ajax({
							        type: "POST",
							        url: "/user/review_add",
							        data: {reContent:review_content,reCommodity:re_commodity,reLogistics:re_logistics,reShop:re_shop,proId:pro_id,oiId:oi_id},
							        dataType: "text",
							        success: function(data){
							        	if(data=="success"){
							        		alert("评论成功，感谢您的支持！");
							        		window.location="/user/selectOrderByUserId";
							        	}else{
							        		alert("评论失败！");
							        	}
							        },
							        error:function() { alert("服务器错误！");}
								});
						}else{
							alert("亲~还没输入评论哟");
						}
					}else{
						alert("亲~请给服务打分哟");
					}
					
				}else{
					alert("亲~请给物流打分哟");
				}
				
				}else{
					alert("亲~请给商品打分哟"); 
				}
			}
		
		
	</script>
</html>

