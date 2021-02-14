<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/headerMain.jsp" %>
    <!-- Start page content -->
    <div class="fables-page-content">
      <div class="container overflow-hidden">
        <h2
          class="text-center fables-main-text-color font-35 my-4 my-lg-5 smaller-head-text"
        >
          지금 한국에서 제일 인기 있는 전기차 Best3
        </h2>
        <div class="row" id="carcount">
        </div>
      </div>
      </div>
      <div class="container-fluid overflow-hidden">
        <div class="row mt-0 mt-lg-5">
          <div class="col-12 col-md-6 p-0">
            <div
              style="background-image: url(/resources/assets/custom/images/overlay1.jpg)"
            >
              <div class="fables-second-color-transparent p-6">
                <h2
                  class="white-color font-weight-bold mb-4 font-35 wow fadeInLeft"
                >
                  전기차 <br />금액알아보기
                </h2>
                <p class="fables-third-text-color wow fadeInLeft">
                  내가 원하는 모델의 현재 가격, 정부 보조지원금 , <br />
                  시별 지원금을 확인해 금액을 알아볼수있습니다.
                </p>
                <a
                  href="#"
                  class="btn border border-white white-color rounded-0 my-4 py-2 px-5 wow fadeInLeft bg-white-hover fables-second-hover-color"
                  >지금 알아보기</a
                >
              </div>
            </div>
          </div>
          <div class="col-12 col-md-6 px-6">
            <div class="row">
              <div
                class="col-12 col-sm-6 my-4 text-center text-md-left wow fadeInRight"
              >
                <span
                  class="fables-iconbussiness fables-second-text-color fa-3x"
                ></span>
                <h2 class="fables-main-text-color font-18 my-2">회사 목표</h2>
                <p class="fables-forth-text-color font-weight-light">
                  전기차 알아보기 쉽게 만드는 사람들
                </p>
              </div>
              <div
                class="col-12 col-sm-6 my-4 text-center text-md-left wow fadeInRight"
              >
                <span
                  class="fables-iconbussiness2 fables-second-text-color fa-3x"
                ></span>
                <h2 class="fables-main-text-color font-18 my-2">도움주신분</h2>
                <p class="fables-forth-text-color font-weight-light">
                  주식회사 솔데스크 / 다나와 / 네이버 / bootstrap
                </p>
              </div>
              <div
                class="col-12 col-sm-6 my-4 text-center text-md-left wow fadeInRight"
              >
                <span
                  class="fables-iconbussiness3 fables-second-text-color fa-3x"
                ></span>
                <h2 class="fables-main-text-color font-18 my-2">
                  광고 및 자동차 정보
                </h2>
                <p class="fables-forth-text-color font-weight-light">
                  전기차의 모든것 연락처 망인 email을 이용해 연락 주세요
                </p>
              </div>
              <div
                class="col-12 col-sm-6 my-4 text-center text-md-left wow fadeInRight"
              >
                <span
                  class="fables-iconbussiness4 fables-second-text-color fa-3x"
                ></span>
                <h2 class="fables-main-text-color font-18 my-2">
                  전기차의 보조금
                </h2>
                <p class="fables-forth-text-color font-weight-light">
                  보조금은 각년도 마다 다를수 있으므로 금액을 참고 부탁드립니다.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-12">
            <h2
              class="font-35 font-weight-bold fables-main-text-color my-3 my-lg-5 my-md-4 text-center"
            >
              최신 전기차 관련 뉴스
            </h2>
          </div>
          <div
            class="col-12 col-md-4 mb-4 mb-lg-5 wow fadeIn"
            data-wow-delay=".3s"
          >
            <div class="position-relative">
              <div class="image-container translate-effect-right">
                <img
                    src="/resources/intImages/news1.png"
                    alt=""
                    class="img-fluid w-100"
                />
                <span
                  class="above-date position-absolute text-center fables-second-background-color white-color px-3 py-2"
                >
                  
                  <span class="bold-font day" id="newsmm1"></span>
                  <span class="month d-block" id="newsdd1"></span>
                </span>
              </div>

              <h2 class="font-14 my-3" id="indexNews1"></h2>
	<div style="height: 5px"></div>
              <p class="fables-forth-text-color font-14 mb-2" id="newsLink1"><a
                href="http://biz.khan.co.kr/khan_art_view.html?artid=202101251608001&code=920508"
                class="btn fables-second-text-color fables-main-hover-color p-0 font-15 border-0"
                >읽으러 가기 <i class="fas fa-long-arrow-alt-right"></i
              ></a></p>
              
            </div>
          </div>
          <div
            class="col-12 col-md-4 mb-4 mb-lg-5 wow fadeIn"
            data-wow-delay=".6s"
          >
            <div class="position-relative">
              <div class="image-container translate-effect-right">
                <img
                    src="/resources/intImages/news1.png"
                    alt=""
                    class="img-fluid w-100"
                />
                <span
                  class="above-date position-absolute text-center fables-second-background-color white-color px-3 py-2"
                >
                  <span class="bold-font day" id="newsmm2"></span>
                  <span class="month d-block" id="newsdd2"></span>
                </span>
              </div>
              <h2 class="font-14 my-3" id="indexNews2">
               
              </h2>
			<div style="height: 5px"></div>
              <p class="fables-forth-text-color font-14 mb-2" id="newsLink2"><a
                href="http://news.kmib.co.kr/article/view.asp?arcid=0924175368&code=11151400&cp=nv"
                class="btn fables-second-text-color fables-main-hover-color p-0 font-15 border-0"
                >읽으러 가기 <i class="fas fa-long-arrow-alt-right"></i
              ></a></p>
              
            </div>
          </div>
          <div
            class="col-12 col-md-4 mb-4 mb-lg-5 wow fadeIn"
            data-wow-delay=".9s"
          >
            <div class="position-relative">
              <div class="image-container translate-effect-right">
                <a href="#"
                  ><img
                    src="/resources/intImages/news1.png"
                    alt=""
                    class="img-fluid w-100"
                /></a>
                <span
                  class="above-date position-absolute text-center fables-second-background-color white-color px-3 py-2"
                >
                  <span class="bold-font day" id="newsmm3"></span>
                  <span class="month d-block" id="newsdd3"></span>
                </span>
              </div>
              <h2 class="font-14 my-3" id="indexNews3">
                
              </h2>
				<div style="height: 5px"></div>
              <p class="fables-forth-text-color font-14 mb-2" id="newsLink3"><a
                href="https://weekly.donga.com/3/all/11/2387809/1"
                class="btn fables-second-text-color fables-main-hover-color p-0 font-15 border-0"
                >읽으러 가기 <i class="fas fa-long-arrow-alt-right"></i
              ></a></p>
              
            </div>
          </div>
        </div>
      </div>

      <div
        class="fables-testimonial fables-after-overlay bg-rules py-4 py-lg-5"
      >
        <div class="container">
          <div class="row">
            <div class="col-12 col-md-8">
              <h3
                class="position-relative z-index white-color mb-3 font-25 font-weight-bold"
              >
                개선사항 요청
              </h3>
              <p
                class="position-relative z-index font-weight-light fables-third-text-color"
              >
                홈페이지에 문제가 생긴다면 Q & A를 통해 내용을 접수 해주세요
              </p>
            </div>
            <div class="col-12 col-md-4 offset-xl-2 col-xl-2 text-center">
              <a
                href=""
                class="btn fables-second-background-color fables-btn-rounded white-color mt-3 position-relative z-index font-19 px-5 white-color-hover"
                >Q & A 바로가기</a
              >
            </div>
          </div>
        </div>
      </div>

      <div class="fables-light-background-color" style="padding-bottom: 50px;">
        <div class="container">
            <div class="row">
              <div class="col-12">
                  <h2 class="font-35 font-weight-bold fables-main-text-color my-3 my-lg-5 my-md-4 text-center">관련 페이지</h2>
              </div>
               <div class="owl-carousel owl-theme nav-0 carousel-items-6 dots-0">
                
            <div> 
                <a href="https://www.tesla.com/ko_KR/"> <img src="/resources/assets/custom/images/tesla.png" alt="Fables Template" class="border-hover fables-partner-carousel-img"> </a>
             </div>
             <div> 
                 <a href="https://auto.naver.com/"><img src="/resources/assets/custom/images/naver.png" alt="Fables Template" class="border-hover fables-partner-carousel-img"></a>  
             </div>
             <div> 
                  <a href="http://auto.danawa.com/"><img src="/resources/assets/custom/images/danawa.png" alt="Fables Template" class="border-hover fables-partner-carousel-img"> </a> 
             </div>
             <div> 
                  <a href="https://www.kia.com/kr/main.html"><img src="/resources/assets/custom/images/kia.png" alt="Fables Template" class="border-hover fables-partner-carousel-img"> </a> 
             </div>
             <div> 
                  <a href="https://www.hyundai.com/kr/ko/e"><img src="/resources/assets/custom/images/hyundai.png" alt="Fables Template" class="border-hover fables-partner-carousel-img"></a>
             </div>
             <div> 
                  <a href="https://www.chevrolet.co.kr/index.jsp"><img src="/resources/assets/custom/images/chevrolet.png" alt="Fables Template" class="border-hover fables-partner-carousel-img"></a>  
             </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /End page content -->

    <!-- Start Footer 2 Background Image  -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
 <script src=" /resources/js/index.js"></script>   
 <script type="text/javascript">
$(function(){
	getList();	
})	
$(function() {
    $.getJSON("info/countlist", function(data) {
        for(var i = 0;i < 3 ; i++) {
            var str = '<div class="col-12 col-sm-4 mb-4 wow fadeInUpBig" data-wow-duration="2s">';
            str += '<div class="image-container translate-effect-right">'
            str += '<a href="info/count?bno='+data[i].bno+'">'
            str += '<img src="/resources/assets/custom/infoimage/'+data[i].thumbnail+'" alt="" class="img-fluid w-100" /></a></div>'
            str += '<h2 class="font-22 mt-3 mb-2 d-block text-center text-md-left">'
            str += '<a href="info/count?bno='+data[i].bno+'" class="fables-second-text-color fables-main-hover-color">'+data[i].carname+'</a></h2>'
            str += '<p class="fables-forth-text-color light-font d-none d-md-block">'
            str += data[i].releasedate+' 출시 : '+data[i].cartype+' : 전기 <br />'
            str += '연비 '+data[i].fuel+' km/kWh</p></div>'
            $("#carcount").append(str);
        
        }
    })
})
</script>
<%@include file="includes/footer.jsp" %>   