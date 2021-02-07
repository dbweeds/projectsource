<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/subHeader.jsp"%>

<div class="row">
	<div class="container">
		<h2 style="font-weight: bolder; margin: 40px; margin-left:5px;">문의사항</h2>
		<form role="form" action="/comunity/QAModify" method="get">

			<div
				style="border-bottom: 1px dotted #bbb; border-top: 1px solid #bbb;">
				<input name='title'
					style="border: 0px; font-size: 150%; margin: 20px; margin-left:5px;"
					readonly="readonly" value='<c:out value="${QA.title }"/>'>
			</div>

			<div class="form-group" style="border-bottom: 1px solid #bbb;">
				<div style="padding: 10px;">
					<label style="font-weight: bold;">작성자</label> <input name='writer'
						style="border: 0px;" value='<c:out value="${QA.writer}"/>'
						readonly="readonly"> <label style="font-weight: bold;">작성일</label>
					<input name='regDate' style="border: 0px;"
						value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${QA.regDate}" />'
						readonly="readonly"> <label style="font-weight: bold;">조회수</label>
					<input style="border: 0px;" name='writer'
						value='<c:out value="${QA.readCnt}"/>' readonly="readonly">
				</div>

			</div>
			<div class="form-group" style="height: 500px; padding-top: 20px">
				<textarea cols=100 rows=20 name='content'
					style="overflow: auto; resize: none; border: none;"
					readonly="readonly"><c:out value="${QA.content}" /></textarea>
			</div>


			<div style="float: right; margin-bottom:20px">
				<button data-oper='QAModify' class="btn btn-primary">수정</button>
				<button data-oper='QAList' class="btn btn-secondary">목록</button>
			</div>
			
			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${QA.bno }"/>' readonly="readonly">
			</div>
		</form>
	</div>
	<!--  end panel-body -->
</div>
<!-- end panel -->
<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$("button").click(function() {
			var oper = $(this).data("oper");

			if (oper === 'QAModify') {
				formObj.attr("action", "/comunity/QAModify");

			} else if (oper === 'QAList') {
				formObj.attr("action", "/comunity/QAList")
			}

		});
	});
</script>
<%@include file="../includes/footer.jsp"%>