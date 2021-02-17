<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 가격 단위 ,, -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<style>
.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}
</style>
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules" style="background-image: url(/resources/assets/custom/images/EVcar_header_03.png)">
	<div class="container">
		<h2
			class="fables-page-title fables-second-border-color wow fadeInLeft"
			data-wow-duration="1.5s" style="margin-top: 90px">전기차</h2>
	</div>
</div>
<!-- /End Header -->

<!-- 상단 네비게이션 -->
<div class="fables-light-background-color">
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="fables-breadcrumb breadcrumb px-0 py-3">
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">전기차</li>
				<li class="breadcrumb-item active" aria-current="page">등록페이지</li>

			</ol>
		</nav>
	</div>
</div>
<!-- /네비 -->

<!-- 매인컨텐츠 컨테이너 -->
<div class="container">
	<div class="container mt-4 mt-lg-5">
		<div
			class="owl-carousel owl-theme default-carousel default-carousel-nav">
			<div>
				<a href="#"><img
					src="/resources/assets/custom/infoimage/carsampletest.jpg" alt=""
					class="w-50" /></a>
			</div>
		</div>
	</div>
	<span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file1">썸네일</label> <input
		type="file" id="input-file1" data-value="thumbnail"
		style="display: none;" />
		<div></div>
	</span> <span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file2">차사진1</label> <input
		type="file" id="input-file2" data-value="carpicture1"
		style="display: none;" />
		<div></div>
	</span> <span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file3">차사진2</label> <input
		type="file" id="input-file3" data-value="carpicture2"
		style="display: none;" />
		<div></div>
	</span> <span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file4">차사진3</label> <input
		type="file" id="input-file4" data-value="carpicture3"
		style="display: none;" />
		<div></div>
	</span>
	<form action="" method="post" id="form" role="form">
		<div class="row mb-4 my-lg-5">
			<div class="col-12 col-md-8">
				<h2 class="mb-3">
					<!-- 차량 이름 -->
					<input type="text"
						class="fables-main-text-color fables-second-hover-color font-20 semi-font form-control"
						id="exampleFormControlInput1" name="carname" placeholder="모델명 한글">

					<input type="text"
						class="fables-main-text-color fables-second-hover-color font-15 semi-font form-control"
						id="exampleFormControlInput1" name="carname_en"
						placeholder="모델명 영문">
				</h2>
				<p class="fables-fifth-text-color font-14">
					<!-- 차량 타이틀 -->
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력해주세요"> <br />
					<!-- 차량 타이틀 -->
					<textarea class="form-control" id="content" name="content"
						rows="20" placeholder="내용을 입력해주세요"></textarea>
				</p>
				<!-- 이전 모델 / 다음 모델 연결 -->

			</div>
			<!-- 차량 제원 -->
			<div class="col-12 col-md-4 col-lg-3 offset-lg-1 mt-md-5 mt-lg-0">
                <div class="form-floating mb-3">
                     <select id="brand" name="brand" class="form-select" aria-label="Floating label select example">
                           <option selected>선택해주세요.</option>
                           <option value="현대" <c:out value="${info.brand=='현대'?'selected':''}"/>>현대</option>
                           <option value="기아" <c:out value="${info.brand=='기아'?'selected':''}"/>>기아</option>
                           <option value="쉐보레" <c:out value="${info.brand=='쉐보레'?'selected':''}"/>>쉐보레</option>
                           <option value="쌍용" <c:out value="${info.brand=='쌍용'?'selected':''}"/>>쌍용</option>
                           <option value="르노삼성" <c:out value="${info.brand=='르노삼성'?'selected':''}"/>>르노삼성</option>
                           <option value="테슬라" <c:out value="${info.brand=='테슬라'?'selected':''}"/>>테슬라</option>
                           <option value="BMW" <c:out value="${info.brand=='BMW'?'selected':''}"/>>BMW</option>
                           <option value="벤츠" <c:out value="${info.brand=='벤츠'?'selected':''}"/>>벤츠</option>
                           <option value="아우디" <c:out value="${info.brand=='아우디'?'selected':''}"/>>아우디</option>
                           <option value="시트로엥" <c:out value="${info.brand=='시트로엥'?'selected':''}"/>>시트로엥</option>
                           <option value="푸조" <c:out value="${info.brand=='푸조'?'selected':''}"/>>푸조</option>
                       </select>
                     <label for="floatingSelect">제조사</label>
                  </div>
                
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="releasedate"
                        name="releasedate">
                    <label for="floatingSelect">출시일</label>
                </div>
                <div class="form-floating mb-3">
                         <select id="cartype" name="cartype" class="form-select form-select-sm" aria-label=".form-select-sm example">
                           <option selected>선택해주세요</option>
                           <option value="경차">경차</option>
                           <option value="소형차">소형차</option>
                           <option value="중형차">중형차</option>
                           <option value="대형차">대형차</option>
                           <option value="SUV">SUV</option>
                         </select>
                         <label for="floatingSelect">차종</label>
                   </div> 
                    <div class="form-floating mb-3">
                     <input class="form-control" type="number" name="fuel" id="fuel"/>
                     <label for="floatingInput">연비</label>
                   </div>
                     <div class="form-floating mb-3">
                     <input class="form-control" type="number" name="mileage" id="mileage"/>
                     <label for="floatingInput">주행거리</label>
                   </div>

                     <div class="form-floating mb-3">
                         <select id="chargetype" name="chargetype" class="form-select" id="floatingSelect" aria-label="Floating label select example" >
                           <option selected>선택해주세요</option>
                            <option value="DC콤보" >DC콤보</option>
                            <option value="AC3상">AC3상</option>
                        </select>
                        <label for="floatingSelect">충전방식</label>
                    </div>
                    <div class="form-floating mb-3">
                     <input class="form-control" type="number" name="rowprice" id="rowprice" />
                     <label for="floatingInput">최저가격</label>
                   </div>
                   
                 <div class="form-floating mb-3">
                     <input class="form-control" type="number" name="highprice" id="highprice" />
                     <label for="floatingInput">최고가격</label>
                   </div>
                   
                 <div class="form-floating mb-3">
                     <input class="form-control" type="number" name="support" id="support" />
                     <label for="floatingInput">정부보조금</label>
                   </div>
					<div id="thumbnail"></div>
					<div id="carpicture1"></div>
					<div id="carpicture2"></div>
					<div id="carpicture3"></div>
				</div>
			</div>
			<!-- /차량 제원 -->
		<div class="container"><!-- 리뷰 -->
            <div class="truncated-text size-16 font-weight-normal row">
                <div class="col-12">
                    <input type="text" class="form-control" id="reviewtitle1" name="reviewtitle1" placeholder="리뷰1 제목을 입력해주세요">
                </div>
                <div class="col-12">
                    <textarea class="form-control" id="review1" name="review1"
                        rows="20"placeholder="리뷰1 내용을 입력해주세요"  style="height: 300px;margin-top: 5px"></textarea>
                </div>
            </div>
             <br>
        </div>
    <hr class="my-0 mx-0_5">
    <div class="container" style="display: flex;">
        <div id="youtube" style="border: 1ps solid gold; padding: 10px;display: inline-block;">
        <div style="width:200px; height:100px ;background-color: gray;"></div>
        </div>
        <div class="col-12" style="display: inline-block;width: 300px;margin-top: 30px;">
            <input type="text" class="form-control" id="youtubeurl" name="youtubeurl" placeholder="유튜브 url을 입력해주세요" style="width:300px;">
            <button type="button" class="btn btn-light" id="change">url 확인해보기</button>
        </div>
    </div>
    <hr class="my-0 mx-0_5">
        <div class="fables-single-blog-pag my-4 text-center text-md-left">
            <button type="submit" class="btn btn-primary">작성</button>
            <button type="button" class="btn btn-light"
                onclick="location.href='list'">목록</button>
        </div>
	</form>
