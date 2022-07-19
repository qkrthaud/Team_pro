<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
첫번째
<c:set var="pageNum" value="1" />
<c:forEach var="firstContent"
	items="${dao.blogContentViewTab(pageNum) }" varStatus="firstVar">
	<div id="accordion">
		<div class="card">
			<div class="card-header">
				<a class="card-link" data-toggle="collapse"
					href="#collapse${firstVar.count }"> ${firstContent.title } </a>
			</div>
			<div id="collapse${firstVar.count }" class="collapse show"
				data-parent="#accordion">
				<div class="card-body">${firstContent.content }</div>
			</div>
		</div>
	</div>
</c:forEach>
<%@ include file="../layout/footer.jsp"%>