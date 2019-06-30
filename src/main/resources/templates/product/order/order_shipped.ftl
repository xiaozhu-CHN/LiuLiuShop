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
<title>待发货</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理  <span class="c-gray en">&gt;</span> 待发货 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${productOrderVOList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="15">待发货订单列表</th>
			</tr>
			<tr class="text-c">
				<th width="100">订单号</th>
				<th width="100">用户昵称</th>
				<th width="150">商品名称</th>
				<th width="100">商品属性</th>
				<th width="150">数量</th>
				<th width="100">成交金额</th>
				<th width="200">收货地址</th>
				<th width="200">备注</th>
				<th width="150">物流信息</th>
				<th width="100">下单时间</th>
				<th width="100">付款时间</th>
				<th width="100">发货时间</th>
				<th width="100">收货时间</th>
				<th width="100">订单状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if productOrderVOList?size != 0>
				<#list productOrderVOList! as productOrderVO>
					<tr class="text-c" id="${(productOrderVO.oiId)!}">
						<td>${(productOrderVO.OCode)!}</td>
						<td>${(productOrderVO.userCall)!}</td>
						<td>${(productOrderVO.proName)!}</td>
						<td>${(productOrderVO.proprName)!}</td>
						<td>${(productOrderVO.oiNum)!}</td>
						<td>${(productOrderVO.oiMoney)!}</td>
						<td>
							${(productOrderVO.usadName)!}&nbsp;&nbsp;${(productOrderVO.usadPhone)!}<br>
							${(productOrderVO.provinceName)!}&nbsp;${(productOrderVO.cityName)!}&nbsp;${(productOrderVO.areaName)!}<br>
							${(productOrderVO.usadAdress)!}&nbsp;(${(productOrderVO.usadEms)!})
						</td>
						<td>${(productOrderVO.oiMessage)!}</td>
						<td>
							<#if productOrderVO.expressCode??>
							${(productOrderVO.expressCompanyName)!}:<br>
							${(productOrderVO.expressCode)!}
							<#else>
							暂无物流
							</#if>
						</td>
						<td>${(productOrderVO.OCreatedate)!}</td>
						<td>${(productOrderVO.alipayPayPaydate)!}</td>
						<td>${(productOrderVO.expressDeliverydate)!}</td>
						<td>${(productOrderVO.oiComfirmdate)!}</td>
						<td>${(productOrderVO.osName)!}</td>
						<td class="td-manage">
							<a title="发货" href="javascript:;" onclick="order_shipped_update(${(productOrderVO.oiId)!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
						</td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
</div>
<div id="order_shipped" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title">发货</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<form method="post" class="form form-horizontal" id="order_shipped_form">
			<div class="modal-body">
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>物流公司：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="select-box">
								<select class="select" size="1" name="expressCompanyId">
							    	<option value="" selected>请物流公司</option>
										<#if expressCompanyList?size != 0>
											<#list expressCompanyList! as expressCompany>
												<option value="${(expressCompany.expressCompanyId)!}">${(expressCompany.expressCompanyName)!}</option>
											</#list>
										</#if>
								</select>
							</span>
						</div>
				</div>
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品属性名称：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入物流单号！" class="input-text radius size-M" id="expressCode" name="expressCode">
						</div>
				</div>				
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input type="hidden"  id="oiId" name="oiId"/>
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
//打开发货页面
var oiId;
function order_shipped_update(oi_id){
	odId = oi_id;
	$("#oiId").val(oi_id);
	$("#order_shipped").modal("show");
}

$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[1,2,3,6,7]}// 制定列不参与排序
		]
	});
	//提交表单
	$("#order_shipped_form").validate({
		rules:{
			expressCompanyId:{
				required:true,
			},
			expressCode:{
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
      				url: "/product/order_shipped_form" ,
      				dataTyep:"text",
                 	async: false,
      				success: function(data){
      					if(data="success"){
      						layer.msg("发货成功！",{
          						icon:1,
          						time:1000,
          						end: function () {
          							$("#order_shipped").modal("hide");
          							$("#"+odId).remove();
          						}
          					});
      					}else{
      						layer.msg('发货失败!',{icon:5,time:1000});
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