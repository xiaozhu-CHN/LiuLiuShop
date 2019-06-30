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
<title>入驻审核</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商家管理 <span class="c-gray en">&gt;</span> 入驻审核 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> </span><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${productVOList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="50">ID</th>
				<th width="150">商家账户</th>
				<th width="150">店铺昵称</th>
				<th width="150">对公账户</th>
				<th width="150">营业执照</th>
				<th width="300">商家地址</th>
				<th width="300">经营类型</th>
				<th width="50">店铺得分</th>
				<th width="100">认证情况</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if productVOList?? && productVOList?size != 0>
				<#list productVOList! as productVO> 
					<tr class="text-c">
						<td>${(productVO.productStoreId)!}</td>
						<td>${(productVO.productStoreName)!}</td>
						<td>${(productVO.productStoreCall)!}</td>
						<td>${(productVO.productStoreBank)!}</td>
						<td><img src="/imgs/product/${(productVO.productStoreLicense)!}" style="width:90px;hight:50px"></td>
						<td>${(productVO.productStoreAdress)!}</td>
						<td>${(productVO.storeType)!}</td>
						<td>${(productVO.productStoreScore)!}</td>
						<td>
							<#if productVO.productStoreExamine == 1>待审核</#if>
							<#if productVO.productStoreExamine == 2>认证通过</#if>
							<#if productVO.productStoreExamine == 3>认证失败</#if>
						</td>
						<td class="td-manage">
							<#if productVO.productStoreExamine == 1>
								<a title="通过认证" href="javascript:;" onclick="product_examine(${(productVO.productStoreId)!},2)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>
								<a style="text-decoration:none" onClick="product_examine(${(productVO.productStoreId)!},3)" href="javascript:;" title="拒绝认证"><i class="Hui-iconfont">&#xe631;</i></a>
							</#if>
						</td>
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
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[4,5,6,9]}// 制定列不参与排序
		]
	});
});


/* 审核认证 */
function product_examine(id, examine){
	if(confirm('确认审核？')) window.location.href="/admin/product_examine?productStoreExamine="+examine+"&productStoreId="+id; 
}

</script>
</body>
</html>