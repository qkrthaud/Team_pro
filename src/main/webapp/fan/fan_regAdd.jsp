<%@page import="fan_member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.reg {border:1px solid black; margin:auto;}
.reg th {width:500px;border:1px solid black;}
.reg th input {margin:0; width:90%;}
textarea {width:90%; height:500px;}
.regAddpo {position: absolute; top: 400px; left: 38%;}
.regbut {position: relative; left: 400px;}
</style>
</head>
<body>
<%@ include file="fan_header.jsp" %>
<% if(session.getAttribute("id")==null){%>
	<script type="text/javascript">
	alert('로그인 후 이용해주세요')
	location.href="fan_index.jsp"
	</script>
	<% }
	%>
	<jsp:useBean id="fdao" class="fan.FanDAO"/>
	<jsp:useBean id="dao" class="fan_member.MemberDAO"/>
<% String s=String.valueOf(session.getAttribute("id"));
MemberDTO dto = new MemberDTO();
if(session.getAttribute("id")==null){
	dto.setNum(1);
	dto.setName("1");
}else{
	dto = dao.getMem2(s);
}

%>
<div class="regAddpo">
<form id="fo" action="fan_regAdd2.jsp" method="post">
<input type="hidden" name="num" value=<%=dto.getNum() %>>
<table class="reg">
<tr><th><input type="text" id="title" name="title" placeholder="제목"></th></tr>
<tr><th><textarea name="content" id="content" placeholder="내용"></textarea></th></tr>
<tr><th><input type="text" readonly value=<%=dto.getName() %>></th></tr>
<tr><td><input type="button" class="regbut" onclick="location.href='fan_fan.jsp'" value="뒤로"><input type="button" class="regbut" onclick="chk2()" value="등록"></td>
</table>
</form>
<script type="text/javascript">
function chk2(){
		
	let title = document.getElementById("title")
	let con = document.getElementById("content")
	
	
	if(title.value == ""){
		alert("아이디는 필수 항목 입니다")
		title.focus()
		
	}else if(con.value == ""){
		alert("비밀번호는 필수 항목 입니다")
		con.focus()
	}
	else{
		fo.submit()
	}
}
</script>
</div>
</body>
</html>