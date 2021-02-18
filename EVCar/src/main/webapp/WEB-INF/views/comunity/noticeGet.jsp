<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/subHeader.jsp"%>
<!-- Start Breadcrumbs -->
<div class="fables-light-background-color">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="fables-breadcrumb breadcrumb px-0 py-3">
                <li class="breadcrumb-item"><a href="../"
                    class="fables-second-text-color">Home</a></li>
                <li class="breadcrumb-item"><a href="noticeList">공지사항</a></li>
                <li class="breadcrumb-item active" aria-current="page" style="color: black;"><b>${notice.title }</b></li>
            </ol>
        </nav>
    </div>
</div>
<div class="row">
	<div class="container">
		<h2 style="font-weight: bolder; margin: 40px;margin-left:5px;">공지사항</h2>
		<form role="form" action="/comunity/noticeModify" method="get">

			<div
				style="border-bottom: 1px dotted #bbb; border-top: 1px solid #bbb;">
				<input name='title'
					style="border: 0px; font-size: 150%; margin: 20px;margin-left:5px;width: 100%; outline: none;"
					readonly="readonly" value='<c:out value="${notice.title }"/>'>
			</div>

			<div class="form-group" style="border-bottom: 1px solid #bbb;">
				<div style="padding: 10px;">
					<label style="font-weight: bold;">작성자</label> <input name='writer'
						style="border: 0px; outline: none;" value='<c:out value="${notice.writer}"/>'
						readonly="readonly"> <label style="font-weight: bold;">작성일</label>
					<input name='regDate' style="border: 0px; outline: none;"
						value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${notice.regDate}" />'
						readonly="readonly"> <label style="font-weight: bold;">조회수</label>
					<input style="border: 0px; outline: none;" name='writer'
						value='<c:out value="${notice.readCnt}"/>' readonly="readonly">
				</div>

			</div>
			<div class="form-group"
				style="overflow: auto; height: 700px; white-space: pre-line;">
				<c:out value="${notice.content}" escapeXml="false" />
			</div>
			<hr>
			<div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            			<div class="panel-heading"><b>다운로드</b></div>
            			<div class="panel-body">
            				<div class="uploadResult">
            					<ul></ul>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>  

			<div style="float: right; margin-bottom:20px">
				<button data-oper='noticeModify' class="btn btn-primary" id="modify">수정</button>
				<button data-oper='noticeList' class="btn btn-secondary">목록</button>
			</div>
			
			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${notice.bno }"/>' readonly="readonly">
			</div>
		</form>
	</div>
	<!--  end panel-body -->
</div>
<!-- end panel -->
<script type="text/javascript">
	var bno = $("input[name='bno']").val();
	$(document).ready(function() {
	    
		var admin = '<%=(String)session.getAttribute("admin")%>';
	    
	    if(admin == "null"){
	        $("#modify").hide();
	    }
		
		var formObj = $("form");

		$("button").click(function() {
			var oper = $(this).data("oper");

			if (oper === 'noticeModify') {
				formObj.attr("action", "/comunity/noticeModify");

			} else if (oper === 'noticeList') {
				formObj.attr("action", "/comunity/noticeList")
			}

		});
		var uploadResult = $(".uploadResult ul");
		
		$.getJSON({
			url:"/comunity/getFile", 
			data:{bno:bno},
			success:function(data) {
				console.log(data);
				$("input[name='uploadFile']").val("");
				var str = "";
				$(data).each(function(idx, obj) {
						str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'style='display:inline-block'>";
						str += "<div>" + obj.fileName+" &nbsp&nbsp";
						str += "<button type='button' class='btn btn-warning btn-circle'>";
						str += "<i class='fa fa-cloud-download-alt' aria-hidden='true'></i>"
						str += "</button>";
						str += "</div></li>"
						$(".uploadResult ul").append(str);
						str = "";
				})
		}});
		$(".uploadResult").on("click","button",function(){
			var targetLi = $(this).closest("li");
			var path = encodeURIComponent(targetLi.data("path") + "\\" + targetLi.data("uuid") + "_" + targetLi.data("filename"));
			location.href="/download?fileName="+path;
		})//x버튼 클릭 이벤트종료
		
	});
</script>
<%@include file="../includes/footer.jsp"%>