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
            <li class="breadcrumb-item active" aria-current="page">전기차 충전소</li>
          </ol>
        </nav> 
    </div>
</div>
<!-- /End Breadcrumbs -->
     
<!-- Start page content -->  
       <div class="container">
        <!-- 여기가 매인컨택츠 컨테이너 -->
        <div id="map" style="width:100%;height:800px;">
        	
        </div>
     </div>
<!-- /End page content -->
    
<!-- Start Footer 2 Background Image  -->
<%@include file="../includes/footer.jsp" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=k7zd4tsqx0"></script>
<script>
	var mapOptions = {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	};

	var map = new naver.maps.Map('map', mapOptions);
</script>   
