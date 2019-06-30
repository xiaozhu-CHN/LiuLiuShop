<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<title>属性管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> <a href="/product/product">商品管理</a>  <span class="c-gray en">&gt;</span> 属性管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="pro_property_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加属性</a></span><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${proPropertyList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">商品属性列表</th>
			</tr>
			<tr class="text-c">
				<th width="50">属性ID</th>
				<th width="150">缩略图</th>
				<th width="150">属性名称</th>
				<th width="100">属性数量</th>
				<th width="100">原价</th>
				<th width="100">现价</th>
				<th width="100">取消时间</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if proPropertyList?size != 0>
				<#list proPropertyList! as  proProperty>
					<tr class="text-c">
						<td>${(proProperty.proprId)!}</td>
						<td><img src="/imgs/property/${(proProperty.proprImg)!}" style="width:100px;hight:122px"></td>
						<td>${(proProperty.proprName)!}</td>
						<td>${(proProperty.proprNumber)!}</td>
						<td>${(proProperty.proprOriginalPrice)!}</td>
						<td>${(proProperty.proprPromotePrice)!}</td>
						<td> 
							<#if proProperty.proprCancelTime == 600000>
								10分钟
							</#if>
							<#if proProperty.proprCancelTime == 1800000>
								30分钟
							</#if>
							<#if proProperty.proprCancelTime == 7200000>
								2小时
							</#if>
							<#if proProperty.proprCancelTime == 86400000>
								24小时
							</#if>
						</td>
						<td class="td-manage">
							<a title="属性编辑" href="javascript:;" onclick="pro_property_update('属性编辑','/product/pro_property_update?proprId=${(proProperty.proprId)!}',900,500)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
							<a title="删除" href="javascript:;" onclick="pro_property_del(this,${(proProperty.proprId)!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
</div>
<div id="pro-property-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title"></h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<form method="post" class="form form-horizontal" id="form_product_proimg">
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
							<input type="text" placeholder="请输入商品属性名称" class="input-text radius size-M" id="proprName" name="proprName">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性数量：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入商品属性数量" class="input-text radius size-M" id="proprNumber" name="proprNumber">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性原价：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入商品属性原价" class="input-text radius size-M" id="proprOriginalPrice" name="proprOriginalPrice">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性现价：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入商品属性现价" class="input-text radius size-M" id="proprPromotePrice" name="proprPromotePrice">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>取消时间：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="select-box">
								<select class="select" size="1" name="proprCancelTime">
							    	<option value="" selected>请选择取消时间</option>
									<option value="600000">10分钟</option>
									<option value="1800000">30分钟</option>
									<option value="7200000">2小时</option>
									<option value="86400000">24小时</option>
								</select>
							</span>
						</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input type="hidden" value="${proId!}" name="proId"/>
						<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/hui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="/hui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/hui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="/hui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/hui/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="/hui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="/hui/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="/hui/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="/hui/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="/hui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
$(function(){
	var proId = ${proId!};
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[1,2,6]}// 制定列不参与排序
		]
	});
	//提交表单
	$("#form_product_proimg").validate({
		rules:{
			proprImgUpload:{
				required:true,
			},
			proprName:{
				required: true,
			},
			proprNumber:{
				required: true,
			},
			proprOriginalPrice:{
				required: true,
			},
			proprPromotePrice:{
				required: true,
			},
			proprCancelTime:{
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
      				url: "/product/pro_property_add" ,
      				dataTyep:"text",
                 	async: false,
      				success: function(data){
      					if(data="success"){
      						layer.msg("添加商品属性成功！",{
          						icon:1,
          						time:1000,
          						end: function () {
          							var index = parent.layer.getFrameIndex(window.name);
          							parent.$('.btn-refresh').click();
          							parent.layer.close(index);
          							window.location.href="/product/pro_property?proId="+proId;   
          						}
          					});
      					}else{
      						layer.msg('添加商品属性失败!',{icon:5,time:1000});
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
/*属性-增加*/
function pro_property_add(){
	 proprId=0;
	 $("#pro-property-add").modal("show");
	 $(".modal-title").html("增加属性");
}

/*属性-修改*/
function pro_property_update(title,url,w,h){
	layer_show(title,url,w,h);
}



/*属性-删除*/
function pro_property_del(obj,propr_id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			data:{proprId:propr_id},
			url: '/product/pro_property_del',
			dataType: 'text',
			success: function(data){
				if(data="success"){
					$(obj).parents("tr").remove();
					layer.msg('删除成功!',{icon:1,time:1000});
				}else{
					layer.msg('删除失败!',{icon:5,time:1000});
				}
			},
			error:function(data) {
				layer.msg('服务器错误!',{icon:5,time:1000});
			},
		});		
	});
}

</script>
</body>
</html>