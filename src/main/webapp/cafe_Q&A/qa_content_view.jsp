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
.th-1{width:30%; height:10px; text-align:center;}
.th-2{width:70%; height:10px;}
.textbox1{width:90%; height:20px;}
.textbox2{width:90%; height:300px;}
</style>
</head>
<body>
<%@ include file="../cafe_main/cafe_header.jsp" %>
<jsp:useBean id="dao" class="cafe.QADAO" />
	<c:set var="dto" value="${dao.getContent(param.id) }"/>
	<form action="qa_modify.jsp" method="post">
		<input type="hidden" name="id" value="${dto.id }">
	<br>
	<table class="table" border="1">
		<tr>
			<td class="th-1">번호</td> <td>${dto.num }</td>
		</tr>
		<tr>
			<td class="th-1">조회수</td> <td>${dto.hit }</td>
		</tr>
		<tr>
			<td class="th-1">아이디</td> <td>${dto.id }</td>
		</tr>
		<tr>
			<td class="th-1">제목</td> <td><input class="textbox1" type="text" name="title" value="${dto.title }"></td>
		</tr>
		<tr>
			<td>내용</td> <td><textarea class="textbox2" name="content">${dto.content }</textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="삭제" onclick="location.href='qa_delete.jsp?id=${dto.getId() }'">
				<input type="button" value="답글달기" onclick="location.href='qa_reply_view.jsp?id=${dto.id }'">
				<input type="button" value="뒤로가기" onclick="location.href='cafe_Q&A.jsp'">
			</th>
		</tr>
	</table>
	</form>
	<br>
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>