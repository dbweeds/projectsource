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
				<li class="breadcrumb-item active" aria-current="page">등록페이지</li>

			</ol>
		</nav>
	</div>
</div>
<!-- /네비 -->

<!-- 매인컨텐츠 컨테이너 -->
<div class="container">
	<form action="" method="post" role="form">
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
		<div class="row mb-4 my-lg-5">
			<div class="col-12 col-md-8">
				<h2 class="mb-3">
					<!-- 차량 이름 -->
					<input type="text"
						class="fables-main-text-color fables-second-hover-color font-20 semi-font form-control"
						id="exampleFormControlInput1" name="carname" placeholder="모델명 한글">
					
					<input type="text"
						class="fables-main-text-color fables-second-hover-color font-15 semi-font form-control"
						id="exampleFormControlInput1" name="carname_en" placeholder="모델명 영문">
				</h2>
				<p class="fables-fifth-text-color font-14">
					<!-- 차량 타이틀 -->
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력해주세요"> <br /> 
					<!-- 차량 타이틀 -->
					<textarea class="form-control" id="content" name="content" rows="20"
						placeholder="내용을 입력해주세요"></textarea>
				</p>
				<!-- 이전 모델 / 다음 모델 연결 -->
				<div class="fables-single-blog-pag my-4 text-center text-md-left">
					<button type="submit" class="btn btn-primary">작성</button>
					<button type="button" class="btn btn-light"
						onclick="location.href='list'">목록</button>
				</div>
			</div>
			<!-- 차량 제원 -->
			<div class="col-12 col-md-4 col-lg-3 offset-lg-1 mt-md-5 mt-lg-0">
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">브랜드 </span>
					<input type="text" class="form-control"
						id="exampleFormControlInput1" name="brand"
						placeholder="브랜드를 입력하세요">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">출시일 </span>
					<input type="number" class="form-control" id="releasedate" name="releasedate"
						placeholder="ex) 2020 -숫자만 입력">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">차종 </span> <input
						type="text" class="form-control" id="cartype" name="cartype"
						placeholder="ex) 소형차,중형차">

				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">연비</span> <input
						type="number" max="100" min="0" step="0.1" class="form-control"
						id="fuel" name="fuel" placeholder="ex) 15.2 -소수 첫째자리">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">주행거리
					</span> <input type="number" class="form-control" id="mileage" name="mileage"
						placeholder="km제외한 숫자만 입력하세요">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">충전방식</span> 
					 <select id="chargetype" name="chargetype">
		                <option value="DC콤보">DC콤보</option>
		                <option value="AC3상">AC3상</option>
          			  </select>
				</div>
				<div class="my-2">
				<span class="fables-main-text-color font-15 semi-font">최저가</span>
					<input type="number" class="form-control" id="rowprice" name="rowprice"
						placeholder="최저가격">
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">최고가</span> 
					<input type="number" class="form-control" id="highprice" name="highprice"
						placeholder="최고가격"> 
					</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">보조금</span>
					<input type="number" class="form-control" id="support" name="support"
						placeholder="정부 보조금">
				</div>
			<div>
		</div>
	</div>
</div>
<!-- /차량 제원 -->
</div>
</form>
</div>
<!-- /자동차 설명 -->


<!-- </div> -->
<!-- /컨테이너 -->
<!-- /End page content -->


<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
