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
</style>
</head>
<body>
<%@ include file="../cafe_main/cafe_header.jsp" %>
<h1 style="text-align:center;">갤러리</h1>

<table class="table" border="1">
		<tr>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			
		</tr>
		<tr>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
			<td><img src="../resource/img.jpg" width="200px" height="200px"></td>
		</tr>
		<tr>
			<td style="border:none;">
				<input type="submit" value="이미지 업로드">
				<input type="submit" value="이미지 삭제">
			</td>
		</tr>
</table>

<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>