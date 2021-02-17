<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 가격 단위 ,, -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
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
				<li class="breadcrumb-item"><a href="../"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page"><a href="list"
                    class="fables-second-text-color">국내운행 차량</a></li>
				<li class="breadcrumb-item active" aria-current="page" style="color: black;">
					<b>${info.brand} : ${info.carname} (${info.carname_en})</b></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /네비 -->

<!-- 매인컨텐츠 컨테이너 -->
<div class="container">
	<input type="hidden" name="bno" value="${info.bno}" />
	<!-- <div class="container mt-4 mt-lg-5"> -->
	<div
		class="owl-carousel owl-theme default-carousel default-carousel-nav">
		<c:if test="${info.carpicture1 != null}">
			<div>
				<a href="#"><img
					src="/resources/assets/custom/infoimage/${info.carpicture1}" alt=""
					class="w-100" /></a>
			</div>
		</c:if>
		<c:if test="${info.carpicture2 != null}">
			<div>
				<a href="#"><img
					src="/resources/assets/custom/infoimage/${info.carpicture2}" alt=""
					class="w-100" /></a>
			</div>
		</c:if>
		<c:if test="${info.carpicture3 != null}">
			<div>
				<a href="#"><img
					src="/resources/assets/custom/infoimage/${info.carpicture3}" alt=""
					class="w-100" /></a>
			</div>
		</c:if>
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
			<br /> <br />
			<!-- 차량 내용 -->
			${info.content}
			</p>
		
		</div>
		<!-- 차량 제원 -->
		<div class="col-12 col-md-4 col-lg-3 offset-lg-1 mt-md-5 mt-lg-0">
			<div class="my-2">
				<span class="fables-main-text-color font-15 semi-font">제조사 </span> <span
					class="fables-forth-text-color fifth"> : ${info.brand} </span>
			</div>
			<div class="my-2">
				<span class="fables-main-text-color font-15 semi-font">출시일 </span> <span
					class="fables-forth-text-color fifth"> : ${info.releasedate}
					년 </span>
			</div>
			<div class="my-2">
				<span class="fables-main-text-color font-15 semi-font">차종 </span> <span
					class="fables-forth-text-color fifth"> : ${info.cartype} </span>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">연비</span> <span
						class="fables-forth-text-color fifth">: ${info.fuel} km/kWh</span>
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
					<span class="fables-main-text-color font-15 semi-font">가격</span> <span
						class="fables-forth-text-color fifth"> : <fmt:formatNumber
							value="${(info.rowprice)}" pattern="#,###" /></span> <span
						class="fables-forth-text-color fifth"> ~ <fmt:formatNumber
							value="${info.highprice}" pattern="#,###" />원
					</span>
				</div>
				<div class="my-2">
					<span class="fables-main-text-color font-15 semi-font">보조금</span> <span
						class="fables-forth-text-color fifth"> : <fmt:formatNumber
							value="${(info.support)}" pattern="#,###" />원
					</span>
				</div>
				<div id="updateButton">
					<button type="button" class="btn btn-primary"
						onclick="location.href='modify?bno=${info.bno}'">수정</button>
				</div>
			</div>
			<!-- /차량 제원 -->
		</div>
	</div>
	    <hr class="my-0 mx-0_5">
	<div class="container" style="margin-top: 30px"><!-- 리뷰 -->
            <div data-tracking-parent="consumer-reviews">
                <section class="consumer-reviews"
                    data-tracking-parent="consumer-reviews">
                    <header class="consumer-review-summary-header">
                        <h3 class="heading-4 font-weight-medium my-1" _msthash="4285463"
                            _msttexthash="74350198">가장 유용한 소비자 리뷰</h3>
                        <br>        
                    </header>
                </section>
            </div>
            <div class="truncated-text size-16 font-weight-normal row">
                <div class="col-12">
                    ${info.reviewtitle1}
                </div>
                <div class="form-group" style="height: 500px; padding-top: 20px">
                <textarea cols=100 rows=20 name='content'
                    style="overflow: auto; resize: none; border: none;"
                    readonly="readonly"><c:out value="${info.review1}" /></textarea>
            </div>
            </div>
            <br>
        </div>

    <hr class="my-0 mx-0_5">
    <div class="container">
        <div
        style="border: 1ps solid gold; padding: 10px;text-align: center;">
        <iframe width="100%" height="500px"
            src="${info.youtubeurl}" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen></iframe>
            <br>
        </div>
    </div>
     <hr class="my-0 mx-0_5">
       <br>
</div>
<!-- /컨테이너 -->
<!-- /End page content -->
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
$(function() {
var admin = '<%=(String)session.getAttribute("admin")%>';
    
if(admin == "null"){
    $("#updateButton").empty();
}
    
var message = "${message}";
if(message != ""){
	alert(message);
}
})
</script>