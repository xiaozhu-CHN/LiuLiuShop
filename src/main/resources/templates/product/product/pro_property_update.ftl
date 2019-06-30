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

<title>商家认证</title>
</head>
<body>
<article class="page-container">
	<form method="post" class="form form-horizontal" id="form_product_update" >
			<div class="modal-body">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>属性缩略图：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
						  <input class="input-text upload-url radius" type="text" placeholder="请选择缩略图！" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
						  <input type="file" multiple class="input-file" name="proprImgUpload" id="proprImgUpload">
						</span>
					</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性名称：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="${(proProperty.proprName)!}" class="input-text radius size-M" id="proprName" name="proprName">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性数量：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="${(proProperty.proprNumber)!}" class="input-text radius size-M" id="proprNumber" name="proprNumber">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性原价：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="${(proProperty.proprOriginalPrice)!}" class="input-text radius size-M" id="proprOriginalPrice" name="proprOriginalPrice">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性现价：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="${(proProperty.proprPromotePrice)!}" class="input-text radius size-M" id="proprPromotePrice" name="proprPromotePrice">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>取消时间：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="select-box">
								<select class="select" size="1" name="proprCancelTime">
							    	<option value="" selected>请选择取消时间</option>
									<option value="600000" id="time600000">10分钟</option>
									<option value="1800000" id="time1800000">30分钟</option>
									<option value="7200000" id="time7200000">2小时</option>
									<option value="86400000" id="time86400000">24小时</option>
								</select>
							</span>
						</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input type="hidden" value="${(proProperty.proprId)!}" name="proprId"/>
						<input type="hidden" value="${(proProperty.pro_id)!}" name="pro_id"/>
						<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					</div>
				</div>
			</div>
			</form>
</article>

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
	$("#time${(proProperty.proprCancelTime)!}").attr("selected","selected");
	$("#form_product_update").validate({
		rules:{
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			if(confirm("确定要提交?")){
				$(form).ajaxSubmit({
      				type: 'post',
      				url: "/product/pro_property_update_form" ,
      				dataTyep:"text",
                 	async: false,
      				success: function(data){
      					if(data="success"){
      						layer.msg("修改商品属性成功！",{
          						icon:1,
          						time:1000,
          						end: function () {
          							var index = parent.layer.getFrameIndex(window.name);
          							parent.$('.btn-refresh').click();
          							parent.layer.close(index);  
          						}
          					});
      					}else{
      						layer.msg('修改商品属性失败!',{icon:5,time:1000});
      					}
      					
      				},
                      error: function(XmlHttpRequest, textStatus, errorThrown){
      					layer.msg('服务器错误!',{icon:5,time:1000});
      				}
      				});
				};
			}
		});
});
</script>
</body>
</html>