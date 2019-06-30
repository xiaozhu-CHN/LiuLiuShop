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
<title>省列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 系统管理 <span class="c-gray en">&gt;</span> 地址管理 <span class="c-gray en">&gt;</span> 省份 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="province_add()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加省</a></span><span><font color="red">${msg!}</font></span> <span class="r">共有数据：<strong>${provinceList?size}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="40">ID</th>
				<th width="150">省名</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<#if provinceList?size != 0>
				<#list provinceList! as province> 
					<tr class="text-c">
						<td>${province.provinceId!}</td>
						<td><u style="cursor:pointer" class="text-primary" onclick="city_open(${province.provinceId!})">${province.provinceName!}</u></td>
						<td class="td-manage"> <a title="编辑" href="javascript:;" onclick="province_updata(${province.provinceId!},'${province.provinceName!}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="province_del(${province.provinceId!})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
</div>
<div id="province-add" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content radius">
			<div class="modal-header">
				<h3 class="modal-title"></h3>
				<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
			</div>
			<div class="modal-body">
				<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">省名：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="请输入省名" class="input-text radius size-M" id="province-name">
						</div>
				</div>
				
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" onclick="province_add_submit()">提交</button>
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
var province_id;
/*省份-增加*/
function province_add(){
	 province_id=0;
	 $(".modal-title").html("添加省");
	 $("#province-add").modal("show");
}
/* 省份修改 */
function province_updata(id,name){
	province_id=id;
	$(".modal-title").html("修改省");
	$("#province-name").attr("placeholder",name);
	$("#province-add").modal("show");
}

/* 提交新增省份和修改省份 */
function province_add_submit(){
	var province_name=$("#province-name").val();
	if(province_name!==""){
		if(province_id==0){
			window.location.href="/admin/province_add?provinceName="+province_name; 
		}else{
			window.location.href="/admin/province_update_name?provinceId="+province_id+"&provinceName="+province_name; 
		}
	}else{
		alert("请输入省名");
	}
}

/* 删除省份 */
function province_del(id){
	if(confirm('确认删除？')) window.location.href="/admin/province_delete?provinceId="+id; 
}
/*打开市页面*/
function city_open(id){
	window.location.href="/admin/city?provinceId="+id;
}
</script>
</body>
</html>