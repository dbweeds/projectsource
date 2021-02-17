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
<!-- /EndBreadcrumbs -->

<!-- Start page content -->
<div class="container" style="margin-bottom: 50px">
   <!-- Main content -->
   <section class="content">
      <div class="box box-primary">
         <br>
         <div class="register">
            <button type="button" class="btn btn-primary" id="regBtn"
               style="float: right; margin-bottom: 3px">글 작성</button>
         </div>
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
                     <td><c:out
                              value="${notice.bno}" /></td>
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
         <!-- 댓글 -->
         <div class='row'>
               <div class="col-lg-12">

                  <form id='searchForm' action="/comunity/noticeList" method='get'>
                     <select name='type'>
                        <option value=""
                           <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                        <option value="T"
                           <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                        <option value="C"
                           <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                        <option value="W"
                           <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                        <option value="TC"
                           <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
                           or 내용</option>
                     </select> <input type='text' name='keyword'
                        value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
                        type='hidden' name='pageNum'
                        value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
                        type='hidden' name='amount'
                        value='<c:out value="${pageMaker.cri.amount}"/>' />
                     <button class='btn btn-default'>검색</button>
                  </form>
               </div>
            </div>
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
               value='<c:out value="${ pageMaker.cri.keyword }"/>'>


         </form>
         </div>
      </div>
   </section>
   <div style="height: 20px"></div>
</div>
<!-- /End page content -->
<%@include file="../includes/footer.jsp"%>
<!-- Start Footer 2 Background Image  -->
<script type="text/javascript">
$(document).ready(function() {
   var searchForm = $("#searchForm");
$("#searchForm button").on(
      "click",
      function(e) {

         if (!searchForm.find("option:selected")
               .val()) {
            alert("검색종류를 선택하세요");
            return false;
         }

         if (!searchForm.find(
               "input[name='keyword']").val()) {
            alert("키워드를 입력하세요");
            return false;
         }

         searchForm.find("input[name='pageNum']")
               .val("1");
         e.preventDefault();

         searchForm.submit();

      });
      });
</script>
<script type="text/javascript">
               $(function() {
                  var admin = '<%=(String)session.getAttribute("admin")%>';
                  
                  if(admin == "null"){
                       $("#regBtn").hide();
                   }
                  var result = '<c:out value="${result}"/>';

                  checkModal(result);

                  history.replaceState({}, null, null);

                  function checkModal(result) {

                     if (result === '' || history.state) {
                        return;
                     }

                     if (parseInt(result) > 0) {
                        $(".modal-body").html(
                              "게시글 " + parseInt(result)
                                    + " 번이 등록되었습니다.");
                     }

                     $("#myModal").modal("show");
                  }

                  $("#regBtn").on("click", function() {

                     self.location = "/comunity/noticeRegister";

                  });

                  var actionForm = $("#actionForm");

                  $(".page-item a").on(
                        "click",
                        function(e) {

                           e.preventDefault();

                           console.log('click');

                           actionForm.find("input[name='pageNum']")
                                 .val($(this).attr("href"));
                           actionForm.submit();
                        });

                  $(".move")
                        .on(
                              "click",
                              function(e) {

                                 e.preventDefault();
                                 actionForm
                                       .append("<input type='hidden' name='bno' value='"
                                             + $(this).attr(
                                                   "href")
                                             + "'>");
                                 actionForm.attr("action",
                                       "/comunity/noticeGet");
                                 actionForm.submit();

                              });

                  var searchForm = $("#searchForm");

                  $("#searchForm button").on(
                        "click",
                        function(e) {

                           if (!searchForm.find("option:selected")
                                 .val()) {
                              alert("검색종류를 선택하세요");
                              return false;
                           }

                           if (!searchForm.find(
                                 "input[name='keyword']").val()) {
                              alert("키워드를 입력하세요");
                              return false;
                           }

                           searchForm.find("input[name='pageNum']")
                                 .val("1");
                           e.preventDefault();

                           searchForm.submit();

                        });

               });
</script>