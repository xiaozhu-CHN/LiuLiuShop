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
    <link rel="stylesheet" type="text/css" href="/assets/lib/fancyBox/jquery.fancybox.css" />
    <link rel="stylesheet" type="text/css" href="/assets/lib/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/responsive.css" />
    <title>溜溜购物商城</title>
</head>
<body class="home">
	<!-- Script-->
	<script type="text/javascript" src="/assets/lib/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="/assets/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/assets/lib/select2/js/select2.min.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery.bxslider/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="/assets/lib/owl.carousel/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery.countdown/jquery.countdown.min.js"></script>
	<script type="text/javascript" src="/assets/js/jquery.actual.min.js"></script>
	<script type="text/javascript" src="/assets/lib/fancyBox/jquery.fancybox.js"></script>
	<script type="text/javascript" src="/assets/lib/jquery.elevatezoom.js"></script>
	<script type="text/javascript" src="/assets/js/theme-script.js"></script>
<!-- HEADER -->
<div id="header" class="header">
    <div class="top-header">
        <div class="container">
            <div class="nav-top-links">
                <a class="first-item" href="#"><img alt="phone" src="/assets/images/phone.png" />0779-11-22-33</a>
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
                                        <a href="category.html" class="dropdown-toggle" data-toggle="dropdown">更多</a>
                                            <ul class="mega_dropdown dropdown-menu" style="width: 830px;">
                                            <li class="block-container col-sm-4">
                                                <ul class="block">
                                                    <li class="link_container group_header">
                                                        <a href="#">更多</a>
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
<!-- Home slideder-->
<div id="home-slider">
    <div class="container">
        <div class="row">
            <div class="col-sm-3 slider-left"></div>
            <div class="col-sm-9 header-top-right">
                <div class="homeslider">
                    <div class="content-slide">
                        <ul id="contenhomeslider">
                          <li><img alt="Funky roots" src="/assets/data/shouye6.png" title="Funky roots" /></li>
                          <li><img alt="Funky roots" src="/assets/data/shouye3.png" title="Funky roots" /></li>
                          <li><img  alt="Funky roots" src="/assets/data/shouye4.png" title="Funky roots" /></li>
                        </ul>
                    </div>
                </div>
                <div class="header-banner banner-opacity">
                    <a href="#"><img alt="Funky roots" src="/assets/data/ads1.jpg" /></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END Home slideder-->
<!-- servives -->
<div class="container">
    <div class="service ">
        <div class="col-xs-6 col-sm-3 service-item">
            <div class="icon">
                <img alt="services" src="/assets/data/s1.png" />
            </div>
            <div class="info">
                <a href="#"><h3>免费配送</h3></a>
                <span>订单满 ¥200</span>
            </div>
        </div>
        <div class="col-xs-6 col-sm-3 service-item">
            <div class="icon">
                <img alt="services" src="/assets/data/s2.png" />
            </div>
            <div class="info">
                <a href="#"><h3>30天保价</h3></a>
                <span>返还差价</span>
            </div>
        </div>
        <div class="col-xs-6 col-sm-3 service-item">
            <div class="icon">
                <img alt="services" src="/assets/data/s3.png" />
            </div>
            
            <div class="info" >
                <a href="#"><h3>24小时服务</h3></a>
                <span>在线咨询</span>
            </div>
        </div>
        <div class="col-xs-6 col-sm-3 service-item">
            <div class="icon">
                <img alt="services" src="/assets/data/s4.png" />
            </div>
            <div class="info">
                <a href="#"><h3>安全购物</h3></a>
                <span>购物保证</span>
            </div>
        </div>
    </div>
</div>
<!-- end services -->

