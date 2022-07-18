<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table{margin : auto;}
.button{position: absolute; top: 50px; }
.img{width: 200px; height: 200px;}
</style>
</head>
<body>
<%@ include file="../cafe_main/cafe_header.jsp" %>
<h1 style="text-align:center;">갤러리</h1>
<form action="cafe_gallery_slidshow.jsp" method="post">
<table class="table" border="1">
	<tr>
		<td><img class="img" src="../resource/images/이미지01.jpg"></td>
		<td><img class="img" src="../resource/images/이미지02.jpg"></td>
		<td><img class="img" src="../resource/images/이미지03.jpg"></td>
		<td><img class="img" src="../resource/images/이미지04.jpg"></td>
	</tr>
	<tr>
		<td><img class="img" src="../resource/images/이미지05.jpg"></td>
		<td><img class="img" src="../resource/images/이미지06.jpg"></td>
		<td><img class="img" src="../resource/images/이미지07.jpg"></td>
		<td><img class="img" src="../resource/images/이미지08.jpg"></td>
	</tr>
	<tr>
		<th colspan="4"><input type="submit" value="슬라이드쇼"></th>
	</tr>
</table>
</form>
<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>