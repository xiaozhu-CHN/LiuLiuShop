<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    
    <title>商品详情</title>
</head>
<body class="product-page">
	<!-- Script-->
	<script type="text/javascript" src="/assets/lib/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="/assets/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/assets/lib/select2/js/select2.min.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="/assets/lib/owl.carousel/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery.elevatezoom.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/assets/lib/fancyBox/jquery.fancybox.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.actual.min.js"></script>
	<script type="text/javascript" src="/assets/js/theme-script.js"></script>
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

<div class="columns-container">
    <div class="container" id="columns">
        <!-- breadcrumb -->
        <div class="breadcrumb clearfix">
            <a class="home" href="/" title="liuliu shop">首页</a>
            <span class="navigation-pipe">&nbsp;</span>
            <a href="#" title="${productCategoryVO.procaName}">${productCategoryVO.procaName}</a>
            <span class="navigation-pipe">&nbsp;</span>
            <span class="navigation_page">2019夏季新款睡衣</span>
        </div>
        <!-- ./breadcrumb -->
        <!-- row -->
        <div class="row">
            <!-- Left colunm -->
            <div class="column col-xs-12 col-sm-3" id="left_column">
                <!-- block category -->
                <div class="block left-module">
                    <p class="title_block">类别</p>
                    <div class="block_content">
                        <!-- layered -->
                        <div class="layered layered-category">
                            <div class="layered-content">
                                <ul class="tree-menu">
                                    <li class="active">
                                        <span></span><a href="#">上衣</a>
                                        <ul>
                                            <li><span></span><a href="#">衬衫</a></li>
                                            <li><span></span><a href="#">外套</a></li>
                                            <li><span></span><a href="#">休闲</a></li>
                                            <li><span></span><a href="#">睡衣</a></li>
                                            <li><span></span><a href="#">夏季</a></li>
                                            <li><span></span><a href="#"><span></span>裙子</a></li>
                                        </ul>
                                    </li>
                                    <li><span></span><a href="#">套装</a></li>
                                    <li><span></span><a href="#">礼服</a></li>
                                    <li><span></span><a href="#">夹克 </a></li>
                                    <li><span></span><a href="#">鞋子</a></li>
                                    <li><span></span><a href="#">包包</a></li>
                                    <li><span></span><a href="#">帽子</a></li>
                                    <li><span></span><a href="#">热销</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- ./layered -->
                    </div>
                </div>
                <!-- ./block category  -->
                <!-- block best sellers -->
                <div class="block left-module">
                    <p class="title_block">热销</p>
                    <div class="block_content">
                        <div class="owl-carousel owl-best-sell" data-loop="true" data-nav = "false" data-margin = "0" data-autoplayTimeout="1000" data-autoplay="true" data-autoplayHoverPause = "true" data-items="1">
                            <ul class="products-block best-sell">
                                <li>
                                    <div class="products-block-left">
                                        <a href="#">
                                            <img src="/assets/data/product-100x122.jpg" alt="SPECIAL PRODUCTS">
                                        </a>
                                    </div>
                                    <div class="products-block-right">
                                        <p class="product-name">
                                            <a href="#">2019夏季新款</a>
                                        </p>
                                        <p class="product-price">¥38,95</p>
                                        <p class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="products-block-left">
                                        <a href="#">
                                            <img src="/assets/data/p11.jpg" alt="SPECIAL PRODUCTS">
                                        </a>
                                    </div>
                                    <div class="products-block-right">
                                        <p class="product-name">
                                            <a href="#">2019夏季新款</a>
                                        </p>
                                        <p class="product-price">¥38,95</p>
                                        <p class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="products-block-left">
                                        <a href="#">
                                            <img src="/assets/data/p12.jpg" alt="SPECIAL PRODUCTS">
                                        </a>
                                    </div>
                                    <div class="products-block-right">
                                        <p class="product-name">
                                            <a href="#">2019夏季新款</a>
                                        </p>
                                        <p class="product-price">¥38,95</p>
                                        <p class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                            <ul class="products-block best-sell">
                                <li>
                                    <div class="products-block-left">
                                        <a href="#">
                                            <img src="/assets/data/p13.jpg" alt="SPECIAL PRODUCTS">
                                        </a>
                                    </div>
                                    <div class="products-block-right">
                                        <p class="product-name">
                                            <a href="#">2019夏季新款</a>
                                        </p>
                                        <p class="product-price">¥38,95</p>
                                        <p class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="products-block-left">
                                        <a href="#">
                                            <img src="/assets/data/p14.jpg" alt="SPECIAL PRODUCTS">
                                        </a>
                                    </div>
                                    <div class="products-block-right">
                                        <p class="product-name">
                                            <a href="#">2019夏季新款</a>
                                        </p>
                                        <p class="product-price">¥38,95</p>
                                        <p class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="products-block-left">
                                        <a href="#">
                                            <img src="/assets/data/p15.jpg" alt="SPECIAL PRODUCTS">
                                        </a>
                                    </div>
                                    <div class="products-block-right">
                                        <p class="product-name">
                                            <a href="#">2019夏季新款</a>
                                        </p>
                                        <p class="product-price">¥38,95</p>
                                        <p class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- ./block best sellers  -->
                
                <!-- left silide -->
                <div class="col-left-slide left-module">
                    <ul class="owl-carousel owl-style2" data-loop="true" data-nav = "false" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-items="1" data-autoplay="true">
                        <li><a href="#"><img src="/assets/data/slide-left.jpg" alt="slide-left"></a></li>
                        <li><a href="#"><img src="/assets/data/slide-left2.jpg" alt="slide-left"></a></li>
                        <li><a href="#"><img src="/assets/data/slide-left3.png" alt="slide-left"></a></li>
                    </ul>
                </div>
                <!--./left silde-->
            </div>
            <!-- ./left colunm -->
            <!-- Center colunm-->
            <div class="center_column col-xs-12 col-sm-9" id="center_column">
                <!-- Product -->
                    <div id="product">
                        <div class="primary-box row">
                            <div class="pb-left-column col-xs-12 col-sm-6">
                                <!-- product-imge-->
                                <div class="product-image">
                                    <div class="product-full">
                                   		<#if productImageList?? && productImageList?size != 0>
											<#list productImageList! as productImage>
												<#if productImage_index == 0>
                                        			<img id="product-zoom" src='/imgs/proimg/${productImage.proimgLinkThree!}' data-zoom-image="/imgs/proimg/${productImage.proimgLinkThree!}"/>
                                    			</#if>
                                    		</#list>
                                    	</#if>
                                    </div>
                                    <div class="product-img-thumb" id="gallery_01">
                                        <ul class="owl-carousel" data-items="3" data-nav="true" data-dots="false" data-margin="20" data-loop="false">
                                            <#if productImageList?? && productImageList?size != 0>
													<#list productImageList! as productImage>
			                                            <li>
			                                                <a href="#" data-image="/imgs/proimg/${productImage.proimgLinkTwo!}" data-zoom-image="/imgs/proimg/${productImage.proimgLinkThree!}">
			                                                    <img id="product-zoom"  src="/imgs/proimg/${productImage.proimgLinkOne!}" /> 
			                                                </a>
			                                            </li>
			                                        </#list>
			                                 </#if>
                                        </ul>
                                    </div>
                                </div>
                                <!-- product-imge-->
                            </div>
                            <div class="pb-right-column col-xs-12 col-sm-6">
                                <h1 class="product-name">${(productCategoryVO.proName)!}</h1>
                                <div class="product-comments">
                                    <div class="product-star" id="pro_score">
                                        <i ></i>
                                        <i ></i>
                                        <i ></i>
                                        <i ></i>
                                        <i ></i>
                                    </div>
                                    <div class="comments-advices">
                                        <a href="#">${(productCategoryVO.productStoreCall)!}</a>
                                       
                                    </div>
                                </div>
                                <div class="product-price-group">
                                    <span class="price" id="propr_promote_price"></span>
                                    <span class="old-price" id="propr_original_price"></span>
                                    <span class="discount" id="propr_promote_original"></span>
                                </div>
                                <div class="info-orther">
                                    <p>商品编号: #${(productCategoryVO.proId)!}</p>
                                    
                                </div>
                                <div class="product-desc">
                                    ${(productCategoryVO.proSubtitle)!}
                                </div>
                                <div class="form-option">
                                    <p class="form-option-title">选项：</p>
                                    <div class="attributes">
                                        
                                    <div class="attributes">
                                        <div class="attribute-label">数量：</div>
                                        <div class="attribute-list product-qty">
                                            <div class="qty">
                                                <input id="option-product-qty" type="text" value="1">
                                            </div>
                                            <div class="btn-plus">
                                                <a class="btn-plus-up">
                                                    <i class="fa fa-caret-up"></i>
                                                </a>
                                                <a class="btn-plus-down">
                                                    <i class="fa fa-caret-down"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="attributes">
                                        <div class="attribute-label">属性：</div>
                                        <div class="attribute-list" id="buttonlist">
                                        	<#if proPropertyList?? && proPropertyList?size != 0>
													<#list proPropertyList! as proProperty>
			                                           <button style="border:2px solid DarkGray" onclick="pro_property(${proProperty.proprId!},${proProperty.proprNumber!},${proProperty.proprOriginalPrice!},${proProperty.proprPromotePrice!})" id="propr${proProperty.proprId!}">&nbsp;${proProperty.proprName!}&nbsp;</button>&nbsp;
                                          			 </#list>
	                                       	</#if>
                                        </div>
                                        
                                    </div>
                                    <div class="attributes">
                                        <div class="attribute-label">库存：</div>
                                        <div class="attribute-list" id="propr_number">
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="form-action">
                                    <div class="button-group">
                                        <button class="btn-add-cart" onclick="shopping_cart_add()">添加到购物车</button>
                                        <a class="btn-add-cart" href="#">立即购买</a>
                                    </div>
                                    <div class="button-group">
                                        <a class="wishlist" href="JavaScript:wishlist_add(${(productCategoryVO.proId)!});"><i class="fa fa-heart-o"></i>
                                        <br>收藏</a>
                                        
                                    </div>
                                </div>
                                <div class="form-share">
                                    <div class="sendtofriend-print">
                                        
                                        <a href="#"><i class="fa fa-envelope-o fa-fw"></i>分享</a>
                                    </div>
                                    <div class="network-share">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- tab product -->
                        <div class="product-tab">
                            <ul class="nav-tab">
                                <li class="active">
                                    <a aria-expanded="false" data-toggle="tab" href="#product-detail">产品详情</a>
                                </li>
                                <#if productCategoryVO.procaId ?? &&  productCategoryVO.procaId == 1>
                                <li>
                                    <a aria-expanded="true" data-toggle="tab" href="#information">关于尺码</a>
                                </li>
                                </#if>
                               
                                <li>
                                    <a data-toggle="tab" href="#reviews">买家评论</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#extra-tabs">七天退货</a>
                                </li>
                                
                            </ul>
                            <div class="tab-container">
                                <div id="product-detail" class="tab-panel active">
                                    ${(productCategoryVO.proIntroduce)!}
                                </div>
                                <div id="information" class="tab-panel">
                                    <table class="table table-bordered">
                                        <tr>
                                        	<a id="size_chart" class="fancybox" href="/assets/data/size-chart.png">尺码参考</a>
                                            <p>1. 选购时，请综合参考尺码表中各项参数，有助于你选择到更合适的尺码。</p>
											<p>2.（只适用服装）平铺测量自己的合身服装尺寸作参考，对比选购更准确！</p>
											<p>3. 请放心挑选尺码，溜溜商城7天退货无忧替你保驾护航。</p>
                                        </tr>
                                    </table>
                                </div>
                                <script type="text/javascript">
                                var html;
                                </script>
                                <div id="reviews" class="tab-panel">
                                    <div class="product-comments-block-tab">
                                    <#if reviewVOList?? && reviewVOList?size != 0>
										<#list reviewVOList! as reviewVO>
                                        <div class="comment row">
                                            <div class="col-sm-3 author">
                                                <div class="grade">
                                                    <span>商品评分</span>
                                                    <span class="reviewRating" id="reCommodity${(reviewVO.reId)!}">
	                                                    <script type="text/javascript">
	                                                    	html =""; 
	                                                    	for(var i=0;i<${(reviewVO.reCommodity)!};i++){
	                                                    		html += '<i class="fa fa-star"></i>';
	                                                    	}
	                                                    	for(var i=0;i<5-${(reviewVO.reCommodity)!};i++){
	                                                    		html += '<i class="fa fa-star-o"></i>';
	                                                    	}
	                                                    	$("#reCommodity${(reviewVO.reId)!}").html(html);
	                                                    </script>
                                                    </span>
                                                </div>
                                                <div class="grade">
                                                    <span>物流评分</span>
                                                    <span class="reviewRating" id="reLogistics${(reviewVO.reId)!}">
	                                                    <script type="text/javascript">
	                                                    	html =""; 
	                                                    	for(var i=0;i<${(reviewVO.reLogistics)!};i++){
	                                                    		html += '<i class="fa fa-star"></i>';
	                                                    	}
	                                                    	for(var i=0;i<5-${(reviewVO.reLogistics)!};i++){
	                                                    		html += '<i class="fa fa-star-o"></i>';
	                                                    	}
	                                                    	$("#reLogistics${(reviewVO.reId)!}").html(html);
	                                                    </script>
                                                    </span>
                                                </div>
                                                <div class="grade">
                                                    <span>服务评分</span>
                                                    <span class="reviewRating" id="reShop${(reviewVO.reId)!}">
                                                        <script type="text/javascript">
                                                    	html =""; 
                                                    	for(var i=0;i<${(reviewVO.reShop)!};i++){
                                                    		html += '<i class="fa fa-star"></i>';
                                                    	}
                                                    	for(var i=0;i<5-${(reviewVO.reShop)!};i++){
                                                    		html += '<i class="fa fa-star-o"></i>';
                                                    	}
                                                    	$("#reShop${(reviewVO.reId)!}").html(html);
                                                    </script>
                                                    </span>
                                                </div>
                                                <div class="info-author">
                                                    <span><strong>${(reviewVO.userCall)!}</strong></span>
                                                    <em>${(reviewVO.reDate?string("yyyy/MM/dd"))!}</em>
                                                </div>
                                            </div>
                                            <div class="col-sm-9 commnet-dettail">
                                               	 ${(reviewVO.reContent)!}
                                            </div>
                                        </div>
                                        </#list>
                                      </#if>
                                    </div>
                                    
                                </div>
                                <div id="extra-tabs" class="tab-panel">
                                    本商品支持7天退货，请放心购买。
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
                <p class="text-center">Copyrights &#169; 2019 LiuLiuShop. All Rights Reserved. Designed by liuliu.com</p>
            </div>
        </div> 
