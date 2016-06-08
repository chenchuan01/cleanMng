<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/taglib.jspf"%>
	<form id="userForm" class="form-horizontal" action="sys/userModify.do" method="post">
		<div class="form-group">
			<label  for="name">姓名</label>
			<input id="name" class="form-control" type="text" name="name" value="${user.name }" placeholder="" valid="required" />
			<input type="hidden" name="id" value="${user.id }" >
			<input type="hidden" name="roles" value="${empty user.roles?(empty initRole?'':initRole):user.roles }">
		</div>
		<div class="form-group">
			<label  for="tel">联系电话</label>
			<input type="text" class="form-control" id="tel" name="tel" value="${user.tel }"  valid="tel" />
		</div>
		<div class="form-group">
			<label  for="address">家庭地址</label>
			<input type="text" class="form-control" id="address" value="${user.address }" name="address"  valid="required" />
		</div>
		<c:if test="${initRole not eq 0 }">
		<div class="form-group">
			<label  for="userName">登录账户</label>
			<input type="text" id="userName" class="form-control" name="userName"
					placeholder="" value="${user.userName }" valid="required">
		</div>
		<div class="form-group">
			<label  for="password">密码</label>
				<input type="password" id="password" class="form-control" name="password"
					placeholder="" value="${user.password }" valid="required">
		</div>
		</c:if>
		<div class="form-group">
			<button type="button" class="btn btn-success form-control" onclick="valid('#userForm',save);">保存修改</button>
		</div>
	</form>
