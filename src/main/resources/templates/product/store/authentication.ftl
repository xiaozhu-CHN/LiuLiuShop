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
	<form action="" method="post" class="form form-horizontal" id="form-authentication">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>店铺名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				${(productStore.productStoreCall)!}
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>对公账户：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${(productStore.productStoreBank)!}" placeholder="请输入本公司的银行账户!" id="productStoreBank" name="productStoreBank">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>营业执照：</label>
			<div class="formControls col-xs-8 col-sm-9">
				
				<#if productStore.productStoreExamine != 3><img src="/imgs/product/${(productStore.productStoreLicense)!}" height="150" width="100" /></#if>
				<span class="btn-upload form-group">
				  <input class="input-text upload-url radius" type="text" placeholder="请选择公司营业执照复印件！" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
				  <input type="file" multiple class="input-file" name="prostoreFile" id="prostoreFile">
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>省市区：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class=".select-box">
				  <select class="select" size="1" id="province" style="width:150px">
				    <option value="" selected>请选择省</option>
				    <#if provinceList?? && provinceList?size != 0>
						<#list provinceList! as province>
						<option value="${(province.provinceId)!}">${(province.provinceName)!}</option>
						</#list>
					</#if>
				  </select>
				  <select class="select" size="1" id="city" style="width:150px">
				  	<option value="" selected>请选择市</option>
				  </select>
				  <select class="select" size="1" id="areaId" name="areaId" style="width:150px">
				  	<option value="" selected>请选择区/县</option>
				  </select>
				</span>
				<br>
				<span class=".select-box">
				  <span>${(provinceCityAreaVO.provinceName)!}&nbsp;&nbsp;&nbsp;&nbsp;${(provinceCityAreaVO.cityName)!}&nbsp;&nbsp;&nbsp;&nbsp;${(provinceCityAreaVO.areaName)!}</span>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>详细地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="请输入详细地址!" name="productStoreAdress" id="productStoreAdress" value="${(productStore.productStoreAdress)!}">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>经营范围：</label>
			<#if proCategoryList?? && proCategoryList?size != 0>
				<#list proCategoryList! as proCategory>
					<div class="check-box">
					    <input type="checkbox" id="proca${(proCategory.procaId)!}" value="${(proCategory.procaId)!}" name="proca">
					    <label for="proca${(proCategory.procaId)!}">${(proCategory.procaName)!}</label>
					</div>
				</#list>
			</#if>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<#if productStore.productStoreExamine == 3><input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交认证&nbsp;&nbsp;"></#if>
				<#if productStore.productStoreExamine == 2><input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;更改认证&nbsp;&nbsp;"></#if>
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
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//获取市
	$("#province").change(function(){
		var province_id = $(this).children('option:selected').val();
		if(province_id!=""){
			 $.ajax({
	             type: "POST",
	             url: "/product/city_all",
	             data: {provinceId:province_id},
	             dataType: "json",
	             success: function(data){
	            	 var html='';
	            	 html += '<option value="" selected>请选择市</option>'
	             	$.each(data, function(index, item){
	             		html +='<option value="'+item.cityId+'">'+item.cityName+'</option>';
	             	});
	            	 $("#city").html(html);
	             },
	             error:function() {layer.msg('获取城市错误!',{icon:5,time:1000})}
	         });
		}else{
			
			layer.msg('请选择省份!',{icon:5,time:1000});
		}
	});
	
	
	//获取区
	$("#city").change(function(){
		var city_id = $(this).children('option:selected').val();
		if(city_id!=""){
			 $.ajax({
	             type: "POST",
	             url: "/product/area_all",
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
	             error:function() {layer.msg('获取城市错误!',{icon:5,time:1000})}
	         });
		}else{
			layer.msg('请选择市!',{icon:5,time:1000});
		}
	});
	
	//提交表单
	$("#form-authentication").validate({
		rules:{
			productStoreBank:{
				required:true,
				minlength:15,
				maxlength:20,
			},
			areaId:{
				required: true,
			},
			prostoreFile:{
				required: true,
			},
			productStoreAdress:{
				required: true,
				maxlength:200,
			},
			proca:{
				required: true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			if(confirm("确定要提交?")){
				$(form).ajaxSubmit({
      				type: 'post',
      				url: "/product/authentication_form" ,
      				dataTyep:"text",
                 	async: false,
      				success: function(data){
      					if(data="success"){
      						layer.msg("提交申请认证成功！",{
          						icon:1,
          						time:1000,
          						end: function () {
          							var index = parent.layer.getFrameIndex(window.name);
          							parent.$('.btn-refresh').click();
          							parent.layer.close(index);
          						}
          					});
      					}else{
      						layer.msg('申请认证失败!',{icon:5,time:1000});
      					}
      					
      				},
                      error: function(XmlHttpRequest, textStatus, errorThrown){
      					layer.msg('服务器错误!',{icon:5,time:1000});
      				}
      				});
				};
			}
		});
		
		<#if storeTypeList?? && storeTypeList?size != 0>
			<#list storeTypeList! as storeType>
				$("#proca${(storeType.procaId)!}").attr("checked","checked");
			</#list>
		</#if>
	
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>