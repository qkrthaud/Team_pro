<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="fdao" class="fan.FanDAO"/>
<% fdao.delete(request.getParameter("no")); %>
<script type="text/javascript">
alert('삭제되었습니다')
location.href="fan_fan.jsp"
</script>
</body>
</html>