<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<style>
	p a{
		color:black;
	}
	h3{
		padding-bottom: 15px
	}
</style>
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules" style="background-image: url(/resources/assets/custom/images/EVcar_header_03.png)">
	<div class="container">
		<h2
			class="fables-page-title fables-second-border-color wow fadeInLeft"
			data-wow-duration="1.5s" style="margin-top: 90px">통합 검색</h2>
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
            <li class="breadcrumb-item" style="font-weight: bolder">검색어 : ${cri.keyword}</li>
         </ol>
      </nav>
   </div>
</div>
<h2>${keyword}</h2>
<!-- /EndBreadcrumbs -->
<!-- Start page content -->
<div class="container" style="margin-bottom: 50px">
   <!-- Main content -->
   <section class="content">
      <div class="box box-primary">
         <br>
         <div class="table" style="text-align:center">
         <h3>공지사항</h3>
         	<div>
         		<div style="display: inline-block;width: 8%;height: 60px"><p>번호</p></div>
         		<div style="display: inline-block;width: 30%;height: 60px"><p>제목</p></div>
         		<div style="display: inline-block;width: 8%;height: 60px"><p>작성자</p></div>
         		<div style="display: inline-block;width: 49%;height: 60px"><p>내용</p></div>
         	</div>
         		<c:forEach var="notice" items="${Nkeyword}" begin="0" end="4">
         	<div>
                  	<div style="display: inline-block;width: 8%;height: 60px;overflow: hidden;"><p>${notice.bno}</p></div>
	         		<div style="display: inline-block;width: 30%;height: 60px;overflow: hidden;"><p><a
                        href='/comunity/noticeGet?bno=<c:out value="${notice.bno}"/>'><c:out value="${notice.title}" /></a></p></div>
	         		<div style="display: inline-block;width: 8%;height: 60px;overflow: hidden;"><p>${notice.writer}</p></div>
	         		<div style="display: inline-block;width: 49%;height: 60px;overflow: hidden;"><p><a
                        href='/comunity/noticeGet?bno=<c:out value="${notice.bno}"/>'><c:out value="${notice.content}" /></a></p></div>
         	</div>
               </c:forEach>
         </div>
         </div>
          <div class="text-center" style="text-align:center">
               <p><a href='noticeList?type=TC&keyword=${cri.keyword}'>더보기...</a></p>
         </div>
         <hr>
         <div class="box box-primary">
         <br>
         <div class="table" style="text-align:center">
         <h3>Q&A</h3>
         
         	<div>
         		<div style="display: inline-block;width: 8%;height: 60px"><p>번호</p></div>
         		<div style="display: inline-block;width: 30%;height: 60px"><p>제목</p></div>
         		<div style="display: inline-block;width: 8%;height: 60px"><p>작성자</p></div>
         		<div style="display: inline-block;width: 49%;height: 60px"><p>내용</p></div>
         	</div>
         		<c:forEach var="notice" items="${Qkeyword}" begin="0" end="4">
         	<div>
                  	<div style="display: inline-block;width: 8%;height: 60px;overflow: hidden;"><p>${notice.bno}</p></div>
	         		<div style="display: inline-block;width: 30%;height: 60px;overflow: hidden;"><p><a
                        href='/comunity/password?bno=<c:out value="${notice.bno}"/>'><c:out value="${notice.title}" /></a></p></div>
	         		<div style="display: inline-block;width: 8%;height: 60px;overflow: hidden;"><p>${notice.writer}</p></div>
	         		<div style="display: inline-block;width: 49%;height: 60px;overflow: hidden;"><p><a
                        href='/comunity/password?bno=<c:out value="${notice.bno}"/>'><c:out value="${notice.content}" /></a></p></div>
         	</div>
               </c:forEach>
         </div>
          <div class="text-center" style="text-align:center">
               <p><a href='QAList?type=TC&keyword=${cri.keyword}'>더보기...</a></p>
         </div>
      </div>
       <hr>
   </section>
   <div style="height: 20px"></div>
</div>
<!-- /End page content -->
<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">

</script>
         