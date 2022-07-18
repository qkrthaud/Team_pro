<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {margin:0;}
header {margin:0 auto; width:100%; background-color: rgb(255,255,51); padding-top:5px; padding-bottom: 5px;}
.header {margin:0 auto;}
.header th {width:200px; height:70px;}
.img {width:140px; height:70px;vertical-align: middle;}

.lb-wrap {position: relative;}
.lb-text {position: absolute;pointer-events:none;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);}
  .lb_text h2 {pointer-events:none;}
a:active img {
  width:126px; height:63px;
}
font {text-align: center; text-shadow: 3px; margin:auto;}
.headtitle {text-align: center; background-color: black; padding-top: 50px; text-shadow: 10px 10px 10px white;
font-size: 100px; color:white;
padding-bottom: 50px;
}
.headtag {text-shadow: 10px 10px 10px white;font-size: 20px; color:white; text-align: right; background-color: black; padding-right: 15px;}
.mainMain .mainimg {width:100%; height:100%;}


.mainlog {margin:auto; position: fixed; right:50px; top:350px;}

.ma-wrap img {width:130px; height:130px;vertical-align: middle;}

.ma-wrap {position: relative;}
.ma-text {position: absolute;pointer-events:none;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);}
  .lb_text h2 {pointer-events:none;}
.ma-wrap a:active img {
  width:117px; height:117px;
}
</style>


</head>
<body>
<div class="headtitle">
3조 팀 프로젝트
</div>
<div class="headtag">
제작자 : 박소명, 김종민, 김정호
</div>
<header>
<table class="header">
<tr>
<th>
<div class="lb-wrap">
  <div class="lb-text">
   <h2>Main</h2>
  </div>
  <div class="lb-image">
   <a href="fan_main.jsp"> <img id="main" class="img" src="pngwing.com.png"></a>
  </div>
</div>
</th>
<th>
<div class="lb-wrap">
  <div class="lb-text">
    <h2>종민</h2>
  </div>
  <div class="lb-image">
   <a href=""> <img id="main" class="img" src="pngwing.com.png"></a>
  </div>
</div>
</th>
<th>
<div class="lb-wrap">
  <div class="lb-text">
    <h2>Cafe</h2>
  </div>
  <div class="lb-image">
   <a href=""> <img id="main" class="img" src="pngwing.com.png"></a>
  </div>
</div>
</th>
<th>
<div class="lb-wrap">
  <div class="lb-text">
    <h2>Mail</h2>
  </div>
  <div class="lb-image">
   <a href=""> <img id="main" class="img" src="pngwing.com.png"></a>
  </div>
</div>
</th>
<th>
<div class="lb-wrap">
  <div class="lb-text">
    <h2>Board</h2>
  </div>
  <div class="lb-image">
   <a href="fan_fan.jsp"> <img id="main" class="img" src="pngwing.com.png"></a>
  </div>
</div>
</th>
<th>
<div class="lb-wrap">
  <div class="lb-text">
    <h2>Lucky</h2>
  </div>
  <div class="lb-image">
   <a href="fan_lucky.jsp"> <img id="main" class="img" src="pngwing.com.png"></a>
  </div>
</div>
</th>
</tr>
</table>
</header>
<div class="mainMain">
<img class="mainimg" src="test1.jpg">
<div class="mainlog">

<div class="ma-wrap">
  <div class="ma-text">
   <h4>Main</h4>
  </div>
  <div class="ma-image">
   <a href="fan_main.jsp"> <img id="main" class="img" src="gold.png"  ></a>
  </div>
</div>
<%
if(session.getAttribute("id")==null){ %>
	
	<div class="ma-wrap">
  <div class="ma-text">
   <h4>로그인</h4>
  </div>
  <div class="ma-image">
   <a href="fan_index.jsp"> <img id="main" class="img" src="gold.png"  ></a>
  </div>
</div>
<div class="ma-wrap">
  <div class="ma-text">
   <h4>회원가입</h4>
  </div>
  <div class="ma-image">
   <a href="fan_add.jsp"> <img id="main" class="img" src="gold.png"  ></a>
  </div>
</div>

<% }else{
%>
	<div class="ma-wrap">
  <div class="ma-text">
   <h4>로그아웃</h4>
  </div>
  <div class="ma-image">
   <a href="fan_logout.jsp"> <img id="main" class="img" src="gold.png"  ></a>
  </div>
</div>
<div class="ma-wrap">
  <div class="ma-text">
   <h4>회원수정</h4>
  </div>
  <div class="ma-image">
   <a href="fan_modify.jsp"> <img id="main" class="img" src="gold.png"  ></a>
  </div>
</div>

<%} %>

</div>
</div>
<script type="text/javascript">
function back(){
	history.back();
}
</script>
</body>
</html>