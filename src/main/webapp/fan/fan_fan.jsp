<%@page import="fan_member.MemberDTO"%>
<%@page import="fan.FanDTO"%>
<%@page import="fan_member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.fan {margin:auto; position: absolute; top:400px; left:36%; background-color: white;}
.fanno {width:20%;}
.fantitle {width: 50%;}
.fanname {width: 20%;}
</style>
</head>
<body>
<%@ include file="fan_header.jsp" %>
<%-- <% if(session.getAttribute("id")==null){%>
	<script type="text/javascript">
	alert('로그인 후 이용해주세요')
	location.href="index.jsp"
	</script>
	<% }
	%> --%>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dao" class="fan_member.MemberDAO"></jsp:useBean>
	 <c:set var="totalPage" value="${dao.getTotalPage() }"/>
<c:set var="arr" value="${dao.list2(param.start) }"/>
<c:set var="abc" value="탈퇴한 회원"/>
<table class="fan" border="1">
<tr>
<th>글번호</th>
<th>제목</th>
<th>작성자</th>
</tr>
<c:choose> 
<c:when test=" ${ arr.size()==0}">
	<tr>
	<th colspan="3">글 없음</th></tr>
	</c:when>
	<c:otherwise>
	<c:forEach var="dto" items="${arr }">
	<tr>
	<th class="fanno">${dto.no }</th>
	<th class="fantitle"><a href="fan_show.jsp?id=${dto.no }">${dto.title }</a></th>
	<th class="fanname">
	<c:choose>
	<c:when test="${dao.getMem(dto.num)==null }">
	${abc }
	</c:when>
	<c:otherwise>
	
	<c:set var="mdto" value="${ dao.getMem(dto.num)}"/>
	${mdto.name }
	</c:otherwise>
	</c:choose>
	
	</th>
	
	</tr>
	</c:forEach>
	</c:otherwise>

	</c:choose>
	<tr>
<th>
</th>
<th>
<c:choose>
<c:when test="${param.start==null }">
<c:set var="s" value="1"/>
</c:when>
<c:otherwise>
<c:set var="s" value="${param.start }"/>
</c:otherwise>
</c:choose>

<!-- 이전 버튼 -->
<c:choose>
<c:when test="${s>1 }">
<button type="button" onclick="location.href='fan_fan.jsp?start=${s-1}'">이전</button>
</c:when>

<c:otherwise>
<button disabled>이전</button>
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${totalPage%10==0 }">
<c:forEach var="cnt" begin="1" end="${ totalPage/10}" step="1">
&#91;
<a href="fan_fan.jsp?start=${cnt }">
${cnt }
</a>
&#93;
</c:forEach>
</c:when>
<c:otherwise>
<c:forEach var="cnt" begin="1" end="${ totalPage/10+1}" step="1">
&#91;
<a href="fan_fan.jsp?start=${cnt }">
${cnt }
</a>
&#93;
</c:forEach>
</c:otherwise>
</c:choose>



<c:choose>
<c:when test="${s<totalPage/10 }">
<button type="button" onclick="location.href='fan_fan.jsp?start=${s+1}'">다음</button>
</c:when>

<c:otherwise>
<button disabled>다음</button>
</c:otherwise>
</c:choose>
</th>
<th>
<c:choose>
<c:when test="${totalPage%10 == 0 }">
<c:set var="t" value="${ totalPage/10 }"/>
<fmt:parseNumber var="t" value="${ totalPage/10 }" integerOnly="true" />

${s } &#47; ${t }
<input type="button" value="글 등록" onclick="location.href='fan_regAdd.jsp'">
</c:when>
<c:otherwise>
<c:set var="t" value="${ ((totalPage/10)-(totalPage/10%1)+1) }"/>
<fmt:parseNumber var="t" value="${ ((totalPage/10)-(totalPage/10%1)+1) }" integerOnly="true" />

${s } &#47; ${t }
<input type="button" value="글 등록" onclick="location.href='fan_regAdd.jsp'">
</c:otherwise>
</c:choose>


</th>
</tr>


</table>

</body>
</html>