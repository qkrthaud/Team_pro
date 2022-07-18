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
<jsp:useBean id="dao" class="fan_member.MemberDAO"/>
<jsp:useBean id="dto" class="fan_member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<% dao.modify(dto); %>
<script type="text/javascript">
alert('회원수정 완료')
location.href="fan_main.jsp"
</script>
</body>
</html>