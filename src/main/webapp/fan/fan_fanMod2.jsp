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
<jsp:useBean id="dto" class="fan.FanDTO"/>
<jsp:useBean id="dao" class="fan.FanDAO"/>
<jsp:setProperty property="*" name="dto"/>
<% dao.regMod(dto); %>
<script type="text/javascript">
alert('수정되었습니다')
location.href="fan_fan.jsp"
</script>
</body>
</html>