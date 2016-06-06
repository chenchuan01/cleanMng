<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf"%>
	<form id="configForm" class="form-horizontal" action="sys/configModify.do" method="post">
		<div class="form-group">
			<label  for="key">KEY</label>
			<input id="key" class="form-control" type="text" name="key" value="${config.key }" placeholder="" valid="required" />
			<input type="hidden" name="id" value="${config.id }">
		</div>
		<div class="form-group">
			<label  for="value">VALUE</label>
			<textarea rows="3" class="form-control" id="value" name="value" valid="required">${config.value }</textarea>
		</div>
		<div class="form-group">
			<label  for="remarks">REMARKS</label>
			<textarea rows="3" class="form-control" id="remarks" name="remarks" >${config.remarks }</textarea>
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-success form-control" onclick="valid('#configForm',save);">保存修改</button>
		</div>
	</form>
