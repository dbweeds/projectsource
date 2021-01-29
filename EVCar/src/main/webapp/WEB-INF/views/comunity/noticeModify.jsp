<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- CSS only -->


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
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

				<form action="/comunity/noticeModify" method="post">
					<div class="panel-body">
						<div class="form-group">
							<label>번호</label> <input class="form-control" name="bno"
								value='<c:out value="${notice.bno }"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1" style="text-weight: bolder">제목</label>
							<input class="form-control" id="exampleFormControlInput1"
								name='title' value='<c:out value="${notice.title}" />'>
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1" style="text-weight: bolder">작성자</label>
							<input class="form-control" id="exampleFormControlInput1"
								name='writer' value='<c:out value="${notice.writer}" />'
								readonly="readonly">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='content'><c:out value="${notice.content}" /></textarea>
						</div>
						<div>
							<button type="submit" data-oper='noticeModify' class="btn btn-primary">수정</button>
							<button type="submit" data-oper='noticeList' class="btn btn-primary" onclick="location.href='/comunity/noticeList'">목록</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--  end panel-body -->
	</div>
</div>

<!-- <script type="text/javascript">
$(document).ready(function() {  
	
  var formObj = $("#form");  
  
  $('button').on("click", function(e){    
   
	  e.preventDefault();
	  
	  var operation = $(this).data("oper");
	  
	  console.log(operation);
	  
	  if(operation === 'noticeList'){
		  //list로이동
		  self.location="/comunity/noticeList";
		  return;
	  }
	  fromObj.submit();
    
  });  
});
</script> -->
<%@include file="../includes/footer.jsp"%>