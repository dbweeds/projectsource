<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 가격 단위 ,, -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<!-- css임시 -->
<style>
fieldset {
	/* margin: 0px auto; */
	padding: 10px;
	width: 500px;
	border-radius: 15px;
}



</style>

<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules">
	<div class="container">
		<h3
			class="fables-page-title fables-second-border-color wow fadeInLeft"
			data-wow-duration="1.5s" style="margin-top: 90px">전기차</h3>
	</div>
</div>
<!-- /End Header -->

<!-- /End Breadcrumbs -->

<!-- 상단 안내표 위치 -->
<div class="fables-light-background-color option"> 
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="fables-breadcrumb breadcrumb px-0 py-3">
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">전기차 </a></li>
				<li class="breadcrumb-item active" aria-current="page">국내운행 차량
				</li>
			</ol>
		</nav>
	</div>
</div>
<!-- /상단 안내표 -->

<!-- 메인 컨텍츠 -->
<div class="container contents"> 
	<!--옵션 검색-->
	<fieldset>
		<form action="" class="option"> <!-- .option -->
			<legend>차량검색 옵션</legend>
			
				<div>
					<label for="brand">제조사 :</label> 
					<input type="radio" name="brand"id="" value="현대" />현대&nbsp; 
					<input type="radio" name="brand" id=""value="기아" />기아&nbsp; 
					<input type="radio" name="brand" id=""value="쉐보레" />쉐보레&nbsp; 
					<input type="radio" name="brand" id="" value="테슬라" />테슬라&nbsp; 
				</div>
				<div>
					<label for="type">차종 :</label> 
					<input type="radio" name="type" id=""value="소형차" />소형&nbsp; 
					<input type="radio" name="type" id="" value="중형차" />중형&nbsp;
					<input type="radio" name="type" id="" value="대형차" />대형&nbsp; 
				</div>
	
				<div>
					<label for="chargeType">충전방식 :</label> 
					<input type="radio"	name="chargetype" id="" value="DC콤보" />미국, 아시아&nbsp; 
					<input type="radio" name="chargetype" id="" value="유럽" />유럽형&nbsp;
				</div>
				<input type="text" /> 
				<input type="submit" value="검색" /> 
				<input type="reset" value="취소" />
		</form>
	</fieldset>

	<!-- 리스트 반복문 -->
	<c:forEach var="vo" items="${list}" varStatus="status">
		
		<div class="row mt-4 my-md-5 list"><!-- .list -->
			<div class="col-12 col-sm-6 mb-4 mb-lg-5">
				<div class="image-container">
					<a href="inforead?bno=${vo.bno}"><img src="/resources/assets/custom/infoimage/${vo.carname}.png" alt=""class="w-100" /></a>
				</div>
				<h2 class="my-3">
					<a href="#"class="fables-main-text-color fables-second-hover-color font-26 semi-font gallery-title">${vo.carname}</a>
				</h2>
				<div class="row my-3">
					<div class="col-12 col-lg-4">
						<span
							class="fables-main-text-color semi-font font-15 gallery-subtitle">브랜드</span> 
							<span class="fables-forth-text-color font-14 gallery-subtitle">: ${vo.brand} </span>
					</div>
					<div class="col-12 col-lg-4">
						<span class="fables-main-text-color semi-font font-15 gallery-subtitle">가격</span> 
							<span class="fables-forth-text-color font-14 gallery-subtitle">: <fmt:formatNumber type="number" maxFractionDigits="3"	value='${vo.rowprice}'/>원</span>
					</div>
					<div class="col-12 col-lg-4">
						<span class="fables-main-text-color semi-font font-15 gallery-subtitle">주행거리(완충)</span> 
						<span class="fables-forth-text-color font-14 gallery-subtitle">: ${vo.mileage} km </span>
					</div>
				</div>
				<a href="inforead?bno=${vo.bno}"class="btn fables-second-background-color white-color white-color-hover fables-main-hover-background-color font-15 mt-4 px-5 py-2">
				상세페이지</a>
			</div>
		</div>
		 <!-- / 반복문 -->
	</c:forEach>

</div>
<!-- /container-->


<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
