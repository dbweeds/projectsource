<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 가격 단위 ,, -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>
<!-- css임시 -->
<style>
/* 검색 */
.option {
	width: 600px;
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

.pagination {
	font-famaily: "Roboto", sans-serif;
}

.pagination li a {
	border-radius: 0 !important;
	color: gray !important;
}

.pagination li.active a {
	color: #fff !important;
	background: gray !important;
	border-color: gray !important;
}

@media all and (max-width:1630px){
	.floating{
		display: inline-block;
	}
	#formoption{
		width: 75%;
	}
	

}
@media all and (min-width:1630px){

	.floating {
		position: fixed;
		right: 30px;
		border: 1px solid gray; 
		border-radius: 10px;
	}
	
	#formoption{
		width: 100%;
	}
}


.modelline {
	color: #000000;
}

</style>

<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules" style="background-image: url(/resources/assets/custom/images/EVcar_header_03.png)">
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
				<li class="breadcrumb-item"><a href="../"
					class="fables-second-text-color">Home </a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: black;"><b>국내운행 차량</b></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /상단 안내표 -->

<!-- 메인 컨텍츠 -->
<div class="container">
	<!--옵션 검색-->

	<div style="display: flex">
		<form action="../info/list" class="navbar-form navbar-left option "
			id="formoption" style="display: inline-block; padding: 30px 5px;">
			<!-- .option -->

			<fieldset>
				<legend>차량검색 옵션</legend>
				<br>
				<hr>
				<ul>
					<li>
						<div style="display: table; padding-bottom: 20px;">
							<div id="title"
								style="display: table-cell; vertical-align: middle; padding-right: 7px;">제조사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</div>
							<div
								style="display: inline-block; padding-top: 15px; padding-right: 10px; padding-bottom: 5px">
								<input type="radio" name="brand" id="" value="현대"
									<c:out value="${vo.brand=='현대'?'chacked':''}"/> />현대&nbsp; <input
									type="radio" name="brand" id="" value="기아"
									<c:out value="${vo.brand=='기아'?'chacked':''}"/> />기아&nbsp; <input
									type="radio" name="brand" id="" value="쉐보레"
									<c:out value="${vo.brand=='쉐보레'?'chacked':''}"/> />쉐보레&nbsp; <input
									type="radio" name="brand" id="" value="테슬라"
									<c:out value="${vo.brand=='테슬라'?'chacked':''}"/> />테슬라&nbsp; <input
									type="radio" name="brand" id="" value="푸조"
									<c:out value="${vo.brand=='푸조'?'chacked':''}"/> />푸조&nbsp;<br>
								<input type="radio" name="brand" id="" value="시트로엥"
									<c:out value="${vo.brand=='시트로엥'?'chacked':''}"/> />시트로엥&nbsp;
								<input type="radio" name="brand" id="" value="BMW"
									<c:out value="${vo.brand=='BMW'?'chacked':''}"/> />BMW&nbsp; <input
									type="radio" name="brand" id="" value="아우디"
									<c:out value="${vo.brand=='아우디'?'chacked':''}"/> />아우디&nbsp; <input
									type="radio" name="brand" id="" value="벤츠"
									<c:out value="${vo.brand=='벤츠'?'chacked':''}"/> />벤츠&nbsp; <input
									type="radio" name="brand" id="" value="르노삼성"
									<c:out value="${vo.brand=='르노삼성'?'chacked':''}"/> />르노삼성&nbsp;
							</div>
						</div>
					</li>
					<li><label for="type" id="title"
						style="padding-right: 4px; padding-bottom: 20px;">차종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label>
						<input type="radio" name="type" id="" value="경차"
						<c:out value="${vo.type=='경차'?'chacked':''}"/> />경차&nbsp; <input
						type="radio" name="type" id="" value="소형차"
						<c:out value="${vo.type=='소형차'?'chacked':''}"/> />소형&nbsp; <input
						type="radio" name="type" id="" value="중형차"
						<c:out value="${vo.type=='중형차'?'chacked':''}"/> />중형&nbsp; <input
						type="radio" name="type" id="" value="대형차"
						<c:out value="${vo.type=='대형차'?'chacked':''}"/> />대형&nbsp; <input
						type="radio" name="type" id="" value="SUV"
						<c:out value="${vo.type=='SUV'?'chacked':''}"/> />SUV&nbsp;</li>
					<li><label for="chargeType" id="title"
						style="padding-right: 4px; padding-bottom: 20px;">충전 방식 :</label>
						<input type="radio" name="chargetype" id="" value="DC콤보"
						<c:out value="${vo.chargetype=='DC콤보'?'chacked':''}"/> />DC콤보(북미,아시아)&nbsp;
						<input type="radio" name="chargetype" id="" value="AC3상"
						<c:out value="${vo.chargetype=='AC3상'?'chacked':''}"/> />AC3상(유럽)&nbsp;
					</li>
				</ul>
				<div>
					<label>직접입력 :</label> <input type="text" name="keyword"
						placeholder="차종을 입력하세요" /> <input type="hidden" name="pageNum"
						value="1" /> <input type="hidden" name="amount" value="6" />
				</div>
			</fieldset>
			<div style="text-align: center;">
				<button class="btn btn-outline-dark" type="submit">검색</button>
				<button class="btn btn-outline-danger" type="button"
					onclick="location.href='../info/list'">초기화</button>
			</div>
			<hr>
		</form>
		<div class="floating" id="floatingtest"
			style="margin-left:20px; ">
			<!--인기글-->
			<div id="carcount" style="margin: 34px;">
				<h2
					class="position-relative font-18 semi-font fables-blog-category-head fables-main-text-color 
            fables-second-before pl-3 mb-4">인기 모델</h2>
	<hr>
			</div>
		</div>
		<!--/인기글-->

	</div>
	<div align="right" id="updateButton">
		<!-- 모델 추가 -->
		<button type="button" class="btn btn-warning"
			onclick="location.href='../info/infoRegist'">추가</button>
	</div>
	<!-- 리스트 반복문 -->
	<c:forEach var="vo" items="${list}" varStatus="status">
		<div class="row mt-4 my-md-5 list"
			style="width: 50%; display: inline-block; height: 200px; margin-right: 10px">
			<div class="col-12 mb-4 mb-lg-5" style="margin: 0 20px">
				<div class="image-container">
					<a href="count?bno=${vo.bno}"><img
						src="/resources/assets/custom/infoimage/${vo.thumbnail}" alt=""
						class="w-100" /></a>
				</div>
				<h2 class="my-3">
					<a href="count?bno=${vo.bno}"
						class="fables-main-text-color fables-second-hover-color font-24 semi-font gallery-title">${vo.carname}</a>
				</h2>
				<div class="row my-3">
					<div class="col-12 col-lg-3">
						<span
							class="fables-main-text-color semi-font font-14 gallery-subtitle">브랜드</span>
						<span class="fables-forth-text-color font-13 gallery-subtitle">:
							${vo.brand} </span>
					</div>
					<div class="col-12 col-lg-5">
						<span
							class="fables-main-text-color semi-font font-14 gallery-subtitle">가격</span>
						<span class="fables-forth-text-color font-13 gallery-subtitle">
							: <fmt:formatNumber value="${(vo.rowprice)/10000}"
								pattern="#,###" /> ~ <fmt:formatNumber
								value="${(vo.highprice)/10000}" pattern="#,###" /> 만원
						</span>
					</div>
					<div class="col-12 col-lg-4">
						<span
							class="fables-main-text-color semi-font font-14 gallery-subtitle">주행거리(1회)</span>
						<span class="fables-forth-text-color font-13 gallery-subtitle">:
							${vo.mileage} km </span>
					</div>
				</div>
				<a href="count?bno=${vo.bno}"
					class="btn fables-second-background-color white-color white-color-hover 
					fables-main-hover-background-color font-15 mt-4 px-5 py-2">
					상세페이지</a>
			</div>
		</div>
	</c:forEach>
	<!-- / 반복문 -->
	<div style="height: 50px;"></div>

