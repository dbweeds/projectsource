<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>
<style>
.table11 th {
	border-top: 2px solid #555;
	border-right: 1px solid #e5e5e5;
	padding: 10px 0;
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	font-size: 16px;
}

.table11 td {
	padding: 10px 0;
	border-right: 1px solid #e5e5e5;
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
}

.table11 {
	width: 100%;
	margin-top: 10px;
	border-collapse: separate;
	border-spacing: 0;
	border: 0 none;
	border-left: 1px solid #e5e5e5;
}

.tr11 {
	font-size: 14px;
}

caption {
	font-size: 12px;
}
</style>
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
				<li class="breadcrumb-item"><a href="../"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: black;"><b>보조금지원 및 해택</b></li>
				<li class="breadcrumb-item"><a href="PCAmount"
					class="fables-second-text-color">구매비용계산</a></li>
				<li class="breadcrumb-item"><a href="SvAmount"
					class="fables-second-text-color">절약금액계산</a></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /End Breadcrumbs -->

<!-- Start page content -->
<div class="container">
	<div class="my-4 my-lg-5">

		<h1 class="fables-second-text-color font-24 semi-font my-3 mt-md-0">보조금
			현황과 신청절차</h1>
	</div>
	<hr>
	<br>
	<div style="height: 280px;display: flex;">
		<div style=" width: 49%;">
			<h2 class="fables-second-text-color font-20 mb-3 semi-font">보조금
				지원 대상</h2>
			<ul
				style="font-family: 'NanumGothic'; list-style-type: circle; margin-left: 20px">
				<li style="margin-bottom: 35px">중앙행정기관을 제외한 개인, 법인, 공공기관, 지방자치단체, 지방공기업 등</li>

				<li>국고보조금 외 지방보조금을 추가로 지원하는 지방자치단체는 <br>관할 자치단체 내 거주 등
					자격조건 부여 가능
				</li>
			</ul>

		</div>
		<div style="width: 50%;">

			<h2 class="fables-second-text-color font-20 mb-3 semi-font">보조금
				지원 차량</h2>

			<ul
				style="font-family: 'NanumGothic'; list-style-type: circle; margin-left: 20px">
				<li style="margin-bottom: 15px">아래의 사항을 충족하는 전기자동차</li>

				<ul class="fables-forth-text-color font-14">
					<li>-「자동차관리법」, 「대기환경보전법」, 「소음·진동관리법」 등 관계법령에 따라 자동차와 관련된 각종
						인증을 모두 완료한 차량</li>
					<li>-「전기자동차 보급대상 평가에 관한 규정」에 따른 전기차의 평가항목 및 기준에 적합한 차량</li>

				</ul>

			</ul>


		</div>

	</div>
	<hr>
	<br>
	<h2 class="fables-second-text-color font-20 mb-3 semi-font">2020년
		전기차 보조금 신청 절차</h2>
	<ul
		style="font-family: 'NanumGothic'; list-style-type: circle; margin-left: 20px;">
		<li>민간부문</li>

	</ul>
	<br>
	<div style="text-align: center;">
		<img alt=""
			src="https://www.ev.or.kr/portal/_images/sub/grantProcess2020.jpg"
			width="1000" height="300" style="border: 2px solid #f2f2f2">
	</div>
	<br>
	<ul class="fables-forth-text-color font-14">
		<li>-구매자는 차량구매대금과 보조금의 차액을 자동차 제조‧수입사에 납부하고,<br> 자동차 제조‧수입사는
			지방자치단체(국비보조금+지방비보조금)로부터 보조금 수령
		</li>


	</ul>
	<br>
	<hr>
	<br>
	<h2 class="fables-second-text-color font-20 mb-3 semi-font">전기차
		세제혜택</h2>
	<br>
	<table class="table11" style="">
		<caption>
			*차량가액 : 공장도가격<br>**차량가격 : 공장도가격 + 개별소비세 + 교육세
		</caption>
		<colgroup>
			<col style="width: 10;" />
			<col style="width: 20%;" />
			<col style="width: 35%;" />
			<col style="width: 35%;" />
		</colgroup>
		<tbody>
			<tr style="height: 25px; background: #fafafa; font-size: 16px;">
				<th rowspan="2" colspan="2">구분</th>
				<th>과세</th>
				<th>감면</th>
			</tr>
			<tr style="height: 25px; background: #fafafa; font-size: 16px;">
				<td>부과율</td>
				<td>감면한도</td>
			</tr>
			<tr class="tr11">
				<td rowspan="2">국세</td>
				<td>개별소비세</td>
				<td><sup>*</sup>차량가액의 5%</td>
				<td>300만원</td>
			</tr>
			<tr class="tr11">
				<td>교육세</td>
				<td>개별소비세의 30%</td>
				<td>90만원</td>
			</tr>
			<tr class="tr11">
				<td>지방세</td>
				<td>취득세</td>
				<td><sup>**</sup>차량가격의 7%<br>(경차,4%)</td>
				<td>140만원</td>
			</tr>
		</tbody>
	</table>
	<br>
	<hr>
	<br>
	<h2 class="fables-second-text-color font-20 mb-3 semi-font">전기차
		세제혜택</h2>

	<ul
		style="font-family: 'NanumGothic'; list-style-type: circle; margin-left: 20px; font-size: 13px">
		<li>지방세법 제127조(과세표준과 세율)에 따라 전기차는 그 밖의 승용자동차로 분류되며, 영업용은 20,000원,
			비영업용은 지방교육세(30%)가 포함되어 130,000원이 부과됩니다.</li>

	</ul>

	<table class="table11" style="">
		<colgroup>
			<col style="width: 10;" />
			<col style="width: 20%;" />
			<col style="width: 35%;" />
			<col style="width: 35%;" />
		</colgroup>
		<thead>
			<tr style="height: 25px; background: #fafafa; font-size: 16px;">
				<th>구분</th>
				<th>영업용</th>
				<th>비영업용</th>
			</tr>
		</thead>
		<tbody>
			<tr class="tr11">
				<td style="padding: 30px 0;">자동차세</td>
				<td style="padding: 30px 0;">20,000원</td>
				<td style="padding: 30px 0;">130,000원</td>
			</tr>
		</tbody>
	</table>
</div>
<br>
<br>
<!-- /End page content -->
<br>
<br>

<!-- /End page content -->

<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>

