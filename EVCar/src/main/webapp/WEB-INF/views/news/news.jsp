<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp"%>
<link
      href="/resources/newscss/newsCss.css"
      rel="stylesheet"
    />
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules">
	<div class="container">
		<h2
			class="fables-page-title fables-second-border-color wow fadeInLeft"
			data-wow-duration="1.5s" style="margin-top: 90px">News</h2>
	</div>
</div>
<!-- /End Header -->

<!-- Start Breadcrumbs -->
<div class="fables-light-background-color">
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="fables-breadcrumb breadcrumb px-0 py-3">
				<li class="breadcrumb-item"><a href="/"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item"><a href="../comunity/noticeList"
					class="fables-second-text-color">공지 사항</a></li>
				<li class="breadcrumb-item"><a href="../comunity/QAList"
					class="fables-second-text-color">Q&A</a></li>
				<li class="breadcrumb-item active" aria-current="page"style="color: black;"><b>관련 기사</b></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /End Breadcrumbs -->

<!-- Start page content -->
<div class="container" id="oderby"> <br>
			<button type="button" class="btn btn-primary" id="sim" style="width:90px">정확도순</button>
			<button type="button" class="btn btn-outline-secondary" id="recently" style="width:90px">최신순</button>
</div>
<div class="container">
<div class="container">
	<!-- Main content -->
	<br>
	<section class="content">
		<div class="box box-primary">
			<table class="table">
				<thead>
				<tr>
					<th class='text-center'>제 목</th>
					<th class='text-center' style='width: 300px'>날 짜</th>
				</tr>
				</thead>
				<tbody class="newspaper">			
					<!-- 리스트 목록 보여주기 -->				
				</tbody>	
			</table>
			<!-- <div class="text-center"> -->
			
			<div class="panel-footer"></div>
			<div style="height: 20px"></div>
		</div>
	</section>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<%@include file="../includes/footer.jsp"%>
<script src="/resources/js/news.js"></script>
<script>
$(function(){
	getList(1,1);	
})	
</script>
<!-- /End page content -->

<!-- Start Footer 2 Background Image  -->