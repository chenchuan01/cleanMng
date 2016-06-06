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
					<form id="search" class="form-inline" action="item/itemPage.do" method="post" role="form">
					  <div class="form-group">
						<label class="sr-only" for="name">服务项目</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="服务项目">
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="price">价格</label>
						<input type="text" class="form-control" id="price" name="price" placeholder="服务价格">
					  </div>
					  <div class="form-group">
					  	<button type="button" class="btn btn-info" onclick="page(1)">查询</button>
					  	<button type="button" class="btn btn-success" onclick="autoWin('新增项目', 'item/itemForm.do',400,600)">新增项目</button>
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
						<th>服务项目</th>
						<th>描述</th>
						<th>价格(RMB)</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr id="template">
						<td item="index"></td>
						<td item="name"></td>
						<td item="descs"></td>
						<td item="price"></td>
						<td item="remarks"></td>
						<td item="oprea" itemFiled="id">
							<a href="javascript:;" class="btn btn-warning" onclick="autoWin('服务项目修改','item/itemForm.do?id=',400,600)">修改</a>
							<a href="javascript:;" class="btn btn-danger"  onclick="deleteItem('item/itemDelete.do?id=')">删除</a> 
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
