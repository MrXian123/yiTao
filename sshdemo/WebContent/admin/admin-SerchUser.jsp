<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
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
	<span class="c-gray en">&gt;</span> 角色管理 <span class="c-gray en">&gt;</span>
	用户管理 <a class="btn btn-success radius r"
		style="line-height: 1.6em; margin-top: 3px"
		href="adminUsersAction" title="刷新"><i
		class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div align="center">
			<form id="formLogin" action="adminUserIdAction" method="post">
				<input type="text" class="input-text" style="width: 250px"
					placeholder="输入用户名称" id="" name="user1.loginid">
				<button type="submit" class="btn btn-success" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜用户
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray" style="margin-top: 20px;">
			<span class="l"> <a href="javascript:;" onClick="datadel()"
				class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
					批量删除</a> <a class="btn btn-primary radius" href="javascript:;"
				onClick="admin_role_add('添加角色','admin-role-add.jsp','800')"><i
					class="Hui-iconfont">&#xe600;</i> 添加角色</a>
			</span>
		</div>

		<table class="table table-border table-bordered table-hover table-bg">

			<c:if test="${user1==null}">


				<center>
					<div class="inner">
						<p style="margin-top: 20px;">暂无用户信息</p>

					</div>
				</center>
			</c:if>


			<c:if test="${user1!=null}">
				<thead>
					<tr>
						<th scope="col" colspan="9">用户列表</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="40">ID</th>
						<th width="150">用户名</th>
						<th>角色</th>
						<th>姓名</th>
						<th width="90">手机</th>
						<th>地址</th>
						<th width="150">邮箱</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>

					<tr class="text-c">
						<td><input type="checkbox" value="" name=""></td>
						<td>${user1.id}</td>
						<td>${user1.loginid}</td>
						<td><c:if test="${user1.role==0}">管理员</c:if>
							<c:if test="${user1.role==1}">普通用户</c:if></td>
						<td>${user1.name}</td>
						<td>${user1.phone}</td>
						<td>${user1.address}</td>
						<td>${user1.mail}</td>
						<td class="f-14"><a title="编辑" href="javascript:;"
							onClick="admin_role_edit('用户信息编辑','admin-role-add.jsp','1')"
							style="text-decoration: none"><i class="Hui-iconfont">&#xe6df;</i></a>
							<a title="删除" href="javascript:;"
							onClick="admin_role_del(this,'1')" class="ml-5"
							style="text-decoration: none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</tbody>
			</c:if>




		</table>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>

	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript">
		/*管理员-角色-添加*/
		function admin_role_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-角色-编辑*/
		function admin_role_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-角色-删除*/
		function admin_role_del(obj, id) {
			layer.confirm('角色删除须谨慎，确认要删除吗？', function(index) {
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