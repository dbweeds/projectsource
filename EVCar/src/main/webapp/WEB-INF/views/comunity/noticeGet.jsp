<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">notice Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="container"
				style="border-style: solid; border-width: 1.5px">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item active" aria-current="page"><c:out
								value="${notice.title}" /></li>
					</ol>
				</nav>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="form-group">
						<label>공지사항 번호</label> <input class="form-control" name="bno"
							value='<c:out value="${notice.bno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1" style="text-weight: bolder">제목</label>
						<input class="form-control" id="exampleFormControlInput1"
							name='title' value='<c:out value="${notice.title}" />'
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleFormControlInput1" style="text-weight: bolder">작성자</label>
						<input class="form-control" id="exampleFormControlInput1"
							name='writer' value='<c:out value="${notice.writer}" />'
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${notice.content}" /></textarea>
					</div>
					<div>

						<button data-oper='modify' class="btn btn-primary">수정</button>
						<button data-oper='notice' class="btn btn-primary"
							onclick="location.href='/comunity/noticeList'">목록</button>
					</div>
					<form id='operForm' action="/comunity/noticeModify" method="get">
						<input type='hidden' id='bno' name='bno'
							value='<c:out value="${notice.bno}"/>'>
							 <%-- <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'> --%>

					</form>
				</div>
			</div>
			<!-- end panel-body -->
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/comunity/noticeModify").submit();
    
  });
});
</script>
<%@include file="../includes/footer.jsp"%>