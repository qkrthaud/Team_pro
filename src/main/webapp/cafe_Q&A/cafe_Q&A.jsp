<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.section{disply:flex;
		}
.table{
		table-layout:fixed;
		margin:auto;
		width: 70%;
		text-align: center;
		}

</style>
</head>
<body>
<jsp:useBean id="dao" class="cafe.QADAO" />
<%@ include file="../cafe_main/cafe_header.jsp" %>
<div class="section">
<h1 style="text-align: center;">Q&A 게시판</h1>
<form action="qa_write_view.jsp" method="post">

	<c:set var="totalPage" value="${dao.getTotalPage() }" />
	
	<c:set var="pc" value="${dao.pagingNum(param.start) }"/>
	
	<c:set var="list" value="${dao.list(pc.startPage, pc.endPage) }"/>
	
<table class="table" border="1">
	<tr>
		<th style="width:50px;">번호</th>
		<th style="width:500px;">제목</th>
		<th style="width:50px;">아이디</th>
		<th style="width:200px;">날짜</th>
		<th style="width:50px;">조회수</th>
		<th>groupId</th>
		<th>step</th>
		<th>indent</th>
	</tr>
	<c:choose>
		<c:when test="${list.size() == 0 }">
		<tr>
			<th colspan="8">데이터없음</th>
		</tr>
		</c:when>
		<c:otherwise>
	<c:forEach var="dto" items="${list }" >
		<tr>
			<td>${dto.num }</td>
			<td>
				<c:forEach begin="1" end="${dto.indent }">-></c:forEach>
				<a href="qa_content_view.jsp?id=${dto.id }">${dto.title }</a>
			</td>
			<td>${dto.id }</td>
			<td>${dto.savedate }</td>
			<td>${dto.hit }</td>
			<td>${dto.idgroup }</td>
			<td>${dto.step }</td>
			<td>${dto.indent }</td>
		</tr>
	</c:forEach>
	</c:otherwise>
	</c:choose>
		<tr>
			<th colspan="8">
<c:choose>
	<c:when test="${param.start == null }">
		<c:set var="s" value="1" />
	</c:when>
	<c:otherwise>
		<c:set var="s" value="${param.start}" />
	</c:otherwise>
</c:choose>

<!-- 이전 버튼 -->
<c:choose>
	<c:when test="${s > 1 }">
		<button type="button" onclick="location.href='cafe_Q&A.jsp?start=${s-1}'">이전</button>
	</c:when>
	<c:otherwise>
		<button disabled>이전</button>
	</c:otherwise>
</c:choose>
<!-- end에는 총페이지 값이 들어와야 합니다. end=el{page} -->
	<c:forEach var="cnt" begin="1" end="${pc.totEndPage }" step="1">
		<a href="cafe_Q&A.jsp?start=${cnt}">
			${cnt}
		</a>	
	</c:forEach>
<!-- 다음 버튼 -->	
<c:choose>
	<c:when test="${s < pc.totEndPage }">
		<button type="button" onclick="location.href='cafe_Q&A.jsp?start=${s+1}'">다음</button>
	</c:when>
	<c:otherwise>
		<button disabled>다음</button>
	</c:otherwise>
</c:choose>
			
			
			|${s}/${pc.totEndPage }|
			<input type="submit" value="글작성">
		</th>
		</tr>
</table>
</form>
</div>
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>