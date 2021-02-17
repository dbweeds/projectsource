<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
    <!-- Start Header -->
    <div
      class="fables-header fables-after-overlay overlay-lighter bg-rules"
      style="
        background-image: url(/resources/assets/custom/images/EVcar_header_10.png);
        height: 450px;
      "
    >
   
      <div class="container overflow-hidden">
        
        <div
          class="owl-carousel owl-theme default-carousel fables-sqr-nav dots-0 wow fadeInUpBig"
          data-wow-duration="2s"
          style="z-index: 9;
                margin: 55px 0px 0px;"
        >
          <div>
            <h1 class="white-color bold-font mt-lg-5 mb-4">
              친환경 <br />
              <span class="fables-second-text-color">전기차의 모든것</span>
            </h1>
            <p
              class="fables-third-text-color mt-3 mb-5 light-font fables-header-slider-details"
            >
              전기차가 모든것이 궁금하다면?
            </p>

            <a
              href="int/int1"
              class="btn fables-second-border-color white-color rounded-0 px-md-4 py-2 fables-second-hover-background-color"
              >더 보기</a
            >
          </div>
          <div>
            <h1 class="white-color bold-font mt-lg-5 mb-4">
              충전소 <br />
              <span class="fables-second-text-color">전기차 충전소</span>
            </h1>
            <p
              class="fables-third-text-color mt-3 mb-5 light-font fables-header-slider-details"
            >
              내 주변 전기차 충전소, 궁금한 위치 주변의 전기차 충전소 위치를 알고싶다면?
            </p>
            <a
              href="/chargerMap/map"
              class="btn fables-second-border-color white-color rounded-0 px-md-4 py-2 fables-second-hover-background-color"
              >더 보기</a
            >
          </div>
        </div>
      </div>
    </div>
    <!-- /End Header -->
