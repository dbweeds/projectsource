<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/subHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/QARegister.css">
<!-- /.row -->

<article>
	<div class="container" role="main">
		<h2 style="margin: 20px">공지사항 수정</h2>
		<hr>
		<form name="form" id="form" role="form" method="post"
			action="/comunity/noticeModify">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title" value='<c:out value="${notice.title }"/>'>
				<div class="inputInfo">수정하실 공지사항의 제목을 입력해주세요</div>
			</div>
			<div class="mb-3">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" name="writer" id="writer" value='<c:out value="${notice.writer}"/>'>
				<div class="inputInfo">수정하실 공지사항의 작성자를 입력해주세요</div>
			</div>

			<!-- <div class="mb-3 main">
				<label for="password">공지사항 비밀번호</label> <input type="password"
					class="form-control" name="password" id="password"> <i
					id="eyes" class="fa fa-eye fa-lg"></i>
				<div class="inputInfo">공지사항 조회, 수정, 삭제를 하실 때 필요한 비밀번호를 입력해주세요</div>
			</div> -->

			<div class="mb-3">
				<label for="content">내용</label>
				<div class="inputInfo">수정하실 공지 내용을 입력해주세요</div>
				<textarea class="form-control" rows="9" name="content" id="content"><c:out
									value="${notice.content}" /></textarea>
			</div>
			<button type="submit" data-oper='noticeModify' class="btn btn-default">수정하기</button>
			<button type="submit" data-oper='noticeRemove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='noticeList' class="btn btn-info">목록보기</button>
			
			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${notice.bno }"/>' readonly="readonly">
			</div>
		</form>

		<div></div>
	</div>
</article>
<script type="text/javascript">
	$(document).ready(
			function() {

				var formObj = $("form");

				$('button').on(
						"click",
						function(e) {


							var operation = $(this).data("oper");

							console.log(operation);

							if (operation === 'noticeRemove') {
								formObj
										.attr("action",
												"/comunity/noticeRemove");

							} else if (operation === 'noticeList') {
								//move to list
								formObj.attr("action", "/comunity/noticeList")
										.attr("method", "get");
								formObj.empty();
							}

							formObj.submit();
						});

			});
</script>
<%@include file="../includes/footer.jsp"%>