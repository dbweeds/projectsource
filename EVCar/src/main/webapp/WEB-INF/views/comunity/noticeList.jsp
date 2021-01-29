<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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
				<li class="breadcrumb-item active" aria-current="page"
					style="font-weight: bolder">공지사항</li>
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">Q&A</a></li>
				<li class="breadcrumb-item"><a href="#"
					class="fables-second-text-color">관련 기사</a></li>
			</ol>
		</nav>
	</div>
</div>
<!-- /End Breadcrumbs -->

<!-- Start page content -->
<div class="container" style="margin-bottom:50px">
	<!-- Main content -->
	<section class="content">
		<div class="box box-primary">

			<div class="row">
				<div class="col-md-4 offset-md-4">
					<!--검색 들어갈 부분-->
					<form action="qnotice.do" method="post" id="search">
						<select name="criteria" id="">
							<option value="n"
								<c:out value="${empty info.search.criteria?'selected':''}" />>----</option>
							<option value="title"
								<c:out value="${info.search.criteria=='title'?'selected':''}" />>title
							</option>
							<option value="content"
								<c:out value="${info.search.criteria=='content'?'selected':''}" />>content</option>
							<option value="name"
								<c:out value="${info.search.criteria=='name'?'selected':''}" />>name</option>
						</select> <input type="text" name="keyword" value="${info.search.keyword}" />
						<input type="button" value="검색" class="btn btn-primary" />
					</form>
				</div>
			</div>
			<br>
			<div class="register">
				<button type="button" class="btn btn-primary" id="regBtn"
					style="float: right; margin-bottom: 3px">글 작성</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th class='text-center'>번호</th>
						<th class='text-center'>제목</th>
						<th class='text-center'>작성자</th>
						<th class='text-center'>작성일</th>
						<th class='text-center'>수정일</th>
						<th class='text-center'>조회수</th>
					</tr>

					<c:forEach var="notice" items="${notice}">
						<tr>
							<td><a href='/comunity/noticeGet?bno=<c:out value="${notice.bno}"/>'><c:out value="${notice.bno}"/></a></td>
							<td><c:out value="${notice.title}" /></td>
							<td><c:out value="${notice.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy-mm-dd"
									value="${notice.regDate}" /></td>
							<td><fmt:formatDate pattern="yyyy-mm-dd"
									value="${notice.updateDate}" /></td>
							<td><c:out value="${notice.readCnt}" /></td>
						</tr>
					</c:forEach>
				</thead>
			</table>
			<div class="modal" id="myModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">공지사항 작성완료</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>처리가 완료되었습니다.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 20px"></div>
</div>
<!-- /End page content -->

<!-- Start Footer 2 Background Image  -->
<script type="text/javascript">
	$(document).ready(
			function() {

				var result = '<c:out value="${result}"/>';

				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}

					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"공지사항 " + parseInt(result) + " 번이 등록되었습니다.");
					}

					$("#myModal").modal("show");
				}

				$("#regBtn").on("click", function() {
					self.location = "/comunity/noticeRegister";
				});
			});
</script>
<%@include file="../includes/footer.jsp"%>
