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
<title>溜溜商城商家入驻</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" />
<div class="header2"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <div class="form form-horizontal">
    	<p style="color:deeppink" align="center" id="msg" ></P>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input name="productStoreName" id="productStoreName" type="text" placeholder="账户名" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input name="productStoreCall" id="productStoreCall" type="text" placeholder="店铺名" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input name="productStorePwd" id="productStorePwd" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input name="productStorePwds" id="productStorePwds" type="password" placeholder="确认密码" class="input-text size-L">
        </div>
      </div>
     <!--  <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div> -->
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="submit_productstore" type="submit" class="btn btn-success radius size-L" value="&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp;册&nbsp;">
          <a href="/publicpage/prostore_login">已有账号？去登陆。</a>
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
			var pwds=$("#productStorePwds").val();
			var call=$("#productStoreCall").val();
			var reg1 = /^\w{3,20}$/;
			var reg2 = /^[a-zA-Z]\w{5,17}$/;
			var reg3 = /^[\u4E00-\u9FA5A-Za-z0-9_]+$/;
			if(name.length<=0)$("#msg").html("账户名不能为空!");
			else if(!reg1.test(name))$("#msg").html("账户名格式不正确!");
			else if(call.length<=0)$("#msg").html("店铺名不能为空!");
			else if(!reg3.test(call))$("#msg").html("店铺名格式不正确!");
			else if(pwd.length<=0)$("#msg").html("密码不能为空!");
			else if(!reg2.test(pwd))$("#msg").html("密码格式不正确!");
			else if(!(pwd==pwds))$("#msg").html("两次密码不一致!");
			else{
				
			$.ajax({
	             type: "POST",
	             url: "/publicpage/prostore_register_form",
	             data: {productStoreName:name,productStorePwd:pwd,productStoreCall:call},
	             dataType: "text",
	             success: function(data){
	                       if(data=="success"){
	                    	   alert("注册成功");
	                    	   window.location.replace("/publicpage/prostore_login");
	                       }else{
	                    	   if(data=="error"){
	                    		   $("#msg").html("该账户名或者店铺名已存在!");
	                    	   }else{
	                    		   alert("注册失败");
	                    	   }
	                       }
	                      },
	              error:function() { alert("注册错误");}
	         }); 
			}
		})
</script>
</body>
</html>