</div>

<!-- /자동차 설명 -->


<!-- /컨테이너 -->
<!-- /End page content -->


<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/messages_ko.min.js"></script>
<script src="/resources/js/additional-methods.js"></script>
<script src="/resources/js/infoValidate.js"></script>
<script type="text/javascript">
var form = $("#form");
$("button[type='submit']").click(function (e) {
	e.preventDefault();	
	if($('#input-file1').val() == "") {
	    alert("썸네일을 필수로 넣어주세요");
	    $("#input-file1").focus();
	    return false;
	}
	if($('#input-file2').val() == "") {
	    alert("차사진1을 필수로 넣어주세요.");
	    $("#isFile").focus();
	    return false;
	}
	form.submit();
})

$("#change").click(function() {
	var url = $("#youtubeurl").val();
	$("#youtube").empty();
	$("#youtube").append('<iframe width="200px" height="100px"src="'+url+'" frameborder="0"allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"allowfullscreen></iframe>');
});
$("input[type='file']").change(function() {
	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	var tagid = $(this).attr("id");
	var valtype=$(this).data("value");
	var files = $(this)[0].files;
	
	if(!$(this).val().match(fileForm)){
		alert("이미지파일만 업로드 가능합니다.");
        $(this).focus();
        return false;
	}
	
	var formData = new FormData();
	formData.append("uploadFile", files[0]);
	$.ajax({
		url: '../uploadAjax',
		type: 'post',
		processData: false,//데이터를 query string 형태로 보낼것인지 결정(기본값은 application/x-www-form-urlencoded임)
		contentType: false,//기본값은 application/x-www-form-urlencoded임(파일첨부임으로 multipart/form-data로 보내야 함)
		data: formData,
		dataType: "text",
		success: function(result) {
			$("#"+tagid).siblings("div").empty();
			$("#"+tagid).siblings("div").append("<small class='text-info'>"+result+"</small>");
			$("#"+valtype).empty();
			$("#"+valtype).append("<input type='hidden' name='"+valtype+"' value='"+result+"'>");
		},
		error: function(xhr, statues, error) {
			$("#"+tagid).siblings("div").empty();
			$("#"+tagid).siblings("div").append("파일을 업로드하지 못했습니다.");
		}
	})
})
</script>
