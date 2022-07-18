<%@page import="lucky.LuckyDAO"%>
<%@page import="lucky.LuckyDTO"%>
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
String s = "null";
LuckyDAO dao=new LuckyDAO();
int rantop = dao.getRantop();
int ran = (int)(Math.random()*(rantop-1)+1); 
LuckyDTO dto = dao.getLuck(ran);
%>
랜덤 : <%=ran %><br>
랜덤탑 : <%=rantop %><br>
<% if(dto==null){
	%>
	<%= s%>
<% }else{%>
dto : <%=dto.getTitle()%>

<%} %>
</body>
</html>