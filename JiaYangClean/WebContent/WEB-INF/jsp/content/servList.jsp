<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../base/coraHeader.jspf" %>

<div id="content" class="col-lg-12">
	<!-- PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			<div class="divide-20"></div>
					<c:forEach items="${items }" var="item">
					<div class="col-sm-6 col-md-3">
					    <div class="thumbnail">
					      <img src="${ctx}/static/img/item.jpg" alt="服务项目" style="width: 220px;height: 200px">
					      <div class="caption">
					        <h4>${item.name }</h4>
					        <a class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="${item.descs }"><i class="fa fa-jpy"></i>${item.price }</a>
					        <a href="javascript:;" class="btn btn-success "onclick="">立即预约</a>
					      </div>
					    </div>
					  </div>
					</c:forEach>
			<div class="divide-20"></div>
			</div>
		</div>
	</div>
</div>
