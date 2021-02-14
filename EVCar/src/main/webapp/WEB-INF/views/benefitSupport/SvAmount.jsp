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
				<li class="breadcrumb-item"><a href="../"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item"><a href="../"
                    class="fables-second-text-color">보조금지원 및
					해택</a></li>
				<li class="breadcrumb-item"><a href="PCAmount"
					class="fables-second-text-color">구매비용계산</a></li>
				<li class="breadcrumb-item active" aria-current="page"style="color: black;"><b>절약금액계산</b></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /End Breadcrumbs -->

<!-- Start page content -->

<!-- 여기가 매인컨택츠 컨테이너 -->
<div class="container">
	<div class="my-4 my-lg-5">
		<h1 class="fables-second-text-color font-24 semi-font my-3 mt-md-0">절약
			금액 계산</h1>
		<p class="fables-forth-text-color font-14">전기차와 내연 기관 차량 대비 절약되는
			금액을 계산해 보기</p>
	</div>
	<hr>
	<div class="fables" style="padding: 50px 0; background: #f2f2f2">
		<div class="container">
			<div class="">
				<table class="">
					<tbody>
						<tr>
							<th scope="row" style="padding: 20px">엔진</th>
							<td class=" ">
								<!--   <a href="javascript:void(0);" class="butt1">가솔린</a><a href="javascript:void(0);" class="butt2">디젤</a> -->
								<div class="col md-8">
									<input type="radio" name="a" id="a1" value="1500"> <label
										for="a1"> 가솔린</label> <input type="radio" name="a" id="a2"
										value="1300"> <label for="a2"> 디젤</label>
								</div>
							</td>
							<th scope="row" style="padding-left: 250px">복합연비(km/l)</th>
							<td><input type="text" id="b" placeholder="숫자로 입력" /></td>
						</tr>
						<tr>
							<th scope="row" style="padding: 20px">하루 주행거리(km)</th>
							<td><input type="text" id="c" placeholder="숫자로 입력"
								 style=""></td>
							<th scope="row" style="padding-left: 250px">한달 주행 횟수</th>
							<td><select name="d" id="d">
									<option value="0">선택하세요.</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row" style="padding: 20px">차량 운행 기간(년)</th>
							<td class="">
								<div class="">
									<input type="radio" name="e" id="e1" value="1"> 1 <input
										type="radio" name="e" id="e2" value="2"> 2 <input
										type="radio" name="e" id="e3" value="3"> 3 <input
										type="radio" name="e" id="e4" value="4"> 4 <input
										type="radio" name="e" id="e5" value="5"> 5
								</div>
							</td>
							<th scope="row" style="padding-left: 250px">전기차 모델</th>
							<td><select name="f" id="f">
									<option value="">모델을 선택하세요.</option>
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
				<div class="" style="padding-top: 30px; text-align: center;">
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
			<h2 class="font-16 semi-font fables-main-text-color my-3">보유차량기준</h2>
			<p class="font-24 fables-forth-text-color">
				<strong>주유비</strong>
			</p>
			<p class="font-18 fables-forth-text-color">
				<span>약<span class="result1">0</span>원
				</span>
			</p>
		</div>
		<div
			class="col-12 col-sm-6 col-md-4 text-center mb-5 mb-md-0 wow fadeInDown"
			data-wow-delay=".8s" >
			<span class=" fa-3x fables-main-text-color fables-second-hover-color"></span>
			<h2 class="font-16 semi-font fables-main-text-color my-3">차량
				모델기준</h2>
			<p class="font-16 fables-forth-text-color">
				<strong>전기차 충전비</strong>
			</p>
			<p class="font-18 fables-forth-text-color">
				<span>약<span class="result2">0</span>원
				</span>
			</p>

		</div>
		<div
			class="col-12 col-sm-6 col-md-4 text-center mb-5 mb-md-0 wow fadeInDown"
			data-wow-delay="1.1s">
			<span class=" fa-3x fables-main-text-color fables-second-hover-color"></span>
			<h2 class="font-16 semi-font fables-main-text-color my-3">절약금액</h2>
			<p class="font-16 fables-forth-text-color">
				<strong>총</strong>
			</p>
			<p class="font-18 fables-forth-text-color">
				<span>약<span class="result3">0</span>원
				</span>
			</p>
		</div>
	</div>

</div>
<div style="height: 20px"></div>
<div style="height: 20px"></div>
<br>
<!-- /End page content -->

<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
<script src="/resources/js/additional-methods.js"></script>
<script>
$("#compute").click(function () {
	var oil = Number($('input[name=a]').val());
	var mil = Number($("#b").val());
	var km = Number($("#c").val());
	var mon = Number($("#d").val());
	var year = Number($('input[name=e]').val());
	var model = $("#f").val();
	
	if(mil === 0 || km === 0||mon === 0||model=="0"||!($('input:radio[name=a]').is(':checked'))||!($('input:radio[name=e]').is(':checked'))){
		alert("입력란을 확인해주세요.");
		return false;
	}
	if(isNaN($("#b").val())){
		alert("연비를 확인해 주세요.");
		$("#b").focus();
		return false;
	}
	if(isNaN($("#c").val())){
		alert("주행거리를 확인해 주세요.");
		$("#c").focus();
		return false;
	}
	$.getJSON({
        type : "post",
        url : "/benefitSupport/evFuel",
        contentType:'application/json;charset=utf-8',
        data : model,
        success : function(data){
        	$("#modelname").empty();
            $("#modelname").append(model);          
            
        	var result1 = Math.round((km*mon*year)/mil*oil);
            $(".result1").empty();
            $(".result1").append(result1);        	
        	var result2 = Math.round((km*mon*year)/data*115.5);
            $(".result2").empty();
            $(".result2").append(result2);
            var result3 = result1 - result2;
            $(".result3").empty();
            $(".result3").append(result3);
        }
    })
})
</script>