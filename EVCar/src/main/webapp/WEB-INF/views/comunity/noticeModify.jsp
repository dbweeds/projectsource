<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/subHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/QARegister.css">
<!-- /.row -->

<article>
	<div class="container" role="main">
		<h2 style="margin: 20px">공지사항 수정</h2>
		<hr>
		<form name="form" id="form" role="form" method="post"
			action="/comunity/noticeModify">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title" value='<c:out value="${notice.title }"/>'>
				<div class="inputInfo">수정하실 공지사항의 제목을 입력해주세요</div>
			</div>
			<div class="mb-3">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" name="writer" id="writer" value='<c:out value="${notice.writer}"/>'readonly="readonly">
				<div class="inputInfo"><br></div>
			</div>

			<div class="mb-3">
				<label for="content">내용</label>
				<div class="inputInfo">수정하실 공지 내용을 입력해주세요</div>
				<textarea class="form-control" rows="9" name="content" id="content"><c:out
									value="${notice.content}" /></textarea>
			</div>
			<div class="row">
            	<div class="col-lg-12">
            		<div class="panel panel-default">
            			<div class="inputInfo">파일</div>
            			<div class="panel-body">
            				<div class="form-group uploadDiv">
            					<input type="file" name="uploadFile" id="" multiple/>
            				</div>
            				<div class="uploadResult">
            					<ul></ul>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
			<button type="submit" data-oper='noticeModify' class="btn btn-default">수정하기</button>
			<button type="submit" data-oper='noticeRemove' class="btn btn-danger">삭제</button>
			<button type="submit" data-oper='noticeList' class="btn btn-info">목록보기</button>
			
			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${notice.bno }"/>' readonly="readonly">
			</div>
		</form>

		<div></div>
	</div>
</article>
<script type="text/javascript">
var bno = $("input[name='bno']").val();
$("input[type='file']").change(function() {
	console.log("업로드 호출");
	
	var inputFile = $("input[name='uploadFile']");
	console.log(inputFile);
	//첨부 파일 목록
	var files = inputFile[0].files;

	//<form> ~ </form> 대체로 ajax로 데이터를 쉽게 전송할 수 있도록 해줌
	var formData = new FormData();
	//객체 안에 요소 추가
	for (var i = 0; i < files.length; i++) {
		formData.append("uploadFile", files[i]);
	}
	$.ajax({
		url: '/uploadFile',
		type: 'post',
		processData: false,//데이터를 query string 형태로 보낼것인지 결정(기본값은 application/x-www-form-urlencoded임)
		contentType: false,//기본값은 application/x-www-form-urlencoded임(파일첨부임으로 multipart/form-data로 보내야 함)
		data: formData,
		success: function(result) {
			console.log(result);
			$("input[name='uploadFile']").val("");
			var uploadResult = $(".uploadResult ul");
			var str = "";
			$(result).each(function(idx, obj) {
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'style='display:inline-block'>";
					str += "<div>" + obj.fileName + "</a>"
					str += "<button type='button' class='btn btn-warning btn-circle'>";
					str += "<i class='fa fa-times'></i>"
					str += "</button>";
					str += "</div></li>"
					$(".uploadResult ul").append(str);
					str = "";
			})

		},
		error: function(xhr, statues, error) {
			console.log(status);
		}
	});
	
	
})	
$("button[type='submit']").click(function(e){
		e.preventDefault();
		
		var str="";
		//첨부파일 영역에 정보 수집
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
		//수집된 정보를 hidden태그로 작성
			str+= "<input type='hidden' name='fVo["+idx+"].uuid' value='"+job.data("uuid")+"'>"			
			str+= "<input type='hidden' name='fVo["+idx+"].uploadPath' value='"+job.data("path")+"'>"			
			str+= "<input type='hidden' name='fVo["+idx+"].fileName' value='"+job.data("filename")+"'>"			
		})
		//hidden 태그를 게시글 등록 폼에 추가한 후 폼 전송하기
		//1 게시글 폼 가져오기
		var form = $("form");
		//2 폼에 추가하기
		form.append(str);
		//3 폼 보내기
		//form.submit();
	})
$(".uploadResult").on("click","button",function(){
				var targetLi = $(this).closest("li");
				targetLi.remove();
			})//x버튼 클릭 이벤트종료
	$(document).ready(
			function() {
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
								str += "<div>" + obj.fileName + "</a>"
								str += "<button type='button' class='btn btn-warning btn-circle'>";
								str += "<i class='fa fa-times' aria-hidden='true'></i>"
								str += "</button>";
								str += "</div></li>"
								$(".uploadResult ul").append(str);
								str = "";
						})
				}});
				
				var formObj = $("form");

				$('button').on(
						"click",
						function(e) {


							var operation = $(this).data("oper");

							console.log(operation);

							if (operation === 'noticeRemove') {
								formObj
										.attr("action",
												"/comunity/noticeRemove");

							} else if (operation === 'noticeList') {
								//move to list
								formObj.attr("action", "/comunity/noticeList")
										.attr("method", "get");
								formObj.empty();
							}

							formObj.submit();
						});

			});
</script>
<%@include file="../includes/footer.jsp"%>