</div>
<!-- /container-->

<!-- /배너 -->

<div style="margin-top: 50px; margin-bottom: 20px">
	<ul class="pagination  justify-content-center">
		<c:if test="${infoPageVO.prev}">
			<li class="page-item"><a href="${infoPageVO.startPage-1}">이전</a>
			</li>
		</c:if>

		<c:forEach var="idx" begin="${infoPageVO.startPage}"
			end="${infoPageVO.endPage}">
			<li class="page-item ${infoPageVO.cri.pageNum == idx?'active':''}">
				<a class="page-link"
				href="/info/list?pageNum=${idx}&amount=6&brand=${searchvo.brand}&type=${searchvo.type}&chargetype=${searchvo.chargetype}&keyword=${searchvo.keyword}">
					${idx} </a>
			</li>
		</c:forEach>

		<c:if test="${infoPageVO.next}">
			<li class="page-item next"><a href="${infoPageVO.endPage+1}">다음</a>
			</li>
		</c:if>
	</ul>
</div>
<!-- end Pagination -->
<!-- 페이지 링크값 -->
<form action="">
	<input type="hidden" name="pageNum" value="${infoPageVO.cri.pageNum}">
	<input type="hidden" name="amount" value="${infoPageVO.cri.amount}">
</form>

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
$(function() {
	$.getJSON("../info/countlist", function(data) {
		$.each(data,function(idx,item) {
			var str = "<ul><li>"
			str += "<a href='count?bno="+item.bno+"'>"+(idx+1)+" : "+item.brand+" : "+item.carname+"</a></li></ul>";
			console.log(str);
			$("#carcount").append(str);
		
		})
	})
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
