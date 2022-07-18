<%@page import="fan_member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<% 
String uid=request.getParameter("id"); 
String upwd=request.getParameter("pwd"); 
MemberDAO dao = new MemberDAO();
int result=0;
result=dao.chklog(uid,upwd);
if(result != 0){ 
	session.setAttribute("id", result);%>

	<script type="text/javascript">
	alert('로그인 성공')
	location.href="fan_main.jsp"
	</script>
<% }else{%>
<script type="text/javascript">
	alert('로그인 실패')


	location.href="fan_index.jsp"
</script>
<% }
%>
</body>
</html>