<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.section{width :100%; height: 500px; 
		background-color: #AD9AEE; padding:10px;
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
<%@ include file="../cafe_main/cafe_header.jsp" %>
<h1 style="text-align:center;">자유 게시판</h1>
<jsp:useBean id="dao" class="cafe.CafeDAO" />
<form action="cafe_write_view.jsp" method="post">

	<c:set var="totalPage" value="${dao.getTotalPage() }" />
	
	<c:set var="pc" value="${dao.pagingNum(param.start) }"/>
	
	<c:set var="list" value="${dao.list(pc.startPage, pc.endPage) }"/>
	
<table class="table" border="1">
	
	<tr>
		<th style="width : 50px;">글번호</th>
		<th style="width : 500px;">제목</th>
		<th style="width : 50px;">작성자</th>
		<th style="width : 200px;">작성일</th>
		<th style="width : 50px;">조회수</th>
	</tr>
	<c:choose>
		<c:when test="${list.size() == 0 }">
		<tr>
			<th colspan="6">데이터없음</th>
		</tr>
		</c:when>
		<c:otherwise>
		<c:forEach var="dto" items="${list }">
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
		</c:otherwise>
	</c:choose>
	<tr>
		<th colspan="4">
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
		<button type="button" onclick="location.href='cafe_community.jsp?start=${s-1}'">이전</button>
	</c:when>
	<c:otherwise>
		<button disabled>이전</button>
	</c:otherwise>
</c:choose>
<!-- end에는 총페이지 값이 들어와야 합니다. end=el{page} -->
	<c:forEach var="cnt" begin="1" end="${pc.totEndPage }" step="1">
		<a href="cafe_community.jsp?start=${cnt}">
			${cnt}
		</a>	
	</c:forEach>
<!-- 다음 버튼 -->	
<c:choose>
	<c:when test="${s < pc.totEndPage }">
		<button type="button" onclick="location.href='cafe_community.jsp?start=${s+1}'">다음</button>
	</c:when>
	<c:otherwise>
		<button disabled>다음</button>
	</c:otherwise>
</c:choose>
			
			
			|${s}/${pc.totEndPage }|
		</th>
		<td><input type="submit" value="글작성"></td>
	</tr>
</table>
</form>
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>