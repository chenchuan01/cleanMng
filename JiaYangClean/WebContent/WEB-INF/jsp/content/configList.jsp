<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/coraHeader.jspf" %>
<script type="text/javascript">
	$(function(){page(1);});
</script>
<div id="content" class="col-lg-12">
	<!-- PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			<div class="divide-20"></div>
					<form id="search" class="form-inline" action="sys/configPage.do" method="post" role="form">
					  <div class="form-group">
						<label class="sr-only" for="name">姓名</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="姓名">
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="tel">电话</label>
						<input type="text" class="form-control" id="tel" name="tel" placeholder="电话">
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="userName">登录账户</label>
						<input type="text" class="form-control" id="userName" name="userName" placeholder="登录账户">
						<input type="hidden" name="roles" value="0"/>
					  </div>
					  <div class="form-group">
					  	<button type="button" class="btn btn-info" onclick="page(1)">查询</button>
					  	<!-- <button type="button" class="btn btn-success" onclick="autoWin('新增用户', 'sys/newUser.do',400,600)">新增用户</button> -->
					  </div>
					</form>
			<div class="divide-20"></div>
			</div>
		</div>
		<div class="col-md-12>
			<div class="row">
				<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>KEY</th>
						<th>CONFIG</th>
						<th>REMARKS</th>
						<th>More</th>
					</tr>
				</thead>
				<tbody>
					<tr id="template">
						<td item="index"></td>
						<td item="name"></td>
						<td item="tel"></td>
						<td item="address"></td>
						<td item="userName"></td>
						<td item="oprea" itemFiled="id">
							<a href="javascript:;" class="btn btn-warning" onclick="win('用户修改','sys/userForm.do?id=')">修改</a>
							<a href="javascript:;" class="btn btn-danger"  onclick="deleteItem('sys/userDelete.do?id=')">删除</a> 
						</td>
					</tr>
				</tbody>
				<tbody id="tableData"></tbody>
			</table>
			<%@include file="../base/page.jspf"%>
			</div>
		</div>
	</div>
</div>
