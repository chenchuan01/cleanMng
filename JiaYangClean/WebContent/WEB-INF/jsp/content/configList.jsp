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
						<label class="sr-only" for="key">KEY</label>
						<input type="text" class="form-control" id="key" name="key" placeholder="KEY">
					  </div>
					  <div class="form-group">
						<label class="sr-only" for="value">VALUE</label>
						<input type="text" class="form-control" id="value" name="value" placeholder="VALUE">
					  </div>
					  <div class="form-group">
					  	<button type="button" class="btn btn-info" onclick="page(1)">查询</button>
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
						<td item="key"></td>
						<td item="value"></td>
						<td item="remarks"></td>
						<td item="oprea" itemFiled="id">
							<a href="javascript:;" class="btn btn-warning" onclick="autoWin('配置修改','sys/configForm.do?id=',400,600)">修改</a>
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
