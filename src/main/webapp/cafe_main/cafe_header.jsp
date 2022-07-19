<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.header{width: 100%; height: 100px;
		background-color: white; text-align: center;}
nav { background-color: #6495ED; margin: auto; width:100%;}
	nav ul {display:flex; justify-content: flex-start;
			list-style: none;}
	nav ul li { padding: 10px; margin: 0 3px;}
	nav ul li a { text-decoration: none; color: white; }
</style>
</head>
<body>
<header class="header">
<h1>java 프로그래밍 카페</h1>
	<nav>
		<ul>
			<li><a href=../cafe_main/cafe_main.jsp>카페메인</a>
			<li><a href="../cafe_community/cafe_community.jsp">자유 게시판</a></li>
			<li><a href="../cafe_gallery/cafe_gallery.jsp">갤러리</a></li>
			<li><a href="../cafe_Q&A/cafe_Q&A.jsp">Q&A</a></li>
			<li><a href="../fan/fan_main.jsp">홈으로</a></li><!--메인 페이지 -->
		</ul>
	</nav>
</header>
</body>
</html>