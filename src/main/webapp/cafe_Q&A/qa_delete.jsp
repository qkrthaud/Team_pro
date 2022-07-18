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
	<%
		QADAO dao = new QADAO();
		dao.delete(request.getParameter("id"));
		response.sendRedirect("cafe_Q&A.jsp");
	%>
</body>
</html>