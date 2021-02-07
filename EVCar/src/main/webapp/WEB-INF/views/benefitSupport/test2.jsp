<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules">
    <div class="container"> 
         <h2 class="fables-page-title fables-second-border-color wow fadeInLeft" data-wow-duration="1.5s" style="margin-top: 90px">공지사항</h2>
    </div>
</div>  
<!-- /End Header -->
     
<!-- Start Breadcrumbs -->
<div class="fables-light-background-color">
    <div class="container"> 
        <nav aria-label="breadcrumb">
          <ol class="fables-breadcrumb breadcrumb px-0 py-3">
            <li class="breadcrumb-item"><a href="#" class="fables-second-text-color">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">보조금지원 및 해택</li>
            <li class="breadcrumb-item"><a href="#" class="fables-second-text-color">구매비용계산</a></li>
            <li class="breadcrumb-item"><a href="#" class="fables-second-text-color">절약금액계산</a></li>
          </ol>
        </nav> 
    </div>
</div>
<!-- /End Breadcrumbs -->
     
<!-- Start page content -->  
       
        <!-- 여기가 매인컨택츠 컨테이너 -->
        <div class="tit_sec" style="text-align: center;padding: 30px 0">
                    <h2>절약 금액 계산</h2>
                    <p>전기차 와 내연 기관 차량 대비 절약되는 금액을 계산해보기(완속충전기준)</p>
                </div>
                <div  class="fables" style="padding: 70px 0;background: #f2f2f2">
                <div class="container">
                    <div class="">
                        <table class="" style="margin:auto;text-align:center;">
                            <caption style="text-align: center">절약금액계산기</caption>
                            <colgroup>
                                <col width="188px" />
                                <col width="302px" />
                                <col width="158px" />
                                <col width="*" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">엔진</th>
                                    <td class=" ">
                                        <a href="javascript:void(0);" class="butt1">가솔린</a><a href="javascript:void(0);" class="butt2">디젤</a>
                                        <div class="">
                                            <input type="radio" name="a" id="a1" value="1500"> <label for="a1"> 가솔린</label>
                                            <input type="radio" name="a" id="a2" value="1300"> <label for="a2"> 디젤</label>
                                        </div>
                                    </td>
                                    <th scope="row">복합연비(km/l)</th>
                                    <td><input type="text" id="b" placeholder="보유 차량 표준연비를 입력하세요.(숫자)" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">하루 주행거리(km)</th>
                                    <td><input type="text" id="c" placeholder="하루 주행거리를 입력하세요.(숫자)" /></td>
                                    <th scope="row">한달 주행 횟수</th>
                                    <td>
                                        <select name="" id="d">
                                            <option value="">한달 주행 횟수를 선택하세요.</option>
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
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">차량 운행 기간(년)</th>
                                    <td class="">
                                        <a href="javascript:void(0);" class="butt1">1년</a><a href="javascript:void(0);" class="butt2">2년</a><a href="javascript:void(0);" class="butt3">3년</a><a href="javascript:void(0);" class="butt4">4년</a><a href="javascript:void(0);" class="butt5">5년</a>
                                        <div class="">
                                            <input type="radio" name="e" id="e1" value="1"> 1 
                                            <input type="radio" name="e" id="e2" value="2"> 2 
                                            <input type="radio" name="e" id="e3" value="3"> 3 
                                            <input type="radio" name="e" id="e4" value="4"> 4 
                                            <input type="radio" name="e" id="e5" value="5"> 5 
                                        </div>
                                    </td>
                                    <th scope="row">전기차 모델</th>
                                    <td>
                                        <select name="" id="f">
                                            <option value="">원하는 전기차 모델을 선택하세요.</option>
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
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="" style="margin:auto;text-align:center;">
                            <button id="compute" type="button">계산하기</button>
                        </div>
                    </div>
                </div>
                </div>
                <div  class="fables" style="padding: 50px 0 ;text-align: center;">
	                <div class="container">
	                   <dl class="" style="float: left;width: 50%;">
                            <dt>보유차량기준</dt>
                            <dd><strong>주유비</strong><span>약<span class="result1">0</span>원</span></dd>
                        </dl>
                        <dl class=""  style="float: right;width: 50%;">
                            <dt><span id="modelname">차량</span>모델 기준</dt>
                            <dd><strong>전기차 충전비</strong><span>약<span class="result2">0</span>원</span></dd>
                        </dl>
	                </div>
	                <div class="container" style="margin-top:100px; text-align: center;">
	                   <dl>
                            <dt>절약 금액</dt>
                            <dd>약<span class="result3">0</span>원</dd>
                        </dl>
	                </div>
                </div>
<!-- /End page content -->
    
<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp" %> 
<script>
$("#compute").click(function () {
	var oil = Number($('input[name=a]').val());
	var mil = Number($("#b").val());
	var km = Number($("#c").val());
	var mon = Number($("#d").val());
	var year = Number($('input[name=e]').val())
	var model = $("#f").val();
	
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

