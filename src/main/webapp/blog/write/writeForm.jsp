<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<form action="#" method="POST">

		<div class="form-group">
			<select name="tNum" style="width: 100%; height: 100%">
				<option value="1">1번째 메뉴</option>
				<option value="2">2번째 메뉴</option>
			</select> <label for="title">Title:</label> <input type="text"
				class="form-control" placeholder="title" id="title"
				name="contenttitle">
		</div>

		<div class="form-group">
			<label for="content">Content:</label>
			<textarea id="summernote" class="form-control" rows="5" id="content"
				name="contentmain"></textarea>
		</div>

		<button type="submit" class="btn btn-primary"
			onclick="location.href='write.jsp'">글쓰기 등록</button>
	</form>
</div>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : '글을 쓰세요.',
			tabsize : 2,
			height : 400
		});
	});
</script>

<%@ include file="../layout/footer.jsp"%>