<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hi{position: absolute; top:400px; left: 800px; margin:auto; text-align: center; font-size: 30px;}




</style>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%@ include file="fan_header.jsp" %>
<%-- <% if(session.getAttribute("id")==null){%>
	<script type="text/javascript">
	alert('로그인 후 이용해주세요')
	location.href="index.jsp"
	</script>
	<% }
	%> --%>
	
<div class="hi">
cafe 클릭시 cafe_main으로 이동<br>
cafe 홈으로 클릭시 fan_main 이동<br>
blog 연동<br>
<br>
<br>
</div>







</body>
</html>
