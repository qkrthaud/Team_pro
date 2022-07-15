<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table {margin:auto; width: 70%; height: 500px;}
.th-1{width:30%; height:10px; text-align:center;}
.th-2{width:70%; height:10px;}
.textbox1{width:90%; height:20px;}
.textbox2{width:90%; height:300px;}
</style>
</head>
<body>
<%@ include file="../cafe_main/cafe_header.jsp" %>
<form action="cafe_write_save.jsp" method="post">
<br>
<table class="table" border="1">
	<tr>
		<td class="th-1">제목</td>
		<td class="th-2"><input class="textbox1" type="text" name="title"></td>
	</tr>
	<tr>
		<td class="th-1">작성자</td>
		<td class="th-2"><input class="textbox1" type="text" name="id"></td>
	</tr>
	<tr>
		<td style="text-align:center;">내용</td>
		<td><textarea class="textbox2" name="content"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="저장">
			<input type="button" value="목록으로" onclick="location.href='cafe_community.jsp'">
		</th>
		
	</tr>
</table>
	</form>
<br>	
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>