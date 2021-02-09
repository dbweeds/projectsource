<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 가격 단위 ,, -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>



<!-- css임시 -->
<style>
/* 검색 */
	.option {
		width:600px;
		/* margin:0 auto; */
		}
		
	label title {
		font-weight: bold; 
		width: 80px; /* 너비 80px */
		float: left; /* 왼쪽부터 배치 */
	}
	fieldset { 
		margin: 15px 10px; 
	}
	fieldset legend { 
		font-weight: bold; 
		font-size: 18px; 
	}
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
<div class="fables-light-background-color"> 
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
<div class="container"> 
	<!--옵션 검색-->
		<div>
			<form action="" class="navbar-form navbar-left option " id="searchForm"> 
			<fieldset style="">
				<legend>차량검색 옵션</legend>
				<ul>
					<li>
						<label for="brand" id="title">제조사 :</label> 
							<input type="radio" name="brand"id="" value="현대" />현대&nbsp; 
							<input type="radio" name="brand" id=""value="기아" />기아&nbsp; 
							<input type="radio" name="brand" id=""value="쉐보레" />쉐보레&nbsp; 
							<input type="radio" name="brand" id="" value="테슬라" />테슬라&nbsp; 
					</li>
					<li>
						<label for="type" id="title">차종&nbsp;&nbsp;&nbsp;&nbsp;:</label> 
							<input type="radio" name="type" id=""value="소형차" />소형&nbsp; 
							<input type="radio" name="type" id="" value="중형차" />중형&nbsp;
							<input type="radio" name="type" id="" value="대형차" />대형&nbsp; 
					</li>
					<li>
						<label for="chargeType" id="title">충전방식 :</label> 
							<input type="radio"	name="chargetype" id="" value="DC콤보" />DC콤보(북미,아시아)&nbsp; 
							<input type="radio" name="chargetype" id="" value="AC상" />AC상(유럽)&nbsp;
					</li>
				</ul>
					<label for="carname" id="title">모델명 :</label> 
					<input type="text" name="keyword" /> 
					<button class="btn btn-success" type="button">검색 </button>
					<button class="btn btn-default" type="button">취소 </button>
					<!-- 모델 추가 -->
					<button type="button" class="btn btn-light"	onclick="location.href='infoRegist'">추가</button>
			</fieldset>
		</form>
	</div>
	

		
<!-- 리스트 반복문 -->
	<c:forEach var="vo" items="${list}" varStatus="status">
	<div class="row mt-4 my-md-5 list" style="width: 50%; display: inline-block; height: 200px; margin-right: 10px" >
	       <div class="col-12 mb-4 mb-lg-5" style="margin: 0 20px">
			<div class="image-container">
				<a href="inforead?bno=${vo.bno}"><img src="/resources/assets/custom/infoimage/${vo.carname}.png" alt=""class="w-100" /></a>
			</div>
			<h2 class="my-3">
				<a href="inforead?bno=${vo.bno}"class="fables-main-text-color fables-second-hover-color font-24 semi-font gallery-title">${vo.carname}</a>
			</h2>
			<div class="row my-3">
				<div class="col-12 col-lg-4">
					<span
						class="fables-main-text-color semi-font font-14 gallery-subtitle">브랜드</span> 
						<span class="fables-forth-text-color font-13 gallery-subtitle">: ${vo.brand} </span>
				</div>
				<div class="col-12 col-lg-4">
					<span class="fables-main-text-color semi-font font-14 gallery-subtitle">가격</span> 
						<span class="fables-forth-text-color font-13 gallery-subtitle">
						: <fmt:formatNumber value="${(vo.rowprice)/10000}" pattern="#,###"/> ~ 
						<fmt:formatNumber value="${(vo.highprice)/10000}" pattern="#,###"/>
						만원</span>
				</div>
				<div class="col-12 col-lg-4">
					<span class="fables-main-text-color semi-font font-14 gallery-subtitle">주행거리(1회)</span> 
					<span class="fables-forth-text-color font-13 gallery-subtitle">: ${vo.mileage} km </span>
				</div>
			</div>
			<a href="inforead?bno=${vo.bno}"class="btn fables-second-background-color white-color white-color-hover 
			fables-main-hover-background-color font-15 mt-4 px-5 py-2">
			상세페이지</a>
		</div>
	</div>
	</c:forEach> <!-- /반복문 -->	

<!-- start Pagination -->
<!-- CSS only -->
<div style="margin-top:50px;margin-bottom:20px">
	<ul class="pagination  justify-content-center">
		<c:if test="${infoPageVO.prev}">
			<li class="page-item"> 
			<a href="${infoPageVO.startPage-1}">이전</a>
			</li>
		</c:if>
		
		<c:forEach var="idx" begin="${infoPageVO.startPage}"
			end="${infoPageVO.endPage}">
			<li class="page-item ${infoPageVO.cri.pageNum == idx?'active':''}">
			<a class="page-link" href="/info/list?pageNum=${idx}&amount=6"> ${idx} </a>
			</li>
		</c:forEach>

		<c:if test="${infoPageVO.next}">
			<li class="page-item next">
			<a href="${infoPageVO.endPage+1}">다음</a>
			</li>
		</c:if>
	</ul>
</div>
<!-- end Pagination -->
</div> 
<!-- /container-->


<!-- 페이지 링크값 -->
<form action="">
	<input type="hidden" name="pageNum" value="${infoPageVO.cri.pageNum}" >
	<input type="hidden" name="amount" value="${infoPageVO.cri.amount}" >
</form>


<!-- 스크립트 -->
<!-- <script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->


<!-- <script src="/resources/js/info.js"></script> -->

<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
