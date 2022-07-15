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
<% request.setCharacterEncoding("UTF-8");
		CafeDAO dao = new CafeDAO();
		dao.insert(
				request.getParameter("title"),
				request.getParameter("id"),
				request.getParameter("content")
				);
		response.sendRedirect("cafe_community.jsp");
	%>
</body>
</html>