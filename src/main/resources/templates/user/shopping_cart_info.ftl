
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cn">

	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>溜溜商城—购物车</title>
		<link rel="stylesheet" type="text/css" href="/assets/lib/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/font-awesome/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/select2/css/select2.min.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/jquery.bxslider/jquery.bxslider.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/owl.carousel/owl.carousel.css" />
		<link rel="stylesheet" type="text/css" href="/assets/lib/jquery-ui/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/animate.css" />
		
		<link rel="stylesheet" type="text/css" href="/assets/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/assets/css/responsive.css" />
		
		
		<link rel="stylesheet" type="text/css" href="/assets/css/jiesuan/style.css">
		<link rel="stylesheet" type="text/css" href="/assets/css/jiesuan/css.css" />
		
		<!-- Script-->
		<script type="text/javascript" src="/assets/lib/jquery/jquery-1.11.2.min.js"></script>
		<script type="text/javascript" src="/assets/lib/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/assets/lib/select2/js/select2.min.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="/assets/lib/owl.carousel/owl.carousel.min.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
		<script type="text/javascript" src="/assets/lib/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/assets/js/jquery.actual.min.js"></script>
		<script type="text/javascript" src="/assets/js/theme-script.js"></script>
	</head>
	<style type="text/css">
				#footer{
					position:absolute;
					left:380px;
					bottom:0px;
					}
				.shopping_content{
					bottom:00px;
				}
	</style>

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
				
				
		    <div >
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
		                                    <a class="parent" href="category2.html"><img class="icon-menu" alt="Funky roots" src="/assets/data/2.png">运动 &amp; 户外</a>
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
		                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
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
		                            </div><!--/.nav-collapse -->
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

		<!--商品内容-->
		<div class="shopping_content">
			<h2>我的购物车</h2>
			<div class="shopping_table">
				<table border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center;">
					<tr>
						<th style="text-align: center;"><input type="checkbox" id="quanxuan"></th>
						<th style="text-align: center;">商品图片</th>
						<th style="text-align: center;">商品店铺</th>
						<th style="text-align: center;">商品名称</th>
						<th style="text-align: center;">商品属性</th>
						<th style="text-align: center;">商品价格</th>
						<th style="text-align: center;">商品数量</th>
						<th style="text-align: center;">商品操作</th>
					</tr>
					<#if cartPropertyProductVOList?? && cartPropertyProductVOList?size != 0>
						<#list cartPropertyProductVOList! as cartPropertyProductVO> 
							<tr>
								<td>
									<input type="checkbox" name="choose" value="${cartPropertyProductVO.shId!}" onclick="checkbox_olk(this,${cartPropertyProductVO.shId!})"/>
								</td>
								<td>
									<a><img src="/imgs/property/${cartPropertyProductVO.proprImg}" style="width:120px;"/></a>
								</td>
								<td><span>${cartPropertyProductVO.productStoreCall!}</span></td>
								<td><a target="_blank" style="text-decoration:underline;" href="/publicpage/product?proId=${cartPropertyProductVO.proId!}">${cartPropertyProductVO.proName!}</a></td>
								<td>
									<span>${cartPropertyProductVO.proprName!}</span>
								</td>
								<td>
									¥<span class="span_momey" id ="span_momey_${cartPropertyProductVO.shId!}">${cartPropertyProductVO.proprPromotePrice!}</span>
								</td>
								<td>
									<button class="btn_reduce" onclick="javascript:onclick_reduce(this,${cartPropertyProductVO.shId!},${cartPropertyProductVO.proprId!});">-</button>
									<input class="momey_input" id="momey_input_${cartPropertyProductVO.shId!}" value="${cartPropertyProductVO.shNum!0}" disabled="disabled" />
									<button class="btn_add" onclick="javascript:onclick_btnAdd(this,${cartPropertyProductVO.shId!},${cartPropertyProductVO.proprId!});">+</button>
								</td>
								<td>
									<button class="btn_r" onclick="javascript:onclick_remove(this,${cartPropertyProductVO.shId!});">移除</button>
								</td>
							</tr>
						</#list>
					</#if>
				</table>
				<div class="" style="width: 100%; text-align: right; margin-top: 10px;">
					<div class="div_outMumey" style="float: left;background-color:#ff3366;">
						总价：<span id="out_momey">0.00</span>
					</div>
					<button class="btn_closing" onclick="shopping_cart_button()">立即付款</button>
				</div>
			</div>
		</div>	
	</body>
