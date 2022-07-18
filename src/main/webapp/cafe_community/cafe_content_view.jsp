<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table {margin:auto; width: 70%; height: 500px;}
.th-1{width:20%; height:10px; text-align:center;}
.th-2{width:70%; height:70%;}
.textbox1{width:90%; height:20px;}
.textbox2{width:90%; height:300px;}
</style>
</head>
<body>
<%@ include file="../cafe_main/cafe_header.jsp" %>
	<jsp:useBean id="dao" class="cafe.CafeDAO" />
	<c:set var="dto" value="${dao.getContent(param.title) }" />
		<form action="cafe_modify.jsp" method="post">
		<input type="hidden" name="id" value="${dto.id }">
		<br>
		<table class="table" border="1">
			<tr>
				<th class="th-1">게시글 번호</th><td>${dto.num }</td>
			</tr>
			<tr>
				<th class="th-1">제목</th><td><input class="textbox1" type="text" name="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<th class="th-1">작성자</th><td>${dto.id }</td>
			</tr>
			<tr>
				<th class="th-1">조회수</th><td>${dto.hit }</td>
			</tr>
			<tr>
				<th>내용</th><td  class="th-2"><input class="textbox2" type="text" name="content" value="${dto.content }"></td>
			</tr>
			<tr>
				<th colspan="3">
				<input type="submit" value="수정">
				<input type="button" value="삭제" onclick="location.href='cafe_delete.jsp?id=${dto.getId() }'">
				</th>
			</tr>
		</table>
	</form>
	<br>
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>