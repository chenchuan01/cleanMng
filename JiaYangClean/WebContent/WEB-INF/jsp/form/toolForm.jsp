<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf"%>
	<form id="toolForm" class="form-horizontal" action="tool/toolModify.do" method="post">
		<div class="form-group">
			<label  for="name">工具名称</label>
			<input type="hidden" name="id" value="${tool.id }" >
			<input id="name" class="form-control" type="text" name="name" value="${tool.name }" placeholder="" valid="required" />
		</div>
		<div class="form-group">
			<label  for="descs">用途描述</label>
			<input type="text" class="form-control" id="descs" name="descs" value="${tool.descs }"  valid="required" />
		</div>
		<div class="form-group">
			<label  for="remarks">备注</label>
			<input type="text" class="form-control" id="remarks" value="${tool.remarks }" name="remarks"  valid="required" />
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-success form-control" onclick="valid('#toolForm',save);">保存修改</button>
		</div>
	</form>
