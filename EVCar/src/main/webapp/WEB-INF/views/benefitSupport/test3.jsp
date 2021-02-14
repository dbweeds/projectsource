<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules">
	<div class="container">
		<h2
			class="fables-page-title fables-second-border-color wow fadeInLeft"
			data-wow-duration="1.5s" style="margin-top: 90px">공지사항</h2>
	</div>
</div>
<!-- /End Header -->

<!-- Start Breadcrumbs -->
<div class="fables-light-background-color">
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="fables-breadcrumb breadcrumb px-0 py-3">
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">보조금지원 및
					해택</li>
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">구매비용계산</a></li>
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">절약금액계산</a></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /End Breadcrumbs -->

<!-- Start page content -->

<!-- 여기가 매인컨택츠 컨테이너 -->
<div class="container">
	<div class="my-4 my-lg-5">

		<h1 class="fables-second-text-color font-24 semi-font my-3 mt-md-0">구매
			금액 계산</h1>
		<p class="fables-forth-text-color font-14">전기차 구매의 지역별, 모델별로 금액을
			계산해보기</p>

	</div>
	<hr>
	<div class="fables" style="padding: 50px 0; background: #f2f2f2">
		<div class="container">
			<div class="">
				<table class="">

					<tbody>
						<tr>
							<th scope="row" style="padding-top: 5px; padding-left: 400px;">사는
								지역</th>
							<td style="padding-left: 20px"><select id="area">
									<option value="0">시도</option>
									<option value="4000000">서울</option>
									<option value="5000000">부산</option>
									<option value="4500000">대구</option>
									<option value="4200000">인천</option>
									<option value="5000000">광주</option>
									<option value="7000000">대전</option>
									<option value="5500000">울산</option>
									<option value="3000000">세종</option>
									<option value="4000000">경기</option>
									<option value="5200000">강원</option>
									<option value="8000000">충청북도</option>
									<option value="7000000">충청남도</option>
									<option value="9000000">전라북도</option>
									<option value="7200000">전라남도</option>
									<option value="6000000">경상북도</option>
									<option value="6000000">경상남도</option>
									<option value="4000000">제주도</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row" style="padding-top: 30px; padding-left: 400px;">전기차
								모델</th>
							<td style="padding-left: 20px; padding-top: 30px"><select
								name="" id="model">
									<option value="0">모델을 선택하세요.</option>
									<option value="포터 일렉트닉">포터 일렉트닉</option>
									<option value="코나 일렉트릭">코나 일렉트릭</option>
									<option value="아이오닉">아이오닉</option>
									<option value="쏘울EV">쏘울EV</option>
									<option value="니로EV">니로EV</option>
									<option value="조에">조에</option>
									<option value="SM3">SM3</option>
									<option value="볼트EV">볼트EV</option>
									<option value="모델3">모델3</option>
									<option value="i3">i3</option>
									<option value="EQC 400">EQC 400</option>
									<option value="DS3 E텐스">DS3 E텐스</option>
									<option value="푸조 E-208">푸조 E-208</option>
									<option value="푸조 E-2008">푸조 E-2008</option>
									<option value="모델S">모델S</option>
									<option value="모델X">모델X</option>
									<option value="E-트론">E-트론</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<div class="" style="text-align: center; padding-top: 30px;">
					<button type="button" class="btn btn-secondary btn-lg" id="compute">계산하기</button>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div
		class="col-12 col-md-10 offset-md-1 col-lg-8 offset-lg-2 text-center">
		<h2 class="font-35 font-weight-bold fables-second-text-color mb-4">
			요금 계산 결과</h2>
		<p class="fables-forth-text-color">현재 나온 결과는 실제 측정 금액과 다를 수 있습니다.

		</p>
	</div>
	<div style="height: 40px"></div>
	<hr>
	<div class="row">
		<div
			class="col-12 col-sm-6 col-md-4 text-center mb-5 mb-md-0 wow fadeInDown"
			data-wow-delay=".5s">
			<span class=" fa-3x fables-main-text-color fables-second-hover-color"></span>
			<h2 class="font-16 semi-font fables-main-text-color my-3">지역별
				지원금</h2>
			<p class="font-18 fables-forth-text-color">
				<span>약<span class="result1">0</span>원
				</span>
			</p>
		</div>
		<div
			class="col-12 col-sm-6 col-md-4 text-center mb-5 mb-md-0 wow fadeInDown"
			data-wow-delay=".8s">
			<span class=" fa-3x fables-main-text-color fables-second-hover-color"></span>
			<h2 class="font-16 semi-font fables-main-text-color my-3">모델별
				지원금</h2>
			<p class="font-18 fables-forth-text-color">
				<span>약<span class="result2">0</span>원
				</span>
			</p>

		</div>
		<div
			class="col-12 col-sm-6 col-md-4 text-center mb-5 mb-md-0 wow fadeInDown"
			data-wow-delay="1.1s">
			<span class=" fa-3x fables-main-text-color fables-second-hover-color"></span>
			<h2 class="font-16 semi-font fables-main-text-color my-3">총 구매
				금액(시별 최소금액)</h2>
			<p class="font-18 fables-forth-text-color" style="padding-bottom:">
				<span>약<span class="result3">0</span>원
				</span>
			</p>
		</div>
		<div style="height: 30px"></div>
		<div class="container detail"
			style="margin-top: 50px; text-align: center;"></div>
	</div>

</div>
<div style="height: 50px"></div>
<!-- /End page content -->

<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
<script>
$("#compute").click(function () {
	var area = Number($("#area").val());
	var model = $("#model").val();
	
	if(area === 0 || model === 0){
		alert("입력란을 확인해주세요.");
		return false;
	}
	
	$.getJSON({
        type : "post",
        url : "/benefitSupport/evVO",
        contentType:'application/json;charset=utf-8',
        data : model,
        success : function(data){
            $(".result1").empty();
            $(".result1").append(area);        	
        	var result2 = data.support;
            $(".result2").empty();
            $(".result2").append(result2);
            var highVal = data.highprice-(area+result2);
            var rowVal = data.rowprice-(area+result2);
            $(".result3").empty();
            $(".result3").append(rowVal+" ~ "+highVal);
            $(".detail").append(" <dl><dt>이 모델의 상세정보가 궁금하다면?</dt><dd><a href='http://localhost:8080/info/inforead?bno="+data.bno+"'>모델보러가기</a></dd></dl>")
        }
    })
})
</script>

