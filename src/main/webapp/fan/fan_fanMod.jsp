<%@page import="fan_member.MemberDTO"%>
<%@page import="fan.FanDTO"%>
<%@page import="fan.FanDAO"%>
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
.fanModpo {position: absolute; top: 400px; left: 38%;}
</style>
<script type="text/javascript">
function fanMod(){
	
alert('수정페이지로 이동합니다')

title.focus()
}
</script>
</head>
<body onload="fanMod()">
<jsp:useBean id="dao" class="fan_member.MemberDAO"/>
<%@ include file="fan_header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<% String s=String.valueOf(session.getAttribute("id"));
FanDAO fdao = new FanDAO();
FanDTO fdto = fdao.getFan(request.getParameter("no"));

MemberDTO dto = null;
dto=dao.getMem(fdto.getNum());
if(dto==null){
	dto = new MemberDTO();
	dto.setName("탈퇴한 회원");
}else{
	dto = dao.getMem(fdto.getNum());
}

%>
<div class="fanModpo">
<form id="fo" action="fan_fanMod2.jsp" method="post">

<input type="hidden" name="no" value=<%=fdto.getNo() %>>
<table class="reg">
<tr><th><input type="text" id="title" name="title" value="<%=fdto.getTitle()%>"></th></tr>
<tr><th><textarea name="content" id="content"><%=fdto.getContent()%></textarea></th></tr>
<tr><th><input type="text" readonly value=<%=dto.getName() %>></th></tr>
<tr><td><input type="button" onclick="location.href='fan_fan.jsp'" value="취소">

<input type="button" value="삭제" onclick="location.href='fan_fanDelete.jsp?no=<%=fdto.getNo() %>'">
<input type="submit" value="수정">


</td>
</table>
</form>
</div>
</body>
</html>