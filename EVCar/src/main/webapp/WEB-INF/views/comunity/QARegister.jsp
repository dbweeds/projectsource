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
		<h2 style="margin: 20px">문의글 작성</h2>
		<hr>
		<form name="form" id="form" role="form" method="post"
			action="/comunity/QARegister">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title">
					<div class="inputInfo">문의글의 제목을 입력해주세요</div>
			</div>
			<div class="mb-3">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" name="writer" id="writer">
					<div class="inputInfo">문의글의 작성자를 입력해주세요</div>
			</div>

			<div class="mb-3 main">
				<label for="password">문의글 비밀번호</label>
				<input type="password"
					class="form-control" name="password" id="password">
					<i id="eyes" class="fa fa-eye fa-lg"></i>
					<div class="inputInfo">문의글 조회, 수정, 삭제를 하실 때 필요한 비밀번호를 입력해주세요</div>
			</div>

			<div class="mb-3">
				<label for="content">내용</label>
				<div class="inputInfo">문의하실 내용을 입력해주세요</div>
				<textarea class="form-control" rows="9" name="content" id="content"></textarea>
			</div>
			<div class="button">
				<button type="submit" data-oper='QARegister' class="btn btn-primary">작성</button>
				<button type="submit"  data-oper='QAList'class="btn btn-light">공지사항 목록</button>
			</div>
		</form>

		<div></div>
	</div>
</article>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form");

	$('button').on(
			"click",
			function(e) {

				e.preventDefault();

				var operation = $(this).data("oper");

				console.log(operation);

				if (operation === 'QARegister') {
					formObj
							.attr("action",
									"/comunity/QARegister");

				} else if (operation === 'QAList') {
					//move to list
					formObj.attr("action", "/comunity/QAList")
							.attr("method", "get");
					formObj.empty();
				}

				formObj.submit();
			});
    $('.main i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });
});

</script>
<%@include file="../includes/footer.jsp"%>