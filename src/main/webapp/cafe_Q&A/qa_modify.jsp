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
	<jsp:useBean id="dao" class="cafe.QADAO" />
	<jsp:useBean id="dto" class="cafe.QADTO" />
	<jsp:setProperty property="*" name="dto"/>
	${dao.update(dto) }
	<% response.sendRedirect("cafe_Q&A.jsp"); %>
</body>
</html>