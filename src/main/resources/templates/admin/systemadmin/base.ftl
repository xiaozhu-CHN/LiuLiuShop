<!--_meta 作为公共模版分离出去-->
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
<!--/meta 作为公共模版分离出去-->

<title>邮件设置</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span>
	系统管理
	<span class="c-gray en">&gt;</span>
	邮件设置
	<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
</nav>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add" action="/admin/email_update" method="post">
		<div id="tab-system" class="HuiTab">
			<div class="tabBar cl">
				<span>邮件设置</span>
			</div>
			<div class="tabCon">
				<span><font color="red">${msg!}</font></span>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">发信昵称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text"  class="input-text" name="emailCall" value="${(email.emailCall)!}">
						<input type="hidden" name="emailId" value="${(email.emailId)!}">
						<input type="hidden" name="emailPower" value="${(email.emailPower)!}">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">SMTP服务器：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" id="" value="${(email.emailHost)!}" class="input-text" name="emailHost">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">SMTP 端口：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" value="${(email.emailPort)!}" name="emailPort" >
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">邮箱帐号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text" id="emailName" name="emailUsername" value="${(email.emailUsername)!}">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2">邮箱密码：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="password" value="${(email.emailPassword)!}" class="input-text" name="emailPassword">
					</div>
				</div>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<!-- <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button> -->
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/hui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/hui/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$("#form-article-add").Huitab({
		index:0
	});
});
function article_save_submit(){
	if(confirm("确定保存吗？")){
		$(selector).submit();
	}
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>