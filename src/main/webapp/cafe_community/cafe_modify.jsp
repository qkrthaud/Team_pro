<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="dao" class="cafe.CafeDAO" />
	<jsp:useBean id="dto" class="cafe.CafeDTO" />
	<jsp:setProperty property="*" name="dto"/>
	${dao.modify(dto) }
	<% response.sendRedirect("cafe_community.jsp"); %>
</body>
</html>