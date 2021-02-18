<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules" style="background-image: url(/resources/assets/custom/images/EVcar_header_03.png)">
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
            <li class="breadcrumb-item" style="font-weight: bolder"><a href="/comunity/noticeList">공지사항</a></li>
            <li class="breadcrumb-item" ><a href="/comunity/QAList"
               class="fables-second-text-color">Q&A</a></li>
            <li class="breadcrumb-item"><a href="../news/news"
               class="fables-second-text-color">관련 기사</a></li>
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
         <table class="table" style="text-align:center">
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
                  <tr class="contentTr">
                     <td><c:out value="${notice.bno}" /></td>
                     <td><a
                        href='/comunity/noticeGet?bno=<c:out value="${notice.bno}"/>'><c:out value="${notice.title}" /></a></td>
                     <td><c:out value="${notice.writer}" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${notice.regDate}" /></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${notice.updateDate}" /></td>
                     <td><c:out value="${notice.readCnt}" /></td>
                  </tr>
               </c:forEach>
            </thead>
         </table>
          <div class="text-center" style="text-align:center">
               <ul class="pagination" style="display:inline-block">
               <c:if test="${pageMaker.prev}">
                  <li class="page-item"><a
                     href="${pageMaker.startPage -1}" class="page-link">이전</a></li>
               </c:if>

               <c:forEach var="num" begin="${pageMaker.startPage}"   end="${pageMaker.endPage}">
                  <li
                     class="page-item ${pageMaker.cri.pageNum == num ?'active':''} " style="float:left; margin-top:10px;">
                     <a href="${num}" class="page-link">${num}</a>
                  </li>
               </c:forEach>

               <c:if test="${pageMaker.next}">
                  <li class="page-item" ><a 
                     href="${pageMaker.endPage +1 }" class="page-link">다음</a></li>
               </c:if>
            </ul>
            <form id="actionForm" action="/comunity/noticeList" method="get">
               <input type="hidden" name="pageNum"
                  value="${pageMaker.cri.pageNum}"> <input type="hidden"
                  name="amount" value="${pageMaker.cri.amount}">
            </form>
            <div class="modal" id="myModal" tabindex="-1">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h5 class="modal-title">공지사항</h5>
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
            <form id='actionForm' action="/comunity/noticeList" method='get'>
           		 <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

            	<input type='hidden' name='type'
               value='<c:out value="${ pageMaker.cri.type }"/>'> <input
               type='hidden' name='keyword'
               value='<c:out value="${keyword}"/>'>


         </form>
         </div>
      </div>
   </section>
   <div style="height: 20px"></div>
</div>
<!-- /End page content -->
<%@include file="../includes/footer.jsp"%>
         