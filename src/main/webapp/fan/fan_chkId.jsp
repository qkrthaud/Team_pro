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
<% 
request.setCharacterEncoding("utf-8");
request.getParameter("id"); 
MemberDAO dao = new MemberDAO();
int re = dao.chkId(request.getParameter("id"));
if(re==1){%>
	<script type="text/javascript">
	alert('이미 등록된 아이디입니다')
	history.back();
	</script>
<% }else{%>
	<script type="text/javascript">
	alert('사용가능한 아이디입니다')
	history.back();
	</script>
<%} %>
</body>
</html>