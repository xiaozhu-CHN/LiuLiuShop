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
<title>区/县列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 地址管理 <span class="c-gray en">&gt;</span> <a href="/admin/province">省份</a> <span class="c-gray en">&gt;</span> 市 <span class="c-gray en">&gt;</span> 区/县 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="area_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加区/县</a></span><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${areaList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th scope="col" colspan="9">${city.cityName!}-区/县列表</th>
			</tr>
			<tr class="text-c">
				<th width="40">ID</th>
				<th width="150">市名</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if areaList?? && areaList?size != 0>
				<#list areaList! as area> 
					<tr class="text-c">
						<td>${area.areaId!}</td>
						<td>${area.areaName!}</td>
						<td class="td-manage"> <a title="编辑" href="javascript:;" onclick="area_updata(${area.areaId!},'${area.areaName!}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="area_del(${area.areaId!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
</div>
<div id="area-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title"></h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<div class="modal-body">
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">区/县名：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入区/县名" class="input-text radius size-M" id="area-name">
						</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="area_add_submit()">提交</button>
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
		  {"orderable":false,"aTargets":[2]}// 制定列不参与排序
		]
	});
});
var area_id;
var city_id=${city.cityId!};
/*区/县-增加*/
function area_add(){
	area_id=0;
	$(".modal-title").html("添加区/县");
	$("#area-add").modal("show");
}
/* 区/县修改 */
function area_updata(id,name){
	area_id=id;
	$("#area-name").attr("placeholder",name);
	$("#area-add").modal("show");
	$(".modal-title").html("修改区/县");
}

/* 提交新增区/县和修改区/县 */
function area_add_submit(){
	var area_name=$("#area-name").val();
	if(area_name!==""){
		if(area_id==0){
			window.location.href="/admin/area_add?areaName="+area_name+"&cityId="+city_id; 
		}else{
			window.location.href="/admin/area_update_name?areaId="+area_id+"&areaName="+area_name+"&cityId="+city_id; 
		}
	}else{
		alert("请输入区/县名");
	}
}

/* 删除城市 */
function area_del(id){
	if(confirm('确认删除？')) window.location.href="/admin/area_del?areaId="+id+"&cityId="+city_id; 
}
</script>
</body>
</html>