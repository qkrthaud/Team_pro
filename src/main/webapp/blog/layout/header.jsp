<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>BLOG</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">
footer {
	position: fixed;
	left: 0px;
	bottom: 0px;
	height: 60px;
	width: 100%;
	background: grey;
	color: white;
}
</style>
</head>
<body>
	<jsp:useBean id="dao" class="member.MemberDAO" />
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty name = "dto" property = "name" value = "${msg}"/>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<c:choose>
			<c:when test="${login != null }">
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/blog/blogForm.jsp">${msg }'s
					Blog</a>
			</c:when>
			<c:otherwise>
				<a class="navbar-brand"
					href="<%=request.getContextPath()%>/blog/blogForm.jsp">Blog</a>
			</c:otherwise>
		</c:choose>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<c:choose>
				<c:when test="${login != null }">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/blog/login/logout.jsp">로그아웃</a>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/blog/board/mainView.jsp">전체보기</a>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/blog/board/firstView.jsp">1번째
								메뉴</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/blog/board/secondView.jsp">2번째
								메뉴</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/blog/login/loginForm.jsp">로그인</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<br>