<div class="page-top">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-9 page-top-left">
						<div class="popular-tabs">
							<ul class="nav-tab">
								<li class="active"><a data-toggle="tab" href="#tab-1">畅销</a></li>
								<li><a data-toggle="tab" href="#tab-2">出售</a></li>
								<li><a data-toggle="tab" href="#tab-3">新产品</a></li>
							</ul>
							<div class="tab-container">
								<div id="tab-1" class="tab-panel active">
									<ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true" data-margin="30"
									 data-autoplayTimeout="1000" data-autoplayHoverPause="true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
										<li>
											<div class="left-block">
												<a href="/publicpage/product?proId=3"">
													<img class="img-responsive" alt="product" src="/assets/data/index/a2_DAZZLE.png" />
												</a>
												<div class="quick-view">
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
												<div class="group-price">
													<span class="product-new">新品</span>
													<span class="product-sale">特价</span>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="/publicpage/product?proId=3">地素新款时尚金线绣花毛边无袖外套</a></h5>
												<div class="content_price">
													<span class="price product-price">¥844</span>
													<span class="price old-price">¥1499</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="/publicpage/product?proId=4"><img class="img-responsive" alt="product" src="/assets/data/index/a2_bianfu.png" /></a>
												<div class="quick-view">
													
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="/publicpage/product?proId=4">V领刺绣蝙蝠袖短袖高腰娃娃连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥808</span>
													<span class="price old-price">¥1599</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="/publicpage/product?proId=5"><img class="img-responsive" alt="product" src="/assets/data/index/a2_tiaowenxiuhua.png" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="group-price">
												<span class="product-new">新品</span>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="/publicpage/product?proId=5">地素 条纹绣花拼贴收腰连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="/publicpage/product?proId=6"><img class="img-responsive" alt="product" src="/assets/data/index/a2_diyifengfugu.png" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="/publicpage/product?proId=6">地素 睡衣风复古休闲牛仔衬衣</a></h5>
												<div class="content_price">
													<span class="price product-price">¥318</span>
													<span class="price old-price">¥635</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
									</ul>
								</div>
								
								<!-- 第二页 -->
								<div id="tab-2" class="tab-panel">
									<ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true" data-margin="30"
									 data-autoplayTimeout="1000" data-autoplayHoverPause="true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
										<li>
											<div class="left-block">
												<a href="detail.html">
													<img class="img-responsive" alt="product" src="/assets/data/p48.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">2019 新款夏季连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="detail.html">
													<img class="img-responsive" alt="product" src="/assets/data/p49.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">2019 新款夏季连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p50.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p51.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">新款连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<!-- 第三页 -->
								<div id="tab-3" class="tab-panel">
									<ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true" data-margin="30"
									 data-autoplayTimeout="1000" data-autoplayHoverPause="true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":3}}'>
										<li>
											<div class="left-block">
												<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p60.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">2019款连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p61.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">新款连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p62.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">2019款连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
										<li>
											<div class="left-block">
												<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p63.jpg" /></a>
												<div class="quick-view">
													<a title="愿望单" class="heart" href="#"></a>
													<a title="比较" class="compare" href="#"></a>
													<a title="快速查看" class="search" href="#"></a>
												</div>
												<div class="add-to-cart">
													<a title="Add to Cart" href="#">添加到购物车</a>
												</div>
											</div>
											<div class="right-block">
												<h5 class="product-name"><a href="detail.html">新款连衣裙</a></h5>
												<div class="content_price">
													<span class="price product-price">¥38,95</span>
													<span class="price old-price">¥52,00</span>
												</div>
												<div class="product-star">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half-o"></i>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-3 page-top-right">
						<div class="latest-deals">
							<h2 class="latest-deal-title">限时抢购</h2>
							<div class="latest-deal-content">
								<ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav="true" data-autoplayTimeout="1000"
								 data-autoplayHoverPause="true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":1}}'>
									<li>
										<div class="count-down-time" data-countdown="2055/06/27"></div>
										<div class="left-block">
											<a href="/publicpage/product?proId=14"><img class="img-responsive" alt="product" src="/assets/data/index/a2_xiaomi9.png" /></a>
											<div class="quick-view">
												<a title="愿望单" class="heart" href="#"></a>
											</div>
											<div class="add-to-cart">
												<a title="添加到购物车" href="#">添加到购物车</a>
											</div>
										</div>
										<div class="right-block">
											<h5 class="product-name"><a href="/publicpage/product?proId=14">小米9 旗舰拍照手机</a></h5>
											<div class="content_price">
												<span class="price product-price">¥3199</span>
												<span class="price old-price">¥3299</span>
												<span class="colreduce-percentage">(-10%)</span>
											</div>
										</div>
									</li>
									<li>
										<div class="count-down-time" data-countdown="2017/06/27 9:20:00"></div>
										<div class="left-block">
											<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/ld2.jpg" /></a>
											<div class="quick-view">
												<a title="愿望单" class="heart" href="#"></a>
												<a title="比较" class="compare" href="#"></a>
												<a title="快速一览" class="search" href="#"></a>
											</div>
											<div class="add-to-cart">
												<a title="Add to Cart" href="#">添加到购物车</a>
											</div>
										</div>
										<div class="right-block">
											<h5 class="product-name"><a href="detail.html">2019新款</a></h5>
											<div class="content_price">
												<span class="price product-price">¥38,95</span>
												<span class="price old-price">¥52,00</span>
												<span class="colreduce-percentage">(-90%)</span>
											</div>
										</div>
									</li>
									<li>
										<div class="count-down-time" data-countdown="2017/06/27 9:20:00"></div>
										<div class="left-block">
											<a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/ld3.jpg" /></a>
											<div class="quick-view">
												<a title="愿望单" class="heart" href="#"></a>
												<a title="比较" class="compare" href="#"></a>
												<a title="快速一览" class="search" href="#"></a>
											</div>
											<div class="add-to-cart">
												<a title="Add to Cart" href="#">添加到购物车</a>
											</div>
										</div>
										<div class="right-block">
											<h5 class="product-name"><a href="detail.html">2019新款</a></h5>
											<div class="content_price">
												<span class="price product-price">¥38,95</span>
												<span class="price old-price">¥52,00</span>
												<span class="colreduce-percentage">(-20%)</span>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!---->
