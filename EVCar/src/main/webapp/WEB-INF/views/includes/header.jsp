<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="Fables" />
<meta name="author" content="Enterprise Development" />
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="shortcut icon"
	href="/resources/assets/custom/images/favicon-01.ico" />

<title>전기차의 모든것</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<!-- animate.css-->
<link href="/resources/assets/vendor/animate.css-master/animate.min.css"
	rel="stylesheet" />
<!-- Load Screen -->
<link href="/resources/assets/vendor/loadscreen/css/spinkit.css"
	rel="stylesheet" />
<!-- GOOGLE FONT -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet" />
<!-- Font Awesome 5 -->
<link
	href="/resources/assets/vendor/fontawesome/css/fontawesome-all.min.css"
	rel="stylesheet" />
<!-- Fables Icons -->
<link href="/resources/assets/custom/css/fables-icons.css"
	rel="stylesheet" />
<!-- Bootstrap CSS -->
<link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="/resources/assets/vendor/bootstrap/css/bootstrap-4-navbar.css"
	rel="stylesheet" />
<!-- portfolio filter gallery -->
<link
	href="/resources/assets/vendor/portfolio-filter-gallery/portfolio-filter-gallery.css"
	rel="stylesheet" />
<!-- Video Background -->
<link
	href="/resources/assets/vendor/video-background/video-background.css"
	rel="stylesheet" />
<!-- FANCY BOX -->
<link
	href="/resources/assets/vendor/fancybox-master/jquery.fancybox.min.css"
	rel="stylesheet" />
<!-- RANGE SLIDER -->
<link href="/resources/assets/vendor/range-slider/range-slider.css"
	rel="stylesheet" />
<!-- OWL CAROUSEL  -->
<link href="/resources/assets/vendor/owlcarousel/owl.carousel.min.css"
	rel="stylesheet" />
<link
	href="/resources/assets/vendor/owlcarousel/owl.theme.default.min.css"
	rel="stylesheet" />
<!-- FABLES CUSTOM CSS FILE -->
<link href="/resources/assets/custom/css/custom.css" rel="stylesheet" />
<!-- FABLES CUSTOM CSS RESPONSIVE FILE -->
<link href="/resources/assets/custom/css/custom-responsive.css"
	rel="stylesheet" />
</head>

<body>
	<div class="search-section">
		<a class="close-search" href="#"></a>
		<div class="d-flex justify-content-center align-items-center h-100">
			<form method="get" action="/comunity/allSearch" class="w-50">
				<div class="row">
					<div class="col-10">
					<!-- 통합검색칸 -->
						<input type="search" value="" name="keyword"
							class="form-control palce bg-transparent border-0 search-input"
							placeholder="검색할 내용을 입력해주세요" />
							<input type="hidden" name="type" value="TC"/>
					</div>
					<div class="col-2 mt-3">
						<button type="submit" class="btn bg-transparent text-white">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Loading Screen -->
	<div id="ju-loading-screen">
		<div class="sk-double-bounce">
			<div class="sk-child sk-double-bounce1"></div>
			<div class="sk-child sk-double-bounce2"></div>
		</div>
	</div>

	<!-- Start Fables Navigation -->
	<div class="fables-navigation py-3 py-lg-0"
		style="z-index: 100; position: fixed; width: 100%; background-color: #21252980;">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-10 col-lg-9 pr-md-0">
					<nav class="navbar navbar-expand-md btco-hover-menu py-lg-2">
						<a class="navbar-brand pl-0" href="../"><img
							src="/resources/assets/custom/images/EVCarlogo.png"
							alt="Fables Template" class="fables-logo" /></a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#fablesNavDropdown"
							aria-controls="fablesNavDropdown" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="fables-iconmenu-icon text-white font-16"></span>
						</button>
						<div class="collapse navbar-collapse" id="fablesNavDropdown">
							<ul class="navbar-nav mx-auto fables-nav">
								<li class="nav-item dropdown"><a class="nav-link" href="../"
									id="sub-nav1" aria-haspopup="true" aria-expanded="false">
										Home </a></li>

								<li class="nav-item dropdown"><a class="nav-link" href="../int/int1"
									id="sub-nav1" aria-haspopup="true" aria-expanded="false">
										전기차 </a>
									<ul class="dropdown-menu" aria-labelledby="sub-nav1">
										<li><a class="dropdown-item" href="../int/int1">전기차란</a></li>
										<li><a class="dropdown-item" href="../int/int2">보급 목적</a>
										</li>
									</ul></li>
								<li class="nav-item dropdown"><a class="nav-link" href="../info/list"
									id="sub-nav4" aria-haspopup="true" aria-expanded="false">
										전기차 모델 </a></li>
								<li class="nav-item dropdown"><a class="nav-link" href="../benefitSupport/test"
									id="sub-nav5" aria-haspopup="true" aria-expanded="false">
										전기차 계산 </a>
									<ul class="dropdown-menu" aria-labelledby="sub-nav5">
										<li><a class="dropdown-item" href="../benefitSupport/test">보조금지원
												범위 및 해택</a></li>
										<li><a class="dropdown-item" href="../benefitSupport/PCAmount">구매비용계산</a>
										</li>
										<li><a class="dropdown-item" href="../benefitSupport/SvAmount">절약금액계산</a></li>
									</ul></li>
								<li class="nav-item dropdown"><a class="nav-link" href="../chargerMap/map"
									id="sub-nav6" aria-haspopup="true" aria-expanded="false">
										충전소 </a></li>
								<li class="nav-item dropdown"><a class="nav-link" href="../comunity/noticeList"
									id="sub-nav7" aria-haspopup="true" aria-expanded="false">
										커뮤니티 </a>
									<ul class="dropdown-menu" aria-labelledby="sub-nav7">
										<li><a class="dropdown-item" href="../comunity/noticeList">공지
												사항</a></li>
										<li><a class="dropdown-item" href="../comunity/QAList">Q & A</a></li>
										<li><a class="dropdown-item" href="../news/news">관련 기사</a></li>
									</ul></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="col-12 col-md-2 col-lg-3 pr-md-0 icons-header-mobile">
					<div class="fables-header-icons">
						<a href="/comunity/allSearch"
							class="open-search fables-third-text-color right top-header-link px-3 px-md-2 px-lg-4 fables-second-hover-color border-0 max-line-height">
							<span class="fables-iconsearch-icon"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /End Fables Navigation -->