<script type="text/javascript">
//全选的点击事件
$("#quanxuan").click(function(){//给全选按钮加上点击事件
    if($(this).prop("checked") == true){
    	 $("input[name='choose']").prop("checked",false);
    	 $("#out_momey").html("0.00");
    	 $("input[name='choose']").click();
    }else{
    	$("input[name='choose']").prop("checked",false);
   		$("#out_momey").html("0.00");
    }  
});
function onclick_remove(r,shId) {
	if (confirm("确认移除该商品吗？")) {
		$.ajax({
	        type: "POST",
	        url: "/user/user_shopping_cart_delete",
	        data: {shId:shId},
	        dataType: "text",
	        success: function(data){
	        		if(data=="success"){
	        			if($(r).parent().siblings().first().children("input").prop('checked')==true){
	        				$(r).parent().siblings().first().children("input").click();
	        				$(r).parent().parent().remove();
	        			}else{
	        				$(r).parent().parent().remove();
	        			}
	        			var cart_number = $("#shopping_cart_number").text();
        				$("#shopping_cart_number").html(parseInt(cart_number)-1);
	        		}else{
	        			alert("移除失败！");
	        		}
		        },
		        error:function() { alert("服务器错误！");}
			});
	}
}
//增加数量
function onclick_btnAdd(a,shId,proprId) {
	var momey_input = parseInt($("#momey_input_"+shId).val())+1;
	$.ajax({
        type: "POST",
        url: "/user/user_shopping_cart_sh_num",
        data: {shId:shId,shNum:momey_input,proprId:proprId},
        dataType: "text",
        success: function(data){
        		if(data=="success"){
        			$("#momey_input_"+shId).val(momey_input);
        			if($(a).parent().siblings().first().children("input").prop('checked')==true){
        				var span_momey = $("#span_momey_"+shId).text();
            			var out_momey = $("#out_momey").text();
            			var number =parseFloat(out_momey) + parseFloat(span_momey);
            			$("#out_momey").html(number.toFixed(2));	
        			}
        		}else{
        			alert("库存不足！");
        		}
	        },
	        error:function() { alert("服务器错误！");}
		});
}

//减少数量
function onclick_reduce(b,shId,proprId) {
	var momey_input = parseInt($("#momey_input_"+shId).val())-1;
	if (momey_input <= 0) {
		alert("商品个数不能小于1")
	} else {
		$.ajax({
	        type: "POST",
	        url: "/user/user_shopping_cart_sh_num",
	        data: {shId:shId,shNum:momey_input,proprId:proprId},
	        dataType: "text",
	        success: function(data){
	        		if(data=="success"){
	        			$("#momey_input_"+shId).val(momey_input);
	        			if($(b).parent().siblings().first().children("input").prop('checked') == true){
	        				var span_momey = $("#span_momey_"+shId).text();
	            			var out_momey = $("#out_momey").text();
	            			var number =parseFloat(out_momey) - parseFloat(span_momey);
	            			$("#out_momey").html(number.toFixed(2));
	        			};		
	        		}else{
	        			alert("库存不足！");
	        		}
		        },
		        error:function() { alert("服务器错误！");}
			});
	}
}

//计算总价
function checkbox_olk(c,shId){
	if($(c).prop('checked') == true){
		var span_momey = $("#span_momey_"+shId).text();
		var momey_input = $("#momey_input_"+shId).val();
		var out_momey = $("#out_momey").text();
		var number =parseFloat(out_momey) + (parseFloat(span_momey) * parseInt(momey_input));
		$("#out_momey").html(number.toFixed(2));
	}else{
		var span_momey = $("#span_momey_"+shId).text();
		var momey_input = $("#momey_input_"+shId).val();
		var out_momey = $("#out_momey").text();
		var number =parseFloat(out_momey) - (parseFloat(span_momey) * parseInt(momey_input));
		$("#out_momey").html(number.toFixed(2));
	}
}

//提交订单

function shopping_cart_button(){
	 var propertyList = [];
	 var out_momey = $("#out_momey").text();
	 if(out_momey == "0.00"){
		 alert("请选择商品结算！");
	 }else{
		 $("input[name='choose']:checked").each(function(i){//把所有被选中的复选框的值存入数组
	         propertyList[i] = $(this).val();     
	     });
		 window.location.href="/user/user_settlement?propertyList="+propertyList.toString();
	 } 
}
</script>
</html>