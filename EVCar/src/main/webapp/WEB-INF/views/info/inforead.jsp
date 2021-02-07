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
					${info.carname} (${info.carname_en})</li>
			</ol>
		</nav>
	</div>
</div>
<!-- /네비 -->

<!-- 매인컨텐츠 컨테이너 -->
<div class="container">
	<form action="" role="form">
		<input type="hidden" name="bno" value="${info.bno}" />
		<!-- <div class="container mt-4 mt-lg-5"> -->
			<div
				class="owl-carousel owl-theme default-carousel default-carousel-nav">
				<div>
					<a href="#"><img
						src="/resources/assets/custom/infoimage/${info.carname}-1.png"
						alt="" class="w-100" /></a>
				</div>
				<div>
					<a href="#"><img
						src="/resources/assets/custom/infoimage/${info.carname}-2.png"
						alt="" class="w-100" /></a>
				</div>
				<div>
					<a href="#"><img
						src="/resources/assets/custom/infoimage/${info.carname}-3.png"
						alt="" class="w-100" /></a>
				</div>
			</div>
			<div class="row mb-4 my-lg-5 form-group">
				<div class="col-12 col-md-8">
					<h2 class="mb-3">
						<!-- 차량 이름 -->
						<a href="#"
							class="fables-main-text-color fables-second-hover-color font-26 semi-font">${info.carname}
							(${info.carname_en})</a>
					</h2>
					<p class="fables-fifth-text-color font-14">
						<!-- 차량 타이틀 -->
					<h5>${info.title}</h5>
					<br />
					<br />
					<!-- 차량 내용 -->
					${info.content}
					</p>
					<!-- 이전 모델 / 다음 모델 연결 -->
					<div class="fables-single-blog-pag my-4 text-center text-md-left">
						<a href="/info/inforead?bno=${(info.bno)-1}"
							class="fables-forth-background-color fables-main-hover-background-color btn white-color white-color-hover px-md-4 py-2 mr-3 font-15">
							<span class="fables-iconarrow-left"></span> 이전 모델
						</a> <a href="/info/inforead?bno=${(info.bno)+1}"
							class="fables-forth-background-color fables-main-hover-background-color btn white-color white-color-hover px-md-4 py-2 mr-3 font-15">
							다음 모델 <span class="fables-iconarrow-right"></span>
						</a>
					</div>
				</div>
				<!-- 차량 제원 -->
				<div class="col-12 col-md-4 col-lg-3 offset-lg-1 mt-md-5 mt-lg-0">
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">제조사
						</span> <span class="fables-forth-text-color fifth"> :
							${info.brand} </span>
					</div>
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">출시일
						</span> <span class="fables-forth-text-color fifth"> :
							${info.releasedate} 년 </span>
					</div>
					<div class="my-2">
						<span class="fables-main-text-color font-15 semi-font">차종
						</span> <span class="fables-forth-text-color fifth"> :
							${info.cartype} </span>
						<div class="my-2">
							<span class="fables-main-text-color font-15 semi-font">연비</span>
							<span class="fables-forth-text-color fifth">: ${info.fuel}
								km/kWh</span>
						</div>
						<div class="my-2">
							<span class="fables-main-text-color font-15 semi-font">주행거리
							</span> <span class="fables-forth-text-color fifth">:
								${info.mileage} km </span>
						</div>
						<div class="my-2">
							<span class="fables-main-text-color font-15 semi-font">충전방식
							</span> <span class="fables-forth-text-color fifth">:
								${info.chargetype} </span>
						</div>
						<div class="my-2">
							<span class="fables-main-text-color font-15 semi-font">가격</span>
							
							<span class="fables-forth-text-color fifth"> : <fmt:formatNumber
									value="${(info.rowprice)/10000}" pattern="#,###" /></span> <span
								class="fables-forth-text-color fifth"> ~ <fmt:formatNumber
									value="${info.highprice}" pattern="#,###" />원
							</span>
						</div>
						<div class="my-2">
							<span class="fables-main-text-color font-15 semi-font">보조금</span>
							<span class="fables-forth-text-color fifth"> : <fmt:formatNumber
									value="${(info.support)/10000}" pattern="#,###" />만원
							</span>
						</div>
					<button type="button" class="btn btn-default">수정</button>
						<div>
					</div>
				</div>
				<!-- /차량 제원 -->
			</div>
		</div>
		<!-- /자동차 설명 -->
	</form>

	<!-- 민지님 부분 -->
	<span> 민지님 리뷰들어가야 하는 부분입니다. </span>

	<!-- /민지님 -->

</div>
<!-- /컨테이너 -->
<!-- /End page content -->

<!-- 수정버튼을 보내면 보낼 폼 -->
<script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<form action="modify" id="myform">
	<input type="hidden" name="bno" value="${info.bno}" />
</form>
<script>
	$(function() {
		var form = $("#myform");
		
		$(".btn-default").click(function() {
			form.submit();
		})
	})
</script>
<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
