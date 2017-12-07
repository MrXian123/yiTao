<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息编辑</title>
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
</head>
<body>
	<article class="page-container">
	<form action="loadAction" method="post" class="form form-horizontal"
		id="form-admin-role-add">
		<!-- 商品名称 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="goods.goodsname">
			</div>
		</div>
		<!-- 商品价格 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="goods.newprice">
			</div>
		</div>
		<!-- 商品描述 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" name="goods.introduce">
			</div>
		</div>
		
		<!-- 商品类型 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商品类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select name="goods.category" class="input-text">
					<option value="数码" selected>数码</option>
					<option value="手机">手机</option>
					<option value="百货">百货</option>
					<option value="家居">家居</option>
					<option value="家电">家电</option>
					<option value="鞋子">鞋子</option>
					<option value="服饰">服饰</option>
					<option value="珠宝">珠宝</option>
					<option value="其他">其他</option>
				</select>
			</div>
		</div>
		<!-- 商品图片 -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">商品图片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="file" name="upload" class="input-text" />
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input type="submit" class="btn btn-success radius"
					id="admin-role-save" name="btnUpload" value="确定" />
			</div>
		</div>
	</form>
	</article>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".permission-list dt input:checkbox").click(
					function() {
						$(this).closest("dl").find("dd input:checkbox").prop(
								"checked", $(this).prop("checked"));
					});
			$(".permission-list2 dd input:checkbox")
					.click(
							function() {
								var l = $(this).parent().parent().find(
										"input:checked").length;
								var l2 = $(this).parents(".permission-list")
										.find(".permission-list2 dd").find(
												"input:checked").length;
								if ($(this).prop("checked")) {
									$(this).closest("dl").find(
											"dt input:checkbox").prop(
											"checked", true);
									$(this).parents(".permission-list").find(
											"dt").first()
											.find("input:checkbox").prop(
													"checked", true);
								} else {
									if (l == 0) {
										$(this).closest("dl").find(
												"dt input:checkbox").prop(
												"checked", false);
									}
									if (l2 == 0) {
										$(this).parents(".permission-list")
												.find("dt").first().find(
														"input:checkbox").prop(
														"checked", false);
									}
								}
							});

			$("#form-admin-role-add").validate({
				rules : {
					roleName : {
						required : true,
					},
				},
				onkeyup : false,
				focusCleanup : true,
				success : "valid",
				submitHandler : function(form) {
					$(form).ajaxSubmit();
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.close(index);
				}
			});
		});
	</script>
</body>
</html>