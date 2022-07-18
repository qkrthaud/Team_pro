<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script type="text/javascript">
	function check(f) {
		if (f.id.value == "") {
			alert("아이디를 입력하십시오!");
			f.id.focus();
		} else if (f.pwd.value == "") {
			alert("비밀번호를 입력하십시오!");
			f.pwd.focus();
		} else {
			f.submit();
		}
	}
</script>
로그인폼
<div class="container">
	<form action="login.jsp" method="post" name="blogLogin">
		<div class="form-group">
			<label for="usr">아이디:</label> <input type="text" class="form-control"
				id="id" name="id">
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호:</label> <input type="password"
				class="form-control" id="pwd" name="pwd">
		</div>
		<button type="button" class="btn btn-primary"
			onclick="javascript:check(blogLogin)">로그인</button>
	</form>
</div>
<%@ include file="../layout/footer.jsp"%>