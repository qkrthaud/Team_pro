<%@page import="java.io.Console"%>
<%@page import="lucky.LuckyDTO"%>
<%@page import="lucky.LuckyDAO"%>
<%@page import="fan_member.MemberDAO"%>
<%@page import="fan_member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  .lucend {color:red;}
  .lucname{color: rgb(0,0,153);}
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
MemberDTO mdto = new MemberDTO();

if(mdao.getMem2(num)==null){
	mdto.setName("무명");
}else{
	mdto=mdao.getMem2(num);
}
LuckyDAO dao=new LuckyDAO();
int rantop = dao.getRantop();
int ran = (int)(Math.random()*(rantop-1)+1);

//int ran=12345;

LuckyDTO dto = dao.getLuck(ran);
if(dto==null){
	dto = new LuckyDTO();
	dto.setContent("왜냐하면 이건 간혹 데이터베이스 연결이 안되서 오류났을 때 나오는 운세입니다.");
	dto.setEnd("0.05%로 나온 불운 ㅠㅠ");
	dto.setTitle("오늘은 뭔가 안되시려나 봅니다.");
}
%>

<div class="lucpo">

<table class="luc">
<tr>
<th><h1 class="lucname"><%= mdto.getName()%>님의 오늘의 운세</h1></th>
</tr>
<tr>
<th class="luctitle"><h1><%=dto.getTitle() %></h1></th>
</tr>
<tr>
<th class="lucon"><textarea readonly ><%= dto.getContent()%></textarea></th>
</tr>
<tr><td><h1>운세 한줄 평</h1></td></tr>
<tr><th ><h2 class="lucend"><%=dto.getEnd() %></h2></th></tr>
<c:set var="sesid" value="<%=num %>"></c:set>
<c:choose>
<c:when test="${sesid=='8' }">
<tr>
<td>
<input type="button" value="운세등록" onclick="location.href='fan_addLuc.jsp'">
</td>
</tr>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose>
</table>
</div>
</body>
</html>