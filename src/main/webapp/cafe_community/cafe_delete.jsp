<%@page import="cafe.CafeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		CafeDAO dao = new CafeDAO();
		dao.delete(request.getParameter("id"));
		response.sendRedirect("cafe_community.jsp");
	%>
</body>
</html>