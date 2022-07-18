<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<style>
#image{  display:flex; width:500px; height:500px;  z-index:0; margin: auto;}
#pic{   width:400px;  height:400px; padding-top:50px;  z-index:-1; }
#pic01{   position:relative; top:35%; width:100px;  height:100px;  }
#pic02{  position:relative; top:35%; width:100px;  height:100px;  }
</style>
<script>
var list=["이미지01","이미지02","이미지03","이미지04",
		"이미지05","이미지06","이미지07","이미지08"];
var x = 0;

function prev(){
	if(x == 0)  x = list.length-1;
	else   x = x-1;
	document.getElementById("pic").src="../resource/images/"+list[x]+".jpg";
}
function next(){
	if(x == list.length-1)  x = 0;
	else  x = x+1;
	document.getElementById("pic").src="../resource/images/"+list[x]+".jpg";
}
var stopVal;
var bool = true
function auto(){
	if(x == list.length-1)  x = 0;
	else  x = x+1;
	if(bool){
		document.getElementById("pic").src="../resource/images/"+list[x]+".jpg";
	}else{
		bool = !bool
		x--;
	}
	stopval = setTimeout("auto()",1000)
}
function stop(){  clearTimeout(stopval); bool = false  }
</script>
</head>
<body onload="auto()">
<%@ include file="../cafe_main/cafe_header.jsp" %>
	<div id="image" onmouseover="stop()" onmouseout="auto()">
		<img id="pic01" src="../resource/images/왼쪽화살표.jpg" onClick="prev()"/>
		<img id="pic" src="../resource/images/이미지01.jpg"/>
		<img id="pic02" src="../resource/images/오른쪽화살표.jpg" onClick="next()"/>
	</div>
	<%@ include file="../cafe_main/cafe_footer.jsp" %>
</body>
</html>