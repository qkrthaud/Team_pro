<%@page import="fan_member.MemberDTO"%>
<%@page import="fan_member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.modifypo {position: absolute; top: 400px; left: 45%;}
</style>
</head>
<body>
<%@ include file="fan_header.jsp" %>
<% String num= String.valueOf(session.getAttribute("id")) ; 
MemberDAO dao = new MemberDAO();
MemberDTO dto= dao.getMem2(num);

%>
<div class="modifypo">
<form id="fo" action="fan_mod2.jsp" method="post">
<input type="hidden" name="num" value="<%=dto.getNum() %>">
<input type="text" name="id" id="id" value="<%=dto.getId() %>" ><br>
<input type="text" name="pwd" id="pwd"  value="<%=dto.getPwd() %>" ><br>
<input type="text" name="pwd2" id="pwd2"  value="<%=dto.getPwd() %>" onchange="pwdChk()" ><label id="label">비밀번호 확인</label><br>
<input type="text" name="name"  value="<%=dto.getName() %>" ><br>
<input type="text" name="addr"  value="<%=dto.getAddr() %>" ><br>
<input type="text" name="tel"  value="<%=dto.getTel() %>" ><br>
<input type="button" value="정보수정" onclick="chk()">
<input type="button" value="뒤로" onclick="location.href='fan_main.jsp'">
<input type="button" value="회원탈퇴" onclick="location.href='fan_remove.jsp?num=<%=dto.getNum()%>'">
</form>
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
function chk(){
	//alert("chk호출")	
	let id = document.getElementById("id")
	//let pwd1 = document.getElementById("pwd1")
	//let pwd2 = document.getElementById("pwd2")
	
	if(id.value == ""){
		alert("아이디는 필수 항목 입니다")
		id.focus()
		return;
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
</div>
</body>
</html>