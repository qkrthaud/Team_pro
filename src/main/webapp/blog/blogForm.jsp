<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>
블로그폼
<%-- 	<c:choose>
		<c:when test = "${login != null }">
			<table style = "width: 100%;">
			<c:forEach var = "blogContents" items = "${dao.blogContentView(dto) }" varStatus = "stepCount">
				<tr id = "contenttitle">
					<td><a href = "contentcomment.jsp?value=${blogContents.step }">${blogContents.title }</a></td>
				</tr>
				<tr id = "contentmain" style = "display:none;">
					<td>${blogContents.content }</td>
				</tr>
			</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<form action = "blogLogin.jsp" method = "post" name = "blogLg">
				<input type = "text" name = "id" placeholder = "아이디">
				<input type = "password" name = "pwd" placeholder="비밀번호">
				<input type = "button" value = "로그인" onclick = "javascript:check(blogLg)">
			</form>
		</c:otherwise>
	</c:choose>
</div> --%>

<c:choose>
	<c:when test="${login == null}">
		<%
		response.sendRedirect(request.getContextPath()+"/blog/login/loginForm.jsp");
		%>
	</c:when>
	<c:otherwise>
		<div class="container" style="margin-top: 30px">
			<div class="row">
				<div class="col-sm-8">
					<div class="fakeimg">Fake Image</div>
					<br>
					<h2>TITLE HEADING</h2>
					<h5>Title description, Sep 2, 2017</h5>
					<div class="fakeimg">Fake Image</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<%@ include file="layout/footer.jsp"%>
