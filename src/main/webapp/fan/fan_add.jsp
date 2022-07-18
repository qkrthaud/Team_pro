<%@page import="javax.swing.text.Document"%>
<%@page import="fan_member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.addpo {position: absolute; top:400px; left:45%;}
</style>
</head>
<body>
<%@ include file="fan_header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript">

</script>
<div class="addpo">
<form id="fo" action="fan_add2.jsp" method="post">
<input type="text" name="id" id="id" placeholder="아이디 입력">
<input type="button" value="중복 확인" onclick="chkID()">
<br>
<input type="text" name="pwd" id="pwd" placeholder="비밀번호 입력"><br>
<input type="text" name="pwd2" id="pwd2" onchange="pwdChk()" placeholder="비밀번호 확인"><label id="label">비밀번호 확인</label><br>
<input type="text" name="name" placeholder="이름 입력"><br>
<input type="text" name="addr" placeholder="주소 입력"><br>
<input type="text" name="tel" placeholder="전화번호 입력"><br>
<input type="button" value="회원가입" onclick="chk()">
<input type="button" value="뒤로" onclick="location.href='index.jsp'">
</form>
</div>
<script type="text/javascript">
let pwd = document.getElementById("pwd")
let pwd2 = document.getElementById("pwd2")
function pwdChk(){
	let label = document.getElementById("label")
	if(pwd.value == pwd2.value){
		label.innerHTML = "<b>일치합니다</b>"
	}else{
		label.innerHTML = "<b style='color:red;'>불 일치합니다</b>"
		pwd.value=""
		pwd2.value=""
		pwd.focus()
	}
}
function chkID(){
	let id = document.getElementById("id")
	if(id.value == "" ){
		alert("아이디가 입력되지 않았습니다")
	}else{
		location.href="fan_chkId.jsp?id="+id.value
	}
	
	
}
function chk(){
	//alert("chk호출")	
	let id = document.getElementById("id")
	let pwd = document.getElementById("pwd")
	let pwd2 = document.getElementById("pwd2")
	
	if(id.value == ""){
		alert("아이디는 필수 항목 입니다")
		id.focus()
		
	}else if(pwd.value == ""){
		alert("비밀번호는 필수 항목 입니다")
		pwd.focus()
	}else if(pwd2.value == ""){
		alert("비밀번호 확인은 필수 항목 입니다")
		pwd2.focus()
	}else{
		fo.submit()
	}
}
</script>
</body>
</html>