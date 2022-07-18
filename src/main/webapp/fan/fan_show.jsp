<%@page import="fan_member.MemberDTO"%>
<%@page import="fan.FanDAO"%>
<%@page import="fan.FanDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.showpo {position: absolute;top: 400px; left: 38%;}
</style>
</head>
<body>

<jsp:useBean id="dao" class="fan_member.MemberDAO"/>
<%@ include file="fan_header.jsp" %>
<% String s=String.valueOf(session.getAttribute("id"));
FanDAO fdao = new FanDAO();
FanDTO fdto = fdao.getFan(request.getParameter("id"));
MemberDTO dto = null;
if(dao.getMem(fdto.getNum())==null){
	dto = new MemberDTO();
	dto.setName("탈퇴한 회원");
}else{
	dto =dao.getMem(fdto.getNum());
}
String a = String.valueOf(fdto.getNum()) ;



%>
<script type="text/javascript">
function back(){
	history.back();
}
</script>
<div class="showpo">
<form id="fo" action="fan_fanMod.jsp" method="post">
<input type="hidden" name="num" value=<%=fdto.getNum() %>>
<input type="hidden" name="no" value=<%=fdto.getNo() %>>
<table class="reg">
<tr><th><input type="text" id="title" readonly name="title" value="<%=fdto.getTitle()%>"></th></tr>
<tr><th><textarea name="content" readonly id="content"><%=fdto.getContent()%></textarea></th></tr>
<tr><th><input type="text" readonly value="<%=dto.getName() %>"></th></tr>
<tr><td><input type="button" onclick="back()" value="뒤로">
<%if(a.equals(s) || s.equals("8")){ %>
<input type="submit" value="수정/삭제">
<%}else{ %>

<button disabled>수정/삭제</button>
<%} %>
</td>
</table>
</form>
</div>
</body>
</html>