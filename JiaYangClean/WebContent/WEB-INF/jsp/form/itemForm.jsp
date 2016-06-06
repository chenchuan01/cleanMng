<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf"%>
	<form id="itemForm" class="form-horizontal" action="item/itemModify.do" method="post">
		<div class="form-group">
			<label  for="name">服务名称</label>
			<input id="name" class="form-control" type="text" name="name" value="${item.name }" placeholder="" valid="required" />
			<input type="hidden" name="id" value="${item.id }" >
		</div>
		<div class="form-group">
			<label  for="descs">服务描述</label>
			<textarea rows="3" class="form-control" id="descs" name="descs" valid="required">${item.descs }</textarea>
		</div>
		<div class="form-group">
			<label  for="price">服务价格</label>
			RMB:<input type="text" class="form-control" id="price" value="${item.price }" name="price"  valid="required" />
		</div>
		<div class="form-group">
			<label  for="remarks">备注</label>
			<textarea rows="3" class="form-control" id="remarks" name="remarks">${item.remarks }</textarea>
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-success form-control" onclick="valid('#itemForm',save);">保存修改</button>
		</div>
	</form>
