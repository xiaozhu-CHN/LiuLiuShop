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
<title>图片管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理  <span class="c-gray en">&gt;</span> 图片管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="product_proimg_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加图片</a></span><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${productImageList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">商品图片集列表</th>
			</tr>
			<tr class="text-c">
				<th width="50">图片ID</th>
				<th width="150">图片1</th>
				<th width="150">图片2</th>
				<th width="150">图片3</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if productImageList?size != 0>
				<#list productImageList! as  productImage>
					<tr class="text-c">
						<td>${(productImage.proimgId)!}</td>
						<td><img src="/imgs/proimg/${(productImage.proimgLinkOne)!}" style="width:100px;hight:122px"></td>
						<td><img src="/imgs/proimg/${(productImage.proimgLinkTwo)!}" style="width:100px;hight:122px"></td>
						<td><img src="/imgs/proimg/${(productImage.proimgLinkThree)!}" style="width:100px;hight:122px"></td>
						<td class="td-manage">
							<a title="删除" href="javascript:;" onclick="product_proimg_del(this,${(productImage.proimgId)!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
</div>
<div id="product-proimg-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title">增加图片</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<form method="post" class="form form-horizontal" id="form_product_proimg">
			<div class="modal-body">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片1：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
						  <input class="input-text upload-url radius" type="text" placeholder="请选择图片1！" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
						  <input type="file" multiple class="input-file" name="proimgLinkOne" id="proimgLinkOne">
						</span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片2：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
						  <input class="input-text upload-url radius" type="text" placeholder="请选择图片2！" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
						  <input type="file" multiple class="input-file" name="proimgLinkTwo" id="proimgLinkTwo">
						</span>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片3：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group">
						  <input class="input-text upload-url radius" type="text" placeholder="请选择图片3！" name="uploadfile-1" id="uploadfile-1" readonly><a href="javascript:void();" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe642;</i> 浏览文件</a>
						  <input type="file" multiple class="input-file" name="proimgLinkThree" id="proimgLinkThree">
						</span>
					</div>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input type="hidden" value="${proId!}" name="proId"/>
						<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;上传图片&nbsp;&nbsp;">
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
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[1,2,3,4]}// 制定列不参与排序
		]
	});
	//提交表单
	$("#form_product_proimg").validate({
		rules:{
			proimgLinkOne:{
				required:true,
			},
			proimgLinkTwo:{
				required: true,
			},
			proimgLinkThree:{
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
      				url: "/product/product_image_form" ,
      				dataTyep:"text",
                 	async: false,
      				success: function(data){
      					if(data="success"){
      						layer.msg("添加图片成功！",{
          						icon:1,
          						time:1000,
          						end: function () {
          							var index = parent.layer.getFrameIndex(window.name);
          							parent.$('.btn-refresh').click();
          							parent.layer.close(index);
          						}
          					});
      					}else{
      						layer.msg('添加图片失败!',{icon:5,time:1000});
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

/*图片-增加*/
function product_proimg_add(){
	 $("#product-proimg-add").modal("show");
}

/*图片-删除*/
function product_proimg_del(obj,proimg_id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			data:{proimgId:proimg_id},
			url: '/product/product_image_del',
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