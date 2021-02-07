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
                    <h2>구매 금액 계산</h2>
                    <p>전기차 구매의 지역별, 모델별로의 금액을 계산해보기</p>
                </div>
                <div  class="fables" style="padding: 70px 0;background: #f2f2f2">
                <div class="container">
                    <div class="">
                        <table class="" style="margin:auto;text-align:center;">
                            <caption style="text-align: center">구입금액계산기</caption>
                            <colgroup>
                                <col width="188px" />
                                <col width="302px" />
                                <col width="158px" />
                                <col width="*" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">사는 지역</th>
                                    <td>
                                        <select id="area">
							                <option value="">시도</option>
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
							            </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">전기차 모델</th>
                                    <td>
                                        <select name="" id="model">
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
	                <div class="container" style="margin-top:10px; text-align: center;">
	                   <dl>
                            <dt>지역별 지원금</dt>
                            <dd>약<span class="result1">0</span>원</dd>
                        </dl>
	                </div>
	                <div class="container" style="margin-top:30px; text-align: center;">
	                   <dl>
                            <dt>모델별 지원금</dt>
                            <dd>약<span class="result2">0</span>원</dd>
                        </dl>
	                </div>
	                <div class="container" style="margin-top:30px; text-align: center;">
	                   <dl>
                            <dt>총 구입금액(시마다의 최소지원금으로 측정)</dt>
                            <dd>약<span class="result3">0</span>원</dd>
                        </dl>
	                </div>
	                <div class="container detail" style="margin-top:30px; text-align: center;">
	                </div>
                </div>
<!-- /End page content -->
    
<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp" %> 
<script>
$("#compute").click(function () {
	var area = Number($("#area").val());
	var model = $("#model").val();
	
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

