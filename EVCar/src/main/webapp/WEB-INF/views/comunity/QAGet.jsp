<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- CSS only -->

<%@include file="../includes/header.jsp"%>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">문의사항</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="container">
				<div class="panel-heading"><c:out value="${QA.title}" /></div>
				<!-- /.panel-heading -->
				<div class="panel-body">

					<form role="form" action="/comunity/QAModify" method="get">


						<div class="form-group">
							<label>문의사항 글번호</label> <input class="form-control" name='bno'
								value='<c:out value="${QA.bno }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>제목</label> <input class="form-control" name='title' readonly="readonly"
								value='<c:out value="${QA.title }"/>'>
						</div>
						
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='writer'
								value='<c:out value="${QA.writer}"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out 
									value="${QA.content}" /></textarea>
						</div>

						

						<div class="form-group">
							<label>작성일</label> <input class="form-control" name='regDate'
								value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${QA.regDate}" />'
								readonly="readonly">
						</div>



						<button data-oper='QAModify' class="btn btn-default">수정</button>
						<button data-oper='QAList' class="btn btn-info">목록보기</button>
					</form>


				</div>
				<!--  end panel-body -->
			</div>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<div style="height:500px">

</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='QAModify']").on("click", function(e){
    
    operForm.attr("action","/QA/QAModify").submit();
    
  });
  
    
  $("button[data-oper='QAList']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/comunity/QAList")
    operForm.submit();
    
  });  
});
</script>
<%@include file="../includes/footer.jsp"%>