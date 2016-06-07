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
					<form id="search" class="form-inline" action="plan/planPage.do" method="post" role="form">
					  <div class="form-group">
						<label class="sr-only" for="recon">预约编号</label>
						<input type="text" class="form-control" id="recon" name="recon" placeholder="预约编号">
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="userId">用户</label>
						<select class="form-control" id="userId" name="userId">
							<option value="">查询用户</option>
							<c:forEach items="${users }" var="user">
								<option value="${user.id }">${user.name }</option>
							</c:forEach>
						</select>
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="cleanerId">员工</label>
						<select class="form-control" id="cleanerId" name="cleanerId">
							<option value="">查询员工</option>
							<c:forEach items="${emps }" var="emp">
								<option value="${emp.id }">${emp.name }</option>
							</c:forEach>
						</select>
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="cleanerId">项目</label>
						<select class="form-control" id="cleanerId" name="cleanerId">
							<option value="">服务项目</option>
							<c:forEach items="${items }" var="item">
								<option value="${item.id }">${item.name }</option>
							</c:forEach>
						</select>
					  </div>
					  <div class="form-group">
					  	<button type="button" class="btn btn-info" onclick="page(1)">查询</button>
					  	<!-- <button type="button" class="btn btn-success" onclick="autoWin('新增用户', 'plan/planForm.do',400,600)">新增用户</button> -->
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
						<th>预约编号</th>
						<th>客户姓名</th>
						<th>预约项目</th>
						<th>预约时间</th>
						<th>分配人员</th>
						<th>需要工具</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr id="template">
						<td item="index"></td>
						<td item="info.recon"></td>
						<td item="user.name"></td>
						<td item="item.name"></td>
						<td item="info.time"></td>
						<td item="info.time"></td>
						<td item="oprea" itemFiled="info.id">
							<a href="javascript:;" class="btn btn-warning" onclick="autoWin('用户修改','plan/planForm.do?id=',400,600)">修改</a>
							<a href="javascript:;" class="btn btn-danger"  onclick="deleteItem('plan/planDelete.do?id=')">取消</a> 
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
