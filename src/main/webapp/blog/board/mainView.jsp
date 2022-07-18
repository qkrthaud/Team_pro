<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
전체보기

<c:forEach var="blogContents" items="${dao.blogContentView(dto) }"
	varStatus="stepCount">
	<div class="media border p-3">
		<div class="media-body">
			<h4>
				${msg } <small><i>Posted on ${blogContents.bdate }</i></small>
			</h4>
			<p>${blogContents.content }</p>
		</div>
	</div>
	<%--<tr id="contenttitle">
			<td><a href="contentcomment.jsp?value=${blogContents.step }">${blogContents.title }</a></td>
		</tr>
		<tr id="contentmain" style="display: none;">
			<td>${blogContents.content }</td>
		</tr> --%>
</c:forEach>

<%@ include file="../layout/footer.jsp"%>