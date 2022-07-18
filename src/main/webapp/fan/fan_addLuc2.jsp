<%@page import="lucky.LuckyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");

%>
<jsp:useBean id="dto" class="lucky.LuckyDTO"/>
<jsp:setProperty property="*" name="dto"/>
<% LuckyDAO dao = new LuckyDAO();
dao.addLuc(dto);
%>

<script type="text/javascript">
alert("등록되었습니다")
location.href="fan_lucky.jsp"
</script>
</body>
</html>