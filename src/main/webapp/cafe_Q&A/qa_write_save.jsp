<%@page import="cafe.QADAO"%>
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
		QADAO dao = new QADAO();
		dao.insert(
				request.getParameter("name"),
				request.getParameter("title"),
				request.getParameter("content")
				);
		response.sendRedirect("cafe_Q&A.jsp");
	%>
</body>
</html>