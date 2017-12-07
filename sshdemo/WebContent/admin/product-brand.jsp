<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>未审核</title>
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
	<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页
	<span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span>
	未审核 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="adminSelectAction" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">

		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onClick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> </span>
		</div>
		<table class="table table-border table-bordered table-bg">

			<tbody>
				<c:if test="${admingoodslist==null}">
					
					
					<center>
						<div class="inner">
						<p style="margin-top: 20px;">暂无商品发布</p>
							<img src="img/zw.png">
						</div>
					</center>
				</c:if>
				<c:if test="${admingoodslist!=null}">
					<thead>
						<tr>
							<th scope="col" colspan="11">未审核商品列表</th>
						</tr>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="40">ID</th>
							<th width="150">商品名称</th>
							<th width="50">价格</th>
							<th>描述</th>
							<th>用户ID</th>
							<th>商品类型</th>
							<th width="50">商品状态</th>
							<th>发布时间</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<c:forEach items="${admingoodslist}" var="ite">

						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td>${ite.id }</td>
							<td><a href="detailAction?id=${ite.id }">${ite.goodsname }</a></td>
							<td>${ite.newprice }</td>
							<td>${ite.introduce }</td>
							<td>${ite.userId }</td>
							<td>${ite.category }</td>

							<th>${ite.status}</th>
							<th>${ite.datetime}</th>
							<td class="td-manage"><a href="adminupdatagoodsAction?id=${ite.id }">一键审核</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		/*管理员-删除*/
		function admin_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : '',
					dataType : 'json',
					success : function(data) {
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}
	</script>
</body>
</html>