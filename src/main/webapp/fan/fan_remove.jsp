<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="fan_member.MemberDAO"/>
<% dao.remove(request.getParameter("num")); %>
<script type="text/javascript">
alert('회원탈퇴 완료')
<% session.invalidate(); %>
location.href="fan_main.jsp"
</script>
</body>
</html>