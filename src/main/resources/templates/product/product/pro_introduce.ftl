
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>商品简介</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script>
    window.UEDITOR_HOME_URL = "/ueditor/";
    </script>
    <link rel="stylesheet" type="text/css" href="/hui/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/hui/static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="/hui/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="/hui/static/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="/hui/static/h-ui.admin/css/style.css" />
    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
<div>
    <h1 align="center">商品简介编辑</h1>
    <script id="editor" type="text/plain" style="width:950px;height:400px;">${proIntroduce!}</script>
</div>
<div>
	<input class="btn btn-success radius" type="button" value="提交更改" onclick="introduce_button()">
	<input class="btn btn-danger radius" type="button" value="取消" onclick="quxiao_button()">
</div>

<script type="text/javascript">
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function(action) {
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
                return '/ueditor/imgUpload';
                //'http://localhost:8080/imgUpload';为方法imgUpload的访问地址
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        }
</script>
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
	var pro_id = ${proId!};
	var ue = UE.getEditor('editor',{maximumWords:3000});
	//提交更改
	function introduce_button(){
		if(confirm("确定要提交?")){
			var pro_introduce = ue.getContent();
			if(ue.hasContents()){
				$.ajax({
		             type: "POST",
		             url: "/product/pro_introduce_update",
		             data: {proIntroduce:pro_introduce,proId:pro_id},
		             dataType: "text",
		             success: function(data){
		            	 layer.msg("修改商品简介成功！",{
       						icon:1,
       						time:1000,
       						end: function () {
       							var index = parent.layer.getFrameIndex(window.name);
       							parent.$('.btn-refresh').click();
       							parent.layer.close(index);  
       						}
       					});
		              },
		              error:function() {
		            	  layer.msg('修改商品简介失败!',{icon:5,time:1000});
		              }
		         });
			}else{
				alert("内容不能为空！");
			}
		}
	}
	
	function quxiao_button(){
		var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);  
	}
</script>
</body>
</html>