<div class="content-page">
    <div class="container">
        <!-- featured category fashion -->
        <div class="category-featured">
            <nav class="navbar nav-menu nav-menu-red show-brand">
              <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-brand"><a href="#"><img alt="fashion" src="/assets/data/fashion.png" />衣服</a></div>
                  <span class="toggle-menu"></span>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">           
                  <ul class="nav navbar-nav">
                    <li class="active"><a data-toggle="tab" href="#tab-4">畅销</a></li>
                    <li><a data-toggle="tab" href="#tab-5">最多关注</a></li>
                    <li><a href="#">男士</a></li>
                    <li><a href="#">女士</a></li>
                    <li><a href="#">儿童</a></li>
                    <li><a href="#">分类</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
              <div id="elevator-1" class="floor-elevator">
                    <a href="#" class="btn-elevator up disabled fa fa-angle-up"></a>
                    <a href="#elevator-2" class="btn-elevator down fa fa-angle-down"></a>
              </div>
            </nav>
            <div class="category-banner">
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads2.jpg" /></a>
                </div>
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads3.jpg" /></a>
                </div>
           </div>
           <div class="product-featured clearfix">
                <div class="banner-featured">
                    <div class="featured-text"><span>特色</span></div>
                    <div class="banner-img">
                        <a href="#"><img alt="Featurered 1" src="/assets/data/f1.jpg" /></a>
                    </div>
                </div>
                <div class="product-featured-content">
                    <div class="product-featured-list">
                        <div class="tab-container">
                            <!-- tab product -->
                            <div class="tab-panel active" id="tab-4">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/01_blue-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">蓝色衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/02_yellow-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">黄色衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/03_cyan-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">青色衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/04_nice-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">漂亮衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/05_flowers-dress.jpg" /></a>
                                            <div class="quick-view">
                                                   <a title="愿望单" class="heart" href="#"></a>
                                                   <a title="比较" class="compare" href="#"></a>
                                                   <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">花衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/06_red-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">红色衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- tab product -->
                            <div class="tab-panel" id="tab-5">
                                <ul class="product-list owl-carousel" data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/04_nice-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">红色的衣服</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/05_flowers-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Flowers Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/06_red-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Red Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="#">
                                            <img class="img-responsive" alt="product" src="/assets/data/01_blue-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="detail.html">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Blue Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/02_yellow-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Yellow Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/03_cyan-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Cyan Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/04_nice-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Nice Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/05_flowers-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Flowers Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html">
                                            <img class="img-responsive" alt="product" src="/assets/data/06_red-dress.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">Add to Cart</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">Red Dress</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                </div>
           </div>
        </div>
        <!-- end featured category fashion -->
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- 2019.5.16日14:46 -->
				
        
        
        <!-- featured category electronic -->
        <div class="category-featured">
            <nav class="navbar nav-menu nav-menu-orange show-brand">
              <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-brand"><a href="#"><img alt="fashion" src="/assets/data/electronic.png" />电器</a></div>
                  <span class="toggle-menu"></span>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">           
                  <ul class="nav navbar-nav">
                    <li class="active"><a data-toggle="tab" href="#tab-8">畅销</a></li>
                    <li><a data-toggle="tab" href="#tab-9">最多关注</a></li>
                    <li><a href="#">电视</a></li>
                    <li><a href="#">空调</a></li>
                    <li><a href="#">洗衣机</a></li>
                    <li><a href="#">扫地机</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
              <div id="elevator-3" class="floor-elevator">
                    <a href="#elevator-2" class="btn-elevator up fa fa-angle-up"></a>
                    <a href="#elevator-4" class="btn-elevator down fa fa-angle-down"></a>
              </div>
            </nav>
            <div class="category-banner">
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads8.jpg" /></a>
                </div>
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads9.jpg" /></a>
                </div>
           </div>
           <div class="product-featured clearfix">
                <div class="banner-featured">
                    <div class="featured-text"><span>特色</span></div>
                    <div class="banner-img">
                        <a href="#"><img alt="Featurered 1" src="/assets/data/f3.jpg" /></a>
                    </div>
                </div>
                <div class="product-featured-content">
                    <div class="product-featured-list">
                        <div class="tab-container autoheight">
                            <!-- tab product -->
                            <div class="tab-panel active" id="tab-8">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav="true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p18.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p19.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p20.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p18.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p21.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- tab product -->
                            <div class="tab-panel" id="tab-9">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p21.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="#"><img class="img-responsive" alt="product" src="/assets/data/p21.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p20.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p19.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p18.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                </div>
           </div>
        </div>
        <!-- end featured category electronic-->
        <!-- featured category Digital -->
        <div class="category-featured">
            <nav class="navbar nav-menu nav-menu-blue show-brand">
              <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-brand"><a href="#"><img alt="fashion" src="/assets/data/digital.png" />数码</a></div>
                  <span class="toggle-menu"></span>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">           
                  <ul class="nav navbar-nav">
                    <li class="active"><a data-toggle="tab" href="#tab-10">畅销</a></li>
                    <li><a data-toggle="tab" href="#tab-11">最多关注</a></li>
                    <li><a href="#">手机</a></li>
                    <li><a href="#">相机</a></li>
                    <li><a href="#">平板</a></li>
                    <li><a href="#">笔记本电脑</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
              <div id="elevator-4" class="floor-elevator">
                    <a href="#elevator-3" class="btn-elevator up fa fa-angle-up"></a>
                    <a href="#elevator-5" class="btn-elevator down fa fa-angle-down"></a>
              </div>
            </nav>
            <div class="category-banner">
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads10.jpg" /></a>
                </div>
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads11.jpg" /></a>
                </div>
           </div>
           <div class="product-featured clearfix">
                <div class="banner-featured">
                    <div class="featured-text"><span>特色</span></div>
                    <div class="banner-img">
                        <a href="#"><img alt="Featurered 1" src="/assets/data/f4.jpg" /></a>
                    </div>
                </div>
                <div class="product-featured-content">
                    <div class="product-featured-list">
                        <div class="tab-container autoheight">
                            <!-- tab product -->
                            <div class="tab-panel active" id="tab-10">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p22.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p23.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p24.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p25.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p23.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- tab product -->
                            <div class="tab-panel" id="tab-11">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p25.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p24.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p23.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p23.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p22.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p23.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                </div>
           </div>
        </div>
        <!-- end featured category Digital-->
        
				
				
        <!-- featured category jewelry -->
        <div class="category-featured">
            <nav class="navbar nav-menu nav-menu-gray show-brand">
              <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-brand"><a href="#"><img alt="fashion" src="/assets/data/jewelry.png" />珠宝</a></div>
                  <span class="toggle-menu"></span>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">           
                  <ul class="nav navbar-nav">
                    <li class="active"><a data-toggle="tab" href="#tab-14">畅销</a></li>
                    <li><a data-toggle="tab" href="#tab-15">最多关注</a></li>
                    <li><a href="#">项链</a></li>
                    <li><a href="#">手环</a></li>
                    <li><a href="#">耳环</a></li>
                    <li><a href="#">戒指</a></li>
                  </ul>
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
              <div id="elevator-6" class="floor-elevator">
                    <a href="#elevator-5" class="btn-elevator up fa fa-angle-up"></a>
                    <a href="#" class="btn-elevator disabled down fa fa-angle-down"></a>
              </div>
            </nav>
            <div class="category-banner">
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads14.jpg" /></a>
                </div>
                <div class="col-sm-6 banner">
                    <a href="#"><img alt="ads2" class="img-responsive" src="/assets/data/ads15.jpg" /></a>
                </div>
           </div>
           <div class="product-featured clearfix">
                <div class="banner-featured">
                    <div class="featured-text"><span>特色</span></div>
                    <div class="banner-img">
                        <a href="#"><img alt="Featurered 1" src="/assets/data/f6.jpg" /></a>
                    </div>
                </div>
                <div class="product-featured-content">
                    <div class="product-featured-list">
                        <div class="tab-container autoheight">
                            <!-- tab product -->
                            <div class="tab-panel active" id="tab-14">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p30.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p31.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p32.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p33.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p31.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- tab product -->
                            <div class="tab-panel" id="tab-15">
                                <ul class="product-list owl-carousel"  data-dots="false" data-loop="true" data-nav = "true" data-margin = "0" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":1},"600":{"items":3},"1000":{"items":4}}'>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p33.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p31.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p31.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p32.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p31.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="left-block">
                                            <a href="detail.html"><img class="img-responsive" alt="product" src="/assets/data/p30.jpg" /></a>
                                            <div class="quick-view">
                                                    <a title="愿望单" class="heart" href="#"></a>
                                                    <a title="比较" class="compare" href="#"></a>
                                                    <a title="快速一览" class="search" href="#"></a>
                                            </div>
                                            <div class="add-to-cart">
                                                <a title="Add to Cart" href="#">添加到购物车</a>
                                            </div>
                                        </div>
                                        <div class="right-block">
                                            <h5 class="product-name"><a href="detail.html">2019新款</a></h5>
                                            <div class="content_price">
                                                <span class="price product-price">¥38,95</span>
                                                <span class="price old-price">¥52,00</span>
                                            </div>
                                            <div class="product-star">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                    </div>
                </div>
           </div>
        </div>
        <!-- end featured category jewelry-->
        
        <!-- Baner bottom -->
        <div class="row banner-bottom">
            <div class="col-sm-6">
                <div class="banner-boder-zoom">
                    <a href="#"><img alt="ads" class="img-responsive" src="/assets/data/ads17.jpg" /></a>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="banner-boder-zoom">
                    <a href="#"><img alt="ads" class="img-responsive" src="/assets/data/ads18.jpg" /></a>
                </div>
            </div>
        </div>
        <!-- end banner bottom -->
    </div>
