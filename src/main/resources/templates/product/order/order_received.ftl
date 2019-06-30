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
<title>待收货</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 待收货 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${productOrderVOList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="14">待收货列表</th>
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
				<!-- <th width="100">操作</th> -->
			</tr>
		</thead>
		<tbody>
			<#if productOrderVOList?size != 0>
				<#list productOrderVOList! as productOrderVO>
					<tr class="text-c">
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
<!-- 						<td class="td-manage">
							<a title="属性编辑" href="javascript:;" onclick="pro_property_update('属性编辑','/product/pro_property_update?proprId=${(proProperty.proprId)!}',900,500)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> 
							<a title="删除" href="javascript:;" onclick="pro_property_del(this,${(proProperty.proprId)!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
						</td> -->
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
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
		  {"orderable":false,"aTargets":[1,2,3,6,7]}// 制定列不参与排序
		]
	});
})
</script>
</body>
</html>