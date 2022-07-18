<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.login {margin:auto;}
.indexpo {position: absolute; top:400px; left: 45%;}
</style>
<script type="text/javascript">
function log(){
	id.focus()
	}
</script>
</head>
<body onload="log()">
<%@ include file="fan_header.jsp" %>
<div class="indexpo">
<form action="fan_chk.jsp">
<table class="login"><tr><th>아이디</th><td>
<input type="text" id="id" name="id"></td>
</tr><tr>
<th>비밀번호</th><td>
<input type="text" name="pwd">
</td></tr>
<tr><th colspan="2">
<input type="submit" value="로그인">

</th></tr>
</table>
</form>
</div>
</body>
</html>