<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:useBean id="dao" class="cafe.QADAO" />
	<c:set var="dto" value="${dao.getContent(param.id) }" />
	<form action="qa_reply.jsp" method="post">
		<input type="hidden" name="idgroup" value="${dto.idgroup }">
		<input type="hidden" name="step" value="${dto.step }">
		<input type="hidden" name="indent" value="${dto.indent }">
		<br>
		<table class="table" border="1">
			<tr>
				<td class="th-1">번호</td> <td>${dto.num }</td>
			</tr>
			<tr>
				<td class="th-1">조회수</td> <td>${dto.hit }</td>
			</tr>
			<tr>
				<td class="th-1">이름</td> <td><input class="textbox1" type="text" name="id" value="${dto.id }"></td>
			</tr>
			<tr>
				<td class="th-1">제목</td>
				<td><input class="textbox1" type="text" name="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="textbox2" name="content"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="답변">
					<input type="button" value="삭제" onclick="location.href='qa_delete.jsp?id=${dto.getId() }'">
					<input type="button" value="목록가기" onclick="location.href='cafe_Q&A.jsp'">
				</th>
			</tr>
		</table>
	</form>
	<br>
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>