</footer>
<a href="#" class="scroll_top" title="回到顶部" style="display: inline;">回到顶部</a>
</body>
<script type="text/javascript">
$(function(){
	var propr_id;
	//默认选择第一个属性
	$("#buttonlist button:first").click();
	//属性的数量加减
	$(".btn-plus-up").click(function(){
		var number = $("#option-product-qty").val();
		$("#option-product-qty").val(number);
	});
	$(".btn-plus-down").click(function(){
		var number = $("#option-product-qty").val();
		if(number==1){
			alert("最低数量为1！");
		}else{
			$("#option-product-qty").val(number);
		}
	});
	//商品评价的星星
	var pro_score_number = ${productCategoryVO.proScore!};
	var pro_score_number2 = parseInt(pro_score_number)-1;
	if(pro_score!=null&&pro_score!=0){
		$("#pro_score i:lt("+pro_score_number+")").addClass("fa fa-star");
		$("#pro_score i:gt("+pro_score_number2+")").addClass("fa fa-star-o");
	}else{
		$("#pro_score i").addClass("fa fa-star-o");
	}
	
});
//关联商品属性的价格促销价等等
function pro_property(proprId,proprNumber,proprOriginalPrice,proprPromotePrice){
	propr_id = proprId;
	$("#propr"+proprId).css("border","2px solid DeepPink"); 
	$("#propr"+proprId).siblings().css("border","2px solid DarkGray");
	$("#propr_promote_price").html("¥"+proprPromotePrice);
	$("#propr_original_price").html("¥"+proprOriginalPrice);
	$("#propr_promote_original").html("-"+Number(toPercent(proprPromotePrice,proprOriginalPrice)).toFixed(2)+"%");
	$("#propr_number").html(proprNumber);
}
function toPercent(num, total) { 
	// 计算促销的百分比
    return (100-(Math.round(num / total * 10000) / 100.00) );
   
}
//添加购物车
function shopping_cart_add(){
	var number = $("#option-product-qty").val();
	$.ajax({
        type: "POST",
        url: "/user/user_shopping_cart_add",
        data: {proprId:propr_id,shNum:number},
        dataType: "text",
        success: function(data){
        		if(data=="success1"||data=="success2"){
        			if(data=="success1"){
        				var cart_number = $("#shopping_cart_number").text();
        				$("#shopping_cart_number").html(parseInt(cart_number)+1);
        			}
        			alert("加入购物车成功！");
        		}else{
        			alert("库存不足！");
        		}
	        },
	        error:function() { alert("服务器错误！");}
		});
}

function wishlist_add(pro_id){
	var user = "${(user.userId)!}";
	if(user==""){
		window.location.href="/publicpage/user_login"; 
	}else{
		$.ajax({
	        type: "POST",
	        url: "/user/user_wishlist_add",
	        data: {proId:pro_id},
	        dataType: "text",
	        success: function(data){
	        		if(data=="success"){
	        			alert("添加愿望单成功！");
	        		}else{
	        			alert("您已经添加过愿望单喔！");
	        		}
		        },
		        error:function() { alert("服务器错误！");}
			});
	}
	
}
</script>
</html>