</div>

<div class="container">
    <div class="brand-showcase">
        <h2 class="brand-showcase-title">
            热门手机
        </h2>
        <div class="brand-showcase-box">
            <ul class="brand-showcase-logo owl-carousel" data-loop="true" data-nav = "true" data-dots="false" data-margin = "1" data-autoplayTimeout="1000" data-autoplayHoverPause = "true" data-responsive='{"0":{"items":2},"600":{"items":5},"1000":{"items":8}}'>
                <li data-tab="showcase-1" class="item active"><img src="/assets/data/huawei.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-2" class="item"><img src="/assets/data/iphone.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-3" class="item"><img src="/assets/data/xiaomi.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-4" class="item"><img src="/assets/data/oppo.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-5" class="item"><img src="/assets/data/vivo.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-6" class="item"><img src="/assets/data/sanxing.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-7" class="item"><img src="/assets/data/meizu.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-8" class="item"><img src="/assets/data/yijia.png" alt="logo" class="item-img" /></li>
                <li data-tab="showcase-9" class="item"><img src="/assets/data/rongyao.png" alt="logo" class="item-img" /></li>
            </ul>
            <div class="brand-showcase-content">
                <div class="brand-showcase-content-tab active" id="showcase-1">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/huaweip30.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                HUAWEI P30 Pro 超感光徕卡四摄，潜望式10倍混合变焦，未来影像，由此开启。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p24.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p25.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p26.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p27.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-2">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/iphonexr.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                iphone XR，A12仿生处理器，6.1英寸，128G内存，全面屏，面容识别，双卡双待。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p10.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p11.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p12.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="#">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p13.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="brand-showcase-content-tab" id="showcase-3">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/mi9.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                小米9,战斗天使,好看又能打,4800万超广角微距AI三摄,20W无线闪充。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p14.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p15.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p16.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="#"><img class="img-responsive" src="/assets/data/p17.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-4">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/opporeno.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                OPPO Reno系列，10倍混合光变，远近都清晰；4800万超清像素，纤毫毕现；超清夜景2.0，动人夜色即刻去拍。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p18.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p19.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p20.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p21.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-5">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/vivox27.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                vivo x27，X系列零界全面屏开山之作,超高屏占比勇攀系列高峰，6.39英寸FHD+高清大视野，19.5:9屏幕比例，延伸星辰般宏伟壮阔。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p22.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p23.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p24.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p25.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-6">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/sanxings10.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                三星Galaxy S10e | S10 | S10+ 震撼上市，超感官全视屏，后置123°超广角摄像头，即刻购买体验超强悍性能。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p26.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p27.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p28.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p29.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-7">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/meizu16s.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                魅族 16S，追求不止，只因热爱。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p30.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p31.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p32.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p15.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-8">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="#"><img src="/assets/data/yijia7.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                OnePlus 7 PRO，90Hz流体屏，2K+超清显示，骁龙 855处理器，4800 万超广角三摄，全速旗舰，所见无限。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p25.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p21.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p10.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p23.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-showcase-content-tab" id="showcase-9">
                    <div class="row">
                        <div class="col-xs-12 col-sm-4 trademark-info">
                            <div class="trademark-logo">
                                <a href="detail.html"><img src="/assets/data/rongyaov20.png" alt="trademark"></a>
                            </div>
                            <div class="trademark-desc">
                                荣耀V20，科技标杆，见所未见。魅眼全视屏，沉浸全视界。
                            </div>
                            <a href="#" class="trademark-link">立即购买</a>
                        </div>
                        <div class="col-xs-12 col-sm-8 trademark-product">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-repon" src="/assets/data/p24.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p14.jpg" alt=""></a>
                                    </div>
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p30.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 product-item">
                                    <div class="image-product hover-zoom">
                                        <a href="detail.html"><img class="img-responsive" src="/assets/data/p29.jpg" alt=""></a>
                                    </div>
                                    <div class="info-product">
                                        <a href="detail.html">
                                            <h5>2019新款</h5>
                                        </a>
                                        <span class="product-price">¥38.87</span>
                                        <div class="product-star">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <a class="btn-view-more" title="View More" href="#">View More</a>
                                    </div>
                                </div>
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
</html>