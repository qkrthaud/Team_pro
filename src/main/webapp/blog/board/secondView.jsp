<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
두번째
<c:set var="pageNum" value="2" />
<div style = "width: 80%; margin: 0 auto;">
<c:forEach var="secondContent"
	items="${dao.blogContentViewTab(pageNum) }" varStatus="secondVar">
	<div id="accordion">
		<div class="card">
			<div class="card-header">
				<a class="card-link" data-toggle="collapse"
					href="#collapse${secondVar.count }"> ${secondContent.title } </a>
			</div>
			<div id="collapse${secondVar.count }" class="collapse show"
				data-parent="#accordion">
				<div class="card-body">${secondContent.content }</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>
<%@ include file="../layout/footer.jsp"%>