<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>카페 메인.</h1>
<jsp:useBean id="dao" class="cafe.CafeDAO" />
<form action="cafe_write_view.jsp" method="post">
<table border="1">
	
	<tr>
		<th>게시글 번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="dto" items="${dao.list() }">
			<tr>
				<td>${dto.num }</td> 
				<td>
				<a href="cafe_content_view.jsp?title=${dto.title }">
				${dto.title }
				</a>
				</td>
				<td>
				${dto.id }
				</td> 
				<td>${dto.savedate }</td>
				<td>${dto.hit }</td>
			</tr>
		</c:forEach>
	<tr>
		<td colspan="5"><input type="submit" value="글작성"></td>
	</tr>
</table>
</form>
</body>
</html>