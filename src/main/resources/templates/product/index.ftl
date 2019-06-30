<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="/hui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/hui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="/hui/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>溜溜商城商家平台 v1.0</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/product/index">溜溜商城商家平台</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/product/index">liuliu</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li><#if productStore.productStoreExamine == 1>待认证</#if><#if productStore.productStoreExamine == 2>已认证</#if><#if productStore.productStoreExamine == 3>认证未通过</#if></li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${productStore.productStoreCall!} <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onclick="authentication('店铺认证','/product/authentication','','510')">店铺认证</a></li>
						<li><a href="javascript:;" onClick="mypassword()">修改密码</a></li>
						<li><a href="/product/product_exit">退出</a></li>
				</ul>
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<#if productStore.productStoreExamine == 2>
		<div class="menu_dropdown bk_2">
			<dl id="menu-article">
				<dt><i class="Hui-iconfont">&#xe60d;</i>商品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a data-href="/product/product" data-title="商品列表" href="javascript:void(0)">商品列表</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-article">
				<dt><i class="Hui-iconfont">&#xe627;</i>订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a data-href="/product/order_all" data-title="全部订单" href="javascript:void(0)">全部订单</a></li>
						<li><a data-href="/product/order_shipped" data-title="待发货" href="javascript:void(0)">待发货</a></li>
						<li><a data-href="/product/order_received" data-title="待收货" href="javascript:void(0)">待收货</a></li>
						<li><a data-href="/product/order_completed" data-title="已完成" href="javascript:void(0)">已完成</a></li>
						<li><a data-href="/product/order_cancel" data-title="已取消" href="javascript:void(0)">已取消</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</#if>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="/product/welcome">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="/product/welcome"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/hui/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	/*$("#min_title_list li").contextMenu('Huiadminmenu', {
		bindings: {
			'closethis': function(t) {
				console.log(t);
				if(t.find("i")){
					t.find("i").trigger("click");
				}		
			},
			'closeall': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
		}
	});*/
});
/*
 * 修改密码
 */
function mypassword(){
	layer.open({
		type: 1,
		area: ['300px','200px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '修改密码',
		content: '<div><table class="table table-border table-bordered"><tr class="text-c"><td>原密码:</td><td><input type="password" name="old_password" placeholder="请输入原来密码" id="old_password" /></td></tr>'+
						'<tr class="text-c"><td>新密码:</td><td><input type="password" name="new_password" placeholder="请输入新密码！" id="new_password" /></td></tr>'+
						'<tr class="text-c"><td>新密码:</td><td><input type="password" name="new_passwords" placeholder="请再次新密码！" id="new_passwords" /></td></tr>'+
						'<tr class="text-c"><td colspan="2"><input class="btn btn-success radius" type="button" onclick="mypassword_submit()" value="提交更改"></td></tr></table></div>'
	});
}

/*
 * 修改密码提交
 */
function mypassword_submit(){
	var old_password = $("#old_password").val();
	var new_password = $("#new_password").val();
	var new_passwords = $("#new_passwords").val();
	if(old_password==""){
		layer.msg('请输入原密码!',{icon:5,time:1000});
	}else{
		if(new_password==""){
			layer.msg('请输入新密码!',{icon:5,time:1000});
		}else{
			if(new_password!=new_passwords){
				layer.msg('两次输入的新密码不一致!',{icon:5,time:1000});
			}else{
				$.ajax({
		            type: "POST",
		            url: "/product/product_pwd_update",
		            data: {oldProductStorePwd:old_password,productStorePwd:new_password},
		            dataType: "text",
		            success: function(data){
		            	if(data=="success"){
	                    	  layer.msg('修改密码成功!',{
	      						icon:1,
	      						time:1000,
	      						end: function () {
	      							window.location.replace("/publicpage/prostore_login");
	      						}
	      					});
	                      }else{
	                    	  layer.msg('修改密码失败!',{icon:5,time:1000});
	                      }
		            },
		             error:function() { layer.msg('服务器错误!',{icon:5,time:1000});}
		        });
			}
		}
	}
}

/*店铺认证*/
function authentication(title,url,w,h){
	layer_show(title,url,w,h);
}


</script> 
</body>
</html>