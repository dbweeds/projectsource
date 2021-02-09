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
		<h2 style="margin: 20px">게시글 비밀번호 확인</h2>
		<hr>
		<form name="form" id="form" role="form" method="post"
			action="/comunity/password">
			<div class="mb-3 main">
				<label for="password">비밀번호 확인</label>
				<input type="password"
					class="form-control" name="password" id="password">
					<i id="eyes" class="fa fa-eye fa-lg"></i>
					<div class="inputInfo">게시글 작성때 입력하신 비밀번호를 입력해주세요.</div>
			</div>
			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${bno}"/>' readonly="readonly">
			</div>
			<div class="button">
				<button type="submit" class="btn btn-primary">확인</button>
				<button type="button" data-oper='QAList' class="btn btn-light">취소</button>
			</div>
		</form>

		<div></div>
	</div>
</article>
<%@include file="../includes/footer.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/messages_ko.min.js"></script>
<script src="/resources/js/additional-methods.js"></script>
<script src="/resources/js/registerValidate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form");

	$('button').on(
			"click",
			function(e) {

				e.preventDefault();

				var operation = $(this).data("oper");

				console.log(operation);
/* 
				if (operation === 'QAGet') {
					formObj
							.attr("action",
									"/comunity/QAGet");
 */
				if (operation === 'QAList') {
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