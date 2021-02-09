<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- CSS only -->

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/subHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/QARegister.css">
<!-- /.row -->

<article>
	<div class="container formData" role="main">
		<h2 style="margin: 20px">문의글 수정</h2>
		<hr>
		<form name="form" id="form" role="form" method="post"
			action="/comunity/QAModify">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title" value='<c:out value="${QA.title }"/>'>
				<div class="inputInfo">수정하실 문의글의 제목을 입력해주세요</div>
			</div>
			<div class="mb-3">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" name="writer" id="writer" value='<c:out value="${QA.writer}"/>'>
				<div class="inputInfo">수정하실 문의글의 작성자를 입력해주세요</div>
			</div>

			<!-- <div class="mb-3 main">
				<label for="password">문의글 비밀번호</label> <input type="password"
					class="form-control" name="password" id="password"> <i
					id="eyes" class="fa fa-eye fa-lg"></i>
				<div class="inputInfo">문의글 조회, 수정, 삭제를 하실 때 필요한 비밀번호를 입력해주세요</div>
			</div> -->

			<div class="mb-3">
				<label for="content">내용</label>
				<div class="inputInfo">수정하실 문의하실 내용을 입력해주세요</div>
				<textarea class="form-control" rows="9" name="content" id="content"><c:out
									value="${QA.content}" /></textarea>
			</div>
			<button type="submit" data-oper='QAModify' class="btn btn-default">수정</button>
			<button type="submit" data-oper='QARemove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='QAList' class="btn btn-info">목록</button>
			
			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${QA.bno }"/>' readonly="readonly">
			</div>
		</form>

		<div></div>
	</div>
</article>
<%@include file="../includes/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/messages_ko.min.js"></script>
<script src="/resources/js/additional-methods.js"></script>
<script src="/resources/js/registerValidate.js"></script>
<script type="text/javascript">
<script type="text/javascript">
	$(document).ready(
			function() {

				var formObj = $("form");

				$('button').on(
						"click",
						function(e) {

							e.preventDefault();

							var operation = $(this).data("oper");

							console.log(operation);

							if (operation === 'QARemove') {
								formObj
										.attr("action",
												"/comunity/QARemove");

							} else if (operation === 'QAList') {
								//move to list
								formObj.attr("action", "/comunity/QAList")
										.attr("method", "get");
								formObj.empty();
							}

							formObj.submit();
						});

			});
</script>