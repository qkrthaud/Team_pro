<%@page import="lucky.LuckyDTO"%>
<%@page import="lucky.LuckyDAO"%>
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
.lucpo {position: absolute; top:400px; left:35%;}
.luc {width:700px; border:1px solid black; background-color: rgb(204,255,255);}
.lucname { text-shadow: 4px 4px 4px;}
textarea {
    width: 90%;
    height: 400px;
    border: none;
    resize: none;
    
  }
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

<% 
MemberDAO mdao = new MemberDAO();
String num = String.valueOf(session.getAttribute("id"));
MemberDTO mdto = null;
mdto=mdao.getMem2(num);
LuckyDAO dao=new LuckyDAO();
int rantop = dao.getRantop();

//int ran = (int)(Math.random()*rantop+1);
int ran=1234;
LuckyDTO dto = dao.getLuck(ran);
%>
<div class="lucpo">
<form action="fan_addLuc2.jsp" method="post">
<table class="luc">
<tr>
<th class="lucname"><h1>님의 오늘의 운세</h1></th>
</tr>
<tr>
<th class="luctitle">
<input type="text" name="title"></th>
</tr>
<tr>
<th class="lucon"><textarea name="content"></textarea></th>
</tr>
<tr><td><h1>운세 한줄 평</h1></td></tr>
<tr><th class="lucend">
<input type="text" name="end"></th></tr>
<tr><td>
<input type="submit" value="운세등록" >
</td></tr>
</table>
</form>
</div>
</body>
</html>