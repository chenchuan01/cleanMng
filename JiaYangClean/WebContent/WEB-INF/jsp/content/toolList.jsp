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
					<form id="search" class="form-inline" action="tool/toolPage.do" method="post" role="form">
					  <div class="form-group">
						<label class="sr-only" for="name">工具名称</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="工具名称">
					  </div>
					  <div class="form-group">
					  	<button type="button" class="btn btn-info" onclick="page(1)">查询</button>
					  	<button type="button" class="btn btn-success" onclick="autoWin('新增工具', 'tool/toolForm.do',400,600)">新增工具</button>
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
						<th>工具名称</th>
						<th>用途描述</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr id="template">
						<td item="index"></td>
						<td item="name"></td>
						<td item="descs"></td>
						<td item="remarks"></td>
						<td item="oprea" itemFiled="id">
							<a href="javascript:;" class="btn btn-warning" onclick="autoWin('用户修改','tool/toolForm.do?id=',400,600)">修改</a>
							<a href="javascript:;" class="btn btn-danger"  onclick="deleteItem('tool/toolDelete.do?id=')">删除</a> 
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
