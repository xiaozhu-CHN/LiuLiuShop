<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>编辑地址</title>
		<!--页头-->

		<link rel="stylesheet" type="text/css" href="/assets/lib/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/font-awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/select2/css/select2.min.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/jquery.bxslider/jquery.bxslider.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/owl.carousel/owl.carousel.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/jquery-ui/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/fancyBox/jquery.fancybox.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/animate.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/responsive.css" />
		<!-- Script-->
		<script type="text/javascript" src="/assets/lib/jquery/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="/assets/lib/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/assets/lib/select2/js/select2.min.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="/assets/lib/owl.carousel/owl.carousel.min.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/assets/js/jquery.actual.min.js"></script>
		<script type="text/javascript" src="/assets/lib/fancyBox/jquery.fancybox.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery.elevatezoom.js"></script>
		<script type="text/javascript" src="/assets/js/theme-script.js"></script>

		<link rel="stylesheet" type="text/css" href="/assets/css/address/base.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/address/checkOut.css" />
		<script type="text/javascript" src="/assets/js/address/jquery_cart.js"></script>
		<script src="/assets/js/address/base.min.js"></script>
		<script type="text/javascript" src="/assets/js/address/address_all.js"></script>
		<script type="text/javascript" src="/assets/js/address/checkout.min.js"></script>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script src="/assets/js/address/unslider.min.js" type="text/javascript"></script>
		<script src="/assets/js/address/index.js" type="text/javascript"></script>


	</head>

	<body>
		<script type="text/javascript">
			var checkoutConfig = {
				addressMatch: 'common',
				addressMatchVarName: 'data',
				hasPresales: false,
				hasBigTv: false,
				hasAir: false,
				hasScales: false,
				hasGiftcard: false,
				totalPrice: 244.00,
				postage: 10, //运费
				postFree: true, //活动是否免邮了
				bcPrice: 150, //计算界值
				activityDiscountMoney: 0.00, //活动优惠
				showCouponBox: 0,
				invoice: {
					NA: "0",
					personal: "1",
					company: "2",
					electronic: "4"
				}
			};
			var miniCartDisable = true;
		</script>
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
									<span class="title-menu">商品类别</span>
									<span class="btn-open-mobile pull-right home-page"><i class="fa fa-bars"></i></span>
								</h4>
								<div class="vertical-menu-content is-home">
									<ul class="vertical-menu-list">
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/1.png">数码产品</a></li>
										<li>
											<a class="parent" href="category2.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/2.png">运动
												&amp; 户外</a>
											<div class="vertical-dropdown-menu">
												<div class="vertical-groups col-sm-12">
													<div class="mega-group col-sm-4">
														<h4 class="mega-group-header"><span>网球</span></h4>
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
														<h4 class="mega-group-header"><span>游泳</span></h4>
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
														<h4 class="mega-group-header"><span>鞋子</span></h4>
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
														<a href="#"><img src="/assets/data/banner-megamenu.jpg" alt="Banner"></a>
													</div>
												</div>
											</div>
										</li>
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/3.png">手机 &amp; 平板</a></li>
										<li><a href="category2.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/4.png">健康 &amp; 美容</a></li>
										<li>
											<a class="parent" href="category.html">
												<img class="icon-menu" alt="Funky roots" src="/assets/data/5.png">鞋子 &amp; 配饰</a>
											<div class="vertical-dropdown-menu">
												<div class="vertical-groups col-sm-12">
													<div class="mega-group col-sm-12">
														<h4 class="mega-group-header"><span>特色产品</span></h4>
														<div class="row mega-products">
															<div class="col-sm-3 mega-product">
																<div class="product-avatar">
																	<a href="#"><img src="/assets/data/p10.jpg" alt="product1"></a>
																</div>
																<div class="product-name">
																	<a href="#">时尚包包</a>
																</div>
																<div class="product-price">
																	<div class="new-price">¥38</div>
																	<div class="old-price">¥45</div>
																</div>
																<div class="product-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-half-o"></i>
																</div>
															</div>
															<div class="col-sm-3 mega-product">
																<div class="product-avatar">
																	<a href="#"><img src="/assets/data/p11.jpg" alt="product1"></a>
																</div>
																<div class="product-name">
																	<a href="#">时尚包包</a>
																</div>
																<div class="product-price">
																	<div class="new-price">¥38</div>
																	<div class="old-price">¥45</div>
																</div>
																<div class="product-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-half-o"></i>
																</div>
															</div>
															<div class="col-sm-3 mega-product">
																<div class="product-avatar">
																	<a href="#"><img src="/assets/data/p12.jpg" alt="product1"></a>
																</div>
																<div class="product-name">
																	<a href="#">时尚包包</a>
																</div>
																<div class="product-price">
																	<div class="new-price">¥38</div>
																	<div class="old-price">¥45</div>
																</div>
																<div class="product-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-half-o"></i>
																</div>
															</div>
															<div class="col-sm-3 mega-product">
																<div class="product-avatar">
																	<a href="#"><img src="/assets/data/p13.jpg" alt="product1"></a>
																</div>
																<div class="product-name">
																	<a href="#">时尚包包</a>
																</div>
																<div class="product-price">
																	<div class="new-price">¥38</div>
																	<div class="old-price">¥45</div>
																</div>
																<div class="product-star">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-half-o"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/6.png">玩具 &amp; 爱好</a></li>
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/7.png">电脑 &amp; 网络</a></li>
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/8.png">笔记本 &amp; 配件</a></li>
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/9.png">珠宝 &amp; 手表</a></li>
										<li><a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/10.png">台灯 &amp; 手电筒</a></li>
										<li>
											<a href="category.html">
												<img class="icon-menu" alt="Funky roots" src="/assets/data/11.png">
												相机 &amp; 相片
											</a>
										</li>
										<li class="cat-link-orther">
											<a href="category.html">
												<img class="icon-menu" alt="Funky roots" src="/assets/data/5.png">
												电视
											</a>
										</li>
										<li class="cat-link-orther">
											<a href="category.html">
												<img class="icon-menu" alt="Funky roots" src="/assets/data/7.png">
												电脑 &amp; 网络
											</a>
										</li>
										<li class="cat-link-orther">
											<a href="category.html">
												<img class="icon-menu" alt="Funky roots" src="/assets/data/6.png">
												玩具 &amp; 爱好
											</a>
										</li>
										<li class="cat-link-orther">
											<a href="category.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/9.png">
												珠宝 &amp; 手表
											</a>
										</li>
									</ul>
									<div class="all-category"><span class="open-cate">所有类别</span></div>
								</div>
							</div>
						</div>
						<div id="main-menu" class="col-sm-9 main-menu">
							<nav class="navbar navbar-default">
								<div class="container-fluid">
									<div class="navbar-header">
										<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
										 aria-expanded="false" aria-controls="navbar">
											<i class="fa fa-bars"></i>
										</button>
										<a class="navbar-brand" href="#">菜单</a>
									</div>
									<div id="navbar" class="navbar-collapse collapse">
										<ul class="nav navbar-nav">
											<li class="active dropdown">
												<a class="dropdown-toggle" data-toggle="dropdown" href="#">首页</a>
												<ul class="dropdown-menu container-fluid">
													<li class="block-container">
														<ul class="block">
															<li class="link_container"><a href="index.html">Home Style 1</a></li>

														</ul>
													</li>
												</ul>
											</li>
											<li class="dropdown">
												<a href="category.html" class="dropdown-toggle" data-toggle="dropdown">时尚</a>
												<ul class="dropdown-menu mega_dropdown" role="menu" style="width: 830px;">
													<li class="block-container col-sm-3">
														<ul class="block">
															<li class="img_container">
																<a href="#">
																	<img class="img-responsive" src="/assets/data/men.png" alt="sport">
																</a>
															</li>
															<li class="link_container group_header">
																<a href="#">男士</a>
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
															<li class="img_container">
																<a href="#">
																	<img class="img-responsive" src="/assets/data/women.png" alt="sport">
																</a>
															</li>
															<li class="link_container group_header">
																<a href="#">女士</a>
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
															<li class="img_container">
																<a href="#">
																	<img class="img-responsive" src="/assets/data/kid.png" alt="sport">
																</a>
															</li>
															<li class="link_container group_header">
																<a href="#">儿童</a>
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
															<li class="img_container">
																<a href="#">
																	<img class="img-responsive" src="/assets/data/trending.png" alt="sport">
																</a>
															</li>
															<li class="link_container group_header">
																<a href="#">趋向</a>
															</li>
															<li class="link_container"><a href="#">男士衣服</a></li>
															<li class="link_container"><a href="#">女士衣服</a></li>
															<li class="link_container"><a href="#">儿童衣服</a></li>
															<li class="link_container"><a href="#">类别</a></li>
														</ul>
													</li>
												</ul>
											</li>
											<li><a href="category.html">运动</a></li>
											<li class="dropdown">
												<a href="category.html" class="dropdown-toggle" data-toggle="dropdown">食物</a>
												<ul class="mega_dropdown dropdown-menu" style="width: 830px;">
													<li class="block-container col-sm-3">
														<ul class="block">
															<li class="link_container group_header">
																<a href="#">亚洲</a>
															</li>
															<li class="link_container">
																<a href="#">越南</a>
															</li>
															<li class="link_container">
																<a href="#">面条</a>
															</li>
															<li class="link_container">
																<a href="#">海鲜</a>
															</li>
															<li class="link_container group_header">
																<a href="#">香肠</a>
															</li>
															<li class="link_container">
																<a href="#">肉类</a>
															</li>
															<li class="link_container">
																<a href="#">甜点</a>
															</li>
															<li class="link_container">
																<a href="#">高级</a>
															</li>
															<li class="link_container">
																<a href="#">高级</a>
															</li>
														</ul>
													</li>
													<li class="block-container col-sm-3">
														<ul class="block">
															<li class="link_container group_header">
																<a href="#">欧洲</a>
															</li>
															<li class="link_container">
																<a href="#">希腊马铃薯</a>
															</li>
															<li class="link_container">
																<a href="#">意大利面</a>
															</li>
															<li class="link_container">
																<a href="#">意大利面</a>
															</li>
															<li class="link_container group_header">
																<a href="#">鸡肉</a>
															</li>
															<li class="link_container">
																<a href="#">意大利披萨</a>
															</li>
															<li class="link_container">
																<a href="#">法国蛋糕</a>
															</li>
															<li class="link_container">
																<a href="#">高等</a>
															</li>
															<li class="link_container">
																<a href="#">高等</a>
															</li>
														</ul>
													</li>
													<li class="block-container col-sm-3">
														<ul class="block">
															<li class="link_container group_header">
																<a href="#">快餐</a>
															</li>
															<li class="link_container">
																<a href="#">汉堡</a>
															</li>
															<li class="link_container">
																<a href="#">披萨</a>
															</li>
															<li class="link_container">
																<a href="#">面条</a>
															</li>
															<li class="link_container group_header">
																<a href="#">三明治</a>
															</li>
															<li class="link_container">
																<a href="#">沙拉</a>
															</li>
															<li class="link_container">
																<a href="#">面团</a>
															</li>
															<li class="link_container">
																<a href="#">高等的</a>
															</li>
															<li class="link_container">
																<a href="#">高级的</a>
															</li>
														</ul>
													</li>
													<li class="block-container col-sm-3">
														<ul class="block">
															<li class="img_container">
																<img src="/assets/data/banner-topmenu.jpg" alt="Banner">
															</li>
														</ul>
													</li>

												</ul>
											</li>
											<li class="dropdown">
												<a href="category.html" class="dropdown-toggle" data-toggle="dropdown">数码产品</a>
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
												</ul>
											</li>
											<li><a href="category.html">家具</a></li>
											<li><a href="category.html">珠宝</a></li>
											<li class="dropdown">
												<a href="category.html" class="dropdown-toggle" data-toggle="dropdown">Pages</a>
												<ul class="mega_dropdown dropdown-menu" style="width: 830px;">
													<li class="block-container col-sm-4">
														<ul class="block">
															<li class="link_container group_header">
																<a href="#">Page</a>
															</li>
															<li class="link_container">
																<a href="category.html">分类左侧边栏</a>
															</li>
															<li class="link_container">
																<a href="category2.html">分类右侧边栏</a>
															</li>
															<li class="link_container">
																<a href="detail.html">产品左侧边栏</a>
															</li>

															<li class="link_container">
																<a href="detail2.html">产品全览</a>
															</li>
															<li class="link_container">
																<a href="detail3.html">产品右边栏</a>
															</li>
														</ul>
													</li>
													<li class="block-container col-sm-4">
														<ul class="block">
															<li class="link_container group_header">
																<a href="#">Page</a>
															</li>
															<li class="link_container">
																<a href="wishlist.html">愿望单</a>
															</li>
															<li class="link_container">
																<a href="compare.html">比较</a>
															</li>
															<li class="link_container">
																<a href="order.html">订购</a>
															</li>
															<li class="link_container">
																<a href="checkout.html">结算</a>
															</li>
															<li class="link_container">
																<a href="login.html">登录</a>
															</li>
														</ul>
													</li>
													<li class="block-container col-sm-4">
														<ul class="block">
															<li class="link_container group_header">
																<a href="#">Page</a>
															</li>
															<li class="link_container">
																<a href="blog.html">Blog</a>
															</li>
															<li class="link_container">
																<a href="blog-detail.html">Blog Post</a>
															</li>
															<li class="link_container">
																<a href="about.html">About Us</a>
															</li>
															<li class="link_container">
																<a href="contact.html">Contact Us</a>
															</li>
														</ul>
													</li>
												</ul>
											</li>
										</ul>
									</div>
									<!--/.nav-collapse -->
								</div>
							</nav>
						</div>
					</div>
					<!-- userinfo on top-->
					<div id="form-search-opntop">
					</div>
					<!-- userinfo on top-->
					<div id="user-info-opntop">
					</div>
					<!-- CART ICON ON MMENU -->
					<div id="shopping-cart-box-ontop">
						<i class="fa fa-shopping-cart"></i>
						<div class="shopping-cart-box-ontop-content"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- end header -->

		<div class="columns-container">
			<div class="container" id="columns">
				<!-- breadcrumb -->

				<!-- ./breadcrumb -->
				<!-- page heading-->
				<h2 class="page-heading">
					<span class="page-heading-title2">修改地址</span>
				</h2>
				<!-- ../page heading-->
				<div class="page-content">
					<div class="row">
						<img src="/assets/images/dizhi.png" alt="温馨提示" />
						<div class="col-sm-4">

						</div>
						<!--点击弹出新增/收货地址界面start-->
						<div class="xm-edit-addr-box" id="J_editAddrBox">
							<div class="bd">
								<div class="item">
									<label>收货人姓名<span>*</span></label>
									<p style="color:red" id="msg"></P>
									<input type="text" name="userAddress[consignee]" id="Consignee" class="input" placeholder="收货人姓名" maxlength="15"
									 autocomplete='off'>
									<p class="tip-msg tipMsg"></p>
								</div>
								<div class="item">
									<label>联系电话<span>*</span></label>
									<input type="text" name="userAddress[tel]" class="input" id="Telephone" placeholder="11位手机号" autocomplete='off'>
									<p class="tel-modify-tip" id="telModifyTip"></p>
									<p class="tip-msg tipMsg"></p>
								</div>
								<div class="item">
									<label>地址<span>*</span></label>
									<select id="province" class="select-1">
										<option value="">省份/自治区</option>
										<#if provinceList?? && provinceList?size != 0>
											<#list provinceList as province>
												<option value="${(province.provinceId)!}">${(province.provinceName)!}</option>
										  	</#list>
										</#if>
									</select>
									<select  id="city" class="select-2">
										<option value="">城市/地区/自治州</option>
									</select>
									<select  id="areaId" class="select-3">
									    <option value="">区/县</option>								
									</select>
									<textarea name="userAddress[street]" class="input-area" id="Street" placeholder="路名或街道地址，门牌号"></textarea>
									<p class="tip-msg tipMsg"></p>
								</div>
								<div class="item">
									<label>邮政编码<span>*</span></label>
									<input type="text" name="userAddress[zipcode]" id="Zipcode" class="input" placeholder="邮政编码" autocomplete='off'>
									<p class="zipcode-tip" id="zipcodeTip"></p>
									<p class="tip-msg tipMsg"></p>
								</div>
							</div>
							<div class="ft clearfix">
								<button type="button" class="btn btn-lineDake btn-small" onclick="canceladd()">取消</button>
								<button type="button" class="btn btn-primary  btn-small" onclick="addUserAdreeinfo()">保存</button>
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
					<p class="text-center">Copyrights &#169; 2019 LiuLiuShop. All Rights Reserved. Designed by liuliu.com</p>
				</div>
			</div>
		</footer>
		<a href="#" class="scroll_top" title="回到顶部" style="display: inline;">回到顶部</a>
		
		<script type="text/javascript">
		    function canceladd(){
		    	window.location.href="/user/toAddress";
		    	
		    }
		    function addUserAdreeinfo(){
		    	var usad_name = $("#Consignee").val();
				var usad_phone = $("#Telephone").val();
				var area_name = $("#areaId").val();
				var usad_adress = $("#Street").val();
				var user_ems = $("#Zipcode").val();
				if(usad_name.length<=0)$("#msg").html("收货人不能为空!");
				else if(usad_phone.length<=0)$("#msg").html("手机号码不能为空!");				
				else if(area_name==null)$("#msg").html("请选择省/市/区！");
				else if(usad_adress.length<=0)$("#msg").html("请填写详细地址!");
				else if(user_ems.length<=0)$("#msg").html("邮政编码不能为空!");
				else {					
					$.ajax({
			            type: "POST",
			            url: "/user/userAdressinfoAdd",
			            data: {usadName:usad_name,usadPhone:usad_phone,areaId:area_name,usadAdress:usad_adress,usadEms:user_ems},			          
			            success: function(){				            	
				            alert("添加成功！");
				            window.location.href="/user/toAddress"; 				            		
				        },
				        error:function() { $("#msg").html("添加错误");} 
					});
				}
				
		    }
		    //获取市
			$("#province").change(function(){
				var province_id = $(this).children('option:selected').val();
				if(province_id!=""){
					 $.ajax({
			             type: "POST",
			             url: "/user/city_all",
			             data: {provinceId:province_id},
			             dataType: "json",
			             success: function(data){
			            	 var html='';
			            	 html += '<option value="" selected>城市/地区/自治州</option>'
			             	$.each(data, function(index, item){
			             		html +='<option value="'+item.cityId+'">'+item.cityName+'</option>';
			             	});
			            	 $("#city").html(html);
			             },
			             error:function() {$("#msg").html("获取地址错误！");}
			         });
				}else{
					$("#msg").html("请选择省份！");
				}
			});
			
			
			//获取区
			$("#city").change(function(){
				var city_id = $(this).children('option:selected').val();
				if(city_id!=""){
					 $.ajax({
			             type: "POST",
			             url: "/user/area_all",
			             data: {cityId:city_id},
			             dataType: "json",
			             success: function(data){
			            	 var html='';
			            	 html += '<option value="" selected>请选择区/县</option>'
			             	$.each(data, function(index, item){
			             		html +='<option value="'+item.areaId+'">'+item.areaName+'</option>';
			             	});
			            	 $("#areaId").html(html);
			             },
			             error:function() {$("#msg").html("获取地址错误！");}
			         });
				}else{
					$("#msg").html("请选择城市！");
				}
			});
		</script>

	</body>
</html>
