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
<link href="/hui/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="/hui/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="/hui/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="/hui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>溜溜商城商家登陆</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" />
<div class="header2"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <div class="form form-horizontal">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input name="productStoreName" id="productStoreName" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input name="productStorePwd" id="productStorePwd" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
     <!--  <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div> -->
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
        	<input id="submit_productstore" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
        	<a href="/publicpage/prostore_register">没有账号？去注册。</a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="footer">Copyright 溜溜购物商城   by H-ui.admin v3.1</div>
<script type="text/javascript" src="/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/hui/static/h-ui/js/H-ui.min.js"></script>
<script>
		$("#submit_productstore").click(function(){
			var name=$("#productStoreName").val();
			var pwd=$("#productStorePwd").val();
			 $.ajax({
	             type: "POST",
	             url: "/publicpage/productstorelogin",
	             data: {productStoreName:name,productStorePwd:pwd},
	             dataType: "text",
	             success: function(data){
	                       if(data=="success"){
	                    	   window.location.replace("/product/index");
	                       }else{
	                    	   alert("账号或者密码错误");
	                       }
	                      },
	              error:function() { alert("登陆错误");}
	         });
		})
</script>
</body>
</html>