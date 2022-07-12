<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="cafe.CafeDAO" />
	<c:set var="dto" value="${dao.getContent(param.title) }" />
		<input type="hidden" name="title" value="${dto.title }">
	<form action="cafe_modify.jsp" method="post">
		<table border="1">
			<tr>
				<th>게시글 번호</th><td>${dto.num }</td>
			</tr>
			<tr>
				<th>제목</th><td>${dto.title }</td>
			</tr>
			<tr>
				<th>작성자</th><td>${dto.id }</td>
			</tr>
			<tr>
				<th>조회수</th><td>${dto.hit }</td>
			</tr>
			<tr>
				<th>내용</th><td>${dto.content }</td>
			</tr>
			<tr>
				<td colspan="3">
				<input type="submit" value="수정">
				<a href="cafe_delete.jsp?id=${dto.id }">삭제</a>
				<input type="submit" value="답글">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>