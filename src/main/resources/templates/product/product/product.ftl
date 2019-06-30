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
<title>商品列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理  <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="product_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a></span><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${productList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">商品列表</th>
			</tr>
			<tr class="text-c">
				<th width="50">商品ID</th>
				<th width="150">商品名称</th>
				<th width="200">商品副标题</th>
				<th width="100">商品类型</th>
				<th width="150">创建时间</th>
				<th width="50">商品得分</th>
				<th width="100">是否上架</th>
				<th width="150">商品编辑</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if productList?size != 0>
				<#list productList! as  product>
					<tr class="text-c">
						<td>${(product.proId)!}</td>
						<td>${(product.proName)!}</td>
						<td>${(product.proSubtitle)!}</td>
						<td>
							<#if proCategoryList?size != 0>
								<#list proCategoryList! as  proCategory>
									<#if proCategory.procaId = product.procaId>${(proCategory.procaName)!}</#if>
								</#list>
							</#if>
						</td>
						<td>${(product.proCreatedate)!}</td>
						<td>${(product.proScore)!}</td>
						<td class="td-status">
							<#if product.proSell == 1>
								<span class="label radius">已下架</span>
							</#if>
							<#if product.proSell == 2>
								<span class="label label-success radius">已上架</span>
							</#if>
						</td>
						<td>
							<u style="cursor:pointer" class="text-primary" onclick="window.location='/product/pro_property?proId=${(product.proId)!}'">商品属性编辑</u><br>
							<u style="cursor:pointer" class="text-primary"  onclick="member_add('图片管理','/product/product_image?proId=${(product.proId)!}','1200','650')">商品图片编辑</u><br>
							<u style="cursor:pointer" class="text-primary" onclick="member_add('商品简介','/product/pro_introduce?proId=${(product.proId)!}','1000','700')">商品简介编辑</u>
						</td>
						<td class="td-manage">
							<#if product.proSell == 2>
								<a style="text-decoration:none" onClick="product_stop(this,${(product.proId)!})" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe631;</i></a>
							</#if>
							<#if product.proSell == 1>
								<a style="text-decoration:none" onClick="product_start(this,${(product.proId)!})" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe615;</i></a>
							</#if>
							<a title="商品编辑" href="javascript:;" onclick="product_update(${(product.proId)!},'${(product.proName)!}','${(product.proSubtitle)!}',${(product.procaId)!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
							<a title="预览" href="javascript:;" onclick="javascript:window.open('/publicpage/product?proId=${(product.proId)!}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe695;</i></a>
							<a title="删除" href="javascript:;" onclick="product_del(this,${(product.proId)!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
</div>
<div id="product-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title"></h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<div class="modal-body">
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">商品名称：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入商品名称" class="input-text radius size-M" id="pro_name">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">副标题：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入商品副标题" class="input-text radius size-M" id="pro_subtitle">
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">商品类型：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="select-box">
							  <select class="select" size="1" id="proca_id">
							    <option value="" selected>请选择商品类型</option>
							    <#if storeTypeList?size != 0>
									<#list storeTypeList! as  storeType>
										<#if proCategoryList?size != 0>
											<#list proCategoryList! as  proCategory>
												<#if storeType.procaId == proCategory.procaId><option value="${(proCategory.procaId)!}" id="proca${(proCategory.procaId)!}">${(proCategory.procaName)!}</option></#if>
											</#list>
										</#if>
									</#list>
								</#if>
							  </select>
							</span>
						</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="product_add_submit()">提交</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
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
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[1,2,7,8]}// 制定列不参与排序
		]
	});
});
var proId;
var procaId2;
/*商品-增加*/
function product_add(){
	proId=0;
	 $(".modal-title").html("添加商品");
	 $("#product-add").modal("show");
}

/*商品-修改*/
function product_update(pro_id, pro_name, pro_subtitle, proca_id){
	proId = pro_id;
	procaId2 = proca_id;
	$(".modal-title").html("修改商品");
	$("#pro_name").val("");
	$("#pro_subtitle").val("");
	$("#pro_name").attr("placeholder",pro_name);
	$("#pro_subtitle").attr("placeholder",pro_subtitle);
	$("#proca"+proca_id).attr("selected","selected");
	$("#product-add").modal("show");
}

/*商品-删除*/
function product_del(obj,pro_id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			data:{proId:pro_id},
			url: '/product/product_del',
			dataType: 'text',
			success: function(data){
				if(data="success"){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
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

/* 提交新增商品和修改商品 */
function product_add_submit(){
	var proName = $("#pro_name").val();
	var proSubtitle = $("#pro_subtitle").val();
	var procaId = $("#proca_id").val();
	if(proId==0){
		if(proName!=""){
			if(proSubtitle!=""){
				if(procaId!=""){
					window.location.href="/product/product_form?proName="+proName+"&proSubtitle="+proSubtitle+"&procaId="+procaId; 
				}else{
					alert("请选择商品类型！");
				}
			}else{
				alert("请输入商品副标题！");
			}
		}else{
			alert("请输入商品名称！");
		}
	}else{
		if(proName==""&&proSubtitle==""&&procaId2==procaId){
			alert("您的商品没有任何改变喔！");
		}else{
			var html="/product/product_form_update?proId="+proId;
			if(proName!=""){
				html += "&proName="+proName;
			}
			if(proSubtitle!=""){
				html +="&proSubtitle="+proSubtitle;
			}
			if(procaId2!=procaId){
				html +="&procaId="+procaId;
			}
			window.location.href=html; 
		}
	}
}
/*商品-下架*/
function product_stop(obj,pro_id){
	layer.confirm('确认要下架吗？',function(index){
		 $.ajax({
	             type: "POST",
	             url: "/product/product_pro_sell",
	             data: {proId:pro_id,proSell:1},
	             dataType: "text",
	             success: function(data){
	            	 if(data="success"){
	            	 	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,'+pro_id+')" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe615;</i></a>');
	            	 	$(obj).parents("tr").find(".td-status").html('<span class="label radius">已下架</span>');
	            		$(obj).remove();
	            		layer.msg('已下架!',{icon: 5,time:1000});
	            	 }else{
	            		 layer.msg('下架失败!',{icon: 5,time:1000});
	            	 }
	             },
	             error:function() {layer.msg('服务器错误!',{icon:5,time:1000})}
	         });	
	});
}

/*商品-上架*/
function product_start(obj,pro_id){
	layer.confirm('确认要上架吗？',function(index){
		$.ajax({
	             type: "POST",
	             url: "/product/product_pro_sell",
	             data: {proId:pro_id,proSell:2},
	             dataType: "text",
	             success: function(data){
	            	 if(data="success"){
	            		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,'+pro_id+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe631;</i></a>');
	            	 	$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上架</span>');
	            		$(obj).remove();
	            		layer.msg('已上架!', {icon: 6,time:1000});
	            	 }else{
	            		 layer.msg('上架失败!',{icon: 5,time:1000});
	            	 }
	             },
	             error:function() {layer.msg('服务器错误!',{icon:5,time:1000})}
	         });
		
	});
}

/*图片管理*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script>
</body>
</html>