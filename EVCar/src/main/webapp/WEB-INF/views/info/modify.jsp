<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 가격 단위 ,, -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules">
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
				<li class="breadcrumb-item active" aria-current="page">
					${info.brand}</li>
				<li class="breadcrumb-item active" aria-current="page">
					${info.carname} (${info.carname_en})<input type="hidden" name="bno"
					value="${info.bno}">
				</li>
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
		<label class="input-file-button" for="input-file1">썹네일</label> <input
		type="file" id="input-file1" data-value="thumbnail"
		style="display: none;" />
		<div><small class='text-info'>${info.thumbnail}</small></div>
	</span> <span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file2">차사진1</label> <input
		type="file" id="input-file2" data-value="carpicture1"
		style="display: none;" />
		<div><small class='text-info'>${info.carpicture1}</small></div>
	</span> <span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file3">차사진2</label> <input
		type="file" id="input-file3" data-value="carpicture2"
		style="display: none;" />
		<div><small class='text-info'>${info.carpicture2}</small></div>
	</span> <span style="width: 200px; display: inline-block;margin=10px 0 10x 0;">
		<label class="input-file-button" for="input-file4">차사진3</label> <input
		type="file" id="input-file4" data-value="carpicture3"
		style="display: none;" />
		<div><small class='text-info'>${info.carpicture3}</small></div>
	</span>

	<form action="" role="form" method="post">
		<div class="row mb-4 my-lg-5">
			<div class="col-12 col-md-8">
				<h2 class="mb-3">
					<!-- 차량 이름 -->
					<input type="text"
						class="fables-main-text-color fables-second-hover-color font-20 semi-font form-control"
						id="exampleFormControlInput1" name="carname" value="${info.carname}">
					
					<input type="text"
						class="fables-main-text-color fables-second-hover-color font-15 semi-font form-control"
						id="exampleFormControlInput1" name="carname_en"
						value="${info.carname_en}">
					
				</h2>
				<p class="fables-fifth-text-color font-14">
					<!-- 차량 타이틀 -->
					<input type="text" class="form-control" id="title" name="title"
						value="${info.title}"> <br />
					<!-- 차량 타이틀 -->
					<textarea class="form-control" id="content" name="content"
						rows="20">${info.content}</textarea>
				</p>
				<!-- 이전 모델 / 다음 모델 연결 -->

			</div>
			<!-- 차량 제원 -->
			<div class="col-12 col-md-4 col-lg-3 offset-lg-1 mt-md-5 mt-lg-0">
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">브랜드 </span>
					<input type="text" class="form-control"
						id="exampleFormControlInput1" name="brand"
						value="${info.brand}">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">출시일 </span>
					<input type="number" class="form-control" id="releasedate"
						name="releasedate" value="${info.releasedate}">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">차종 </span>
					<input
						type="text" class="form-control" id="cartype" name="cartype"
						value="${info.cartype}">
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">연비</span> 
						<input
							type="number" max="100" min="0" step="0.1" class="form-control"
							id="fuel" name="fuel" value="${info.fuel}">
					</div>
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">주행거리</span> 
						<input type="number" class="form-control" id="mileage"
							name="mileage" value="${info.mileage}">
					</div>
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">충전방식</span>
						<select id="chargetype" name="chargetype">
							<option value="DC콤보" <c:out value="${info.chargetype=='DC콤보'?'selected':''}"/>>DC콤보</option>
							<option value="AC3상" <c:out value="${info.chargetype=='AC3상'?'selected':''}"/>>AC3상</option>
						</select>
						
					</div>
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">최저가</span>
						<input type="number" class="form-control" id="rowprice"
							name="rowprice" value="${info.rowprice}">
					</div>
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">최고가</span>
						<input type="number" class="form-control" id="highprice"
							name="highprice" value="${info.highprice}">
					</div>

					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">보조금</span>
						<input type="number" class="form-control" id="support"
							name="support" placeholder="정부 보조금" value="${info.support}">
					</div>
					<div id="thumbnail"><input type="hidden" name="thumbnail" value="${info.thumbnail}"></div>
					<div id="carpicture1"><input type="hidden" name="thumbnail" value="${info.carpicture1}"></div>
					<div id="carpicture2"><input type="hidden" name="thumbnail" value="${info.carpicture2}"></div>
					<div id="carpicture3"><input type="hidden" name="thumbnail" value="${info.carpicture3}"></div>
				</div>
			</div>
			<!-- /차량 제원 -->
		</div>
		<div class="fables-single-blog-pag my-4 text-center text-md-left">
			<button type="submit" data-oper='modify' class="btn btn-primary">수정</button>
			<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='list' class="btn btn-light"
				onclick="location.href='list'">목록</button>
		</div>
	</form>
	<!-- 민지님 부분 -->
	<span> 민지님 리뷰들어가야 하는 부분입니다. </span>

	<!-- / -->

</div>
<!-- /컨테이너 -->
<!-- /End page content -->

<!-- 수정버튼을 보내면 보낼 폼 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<form action="" id="myform" method="post">
	<input type="hidden" name="bno" value="${info.bno}" />
</form>
<script>
$("input[type='file']").change(function() {
	var tagid = $(this).attr("id");
	console.log(tagid);
	var files = $(this)[0].files;
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
			console.log(result);
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
	$(function() {
		var form = $("#myform");
		
		$("button").click(function(e) {
			e.preventDefault();
			
			var oper = $(this).data("oper");
			console.log(oper);
			
			if(oper == 'remove'){
				form.attr("action","remove");
			}else if(oper == 'modify'){
				form = $("form[role='form']");
			}else if(oper == 'list'){
				form.attr("action","list")
				.attr("method","get");
				form.find("input[name='bno']").remove();
			}
			form.submit();
			
		})
	})
</script>
<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
