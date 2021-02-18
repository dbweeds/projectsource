<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/subHeader.jsp"%>

<div class="fables-light-background-color">
	<div class="container">
		<nav aria-label="breadcrumb">
			<ol class="fables-breadcrumb breadcrumb px-0 py-3">
				<li class="breadcrumb-item"><a href="../"
					class="fables-second-text-color">Home</a></li>
				<li class="breadcrumb-item"><a href="QAList">Q&A</a></li>
				<li class="breadcrumb-item active" aria-current="page"
					style="color: black;"><b>${QA.writer} : ${QA.title}</b></li>
			</ol>
		</nav>
	</div>
</div>
<div class="row">
	<div class="container body">
		<h2
			style="font-weight: bolder; margin: 40px; margin-left: 5px; padding-bottom: 20px">문의사항</h2>
		<form role="form" action="/comunity/QAModify" method="get"
			style="margin-bottom: 100px">

			<div
				style="border-bottom: 1px dotted #bbb; border-top: 1px solid #bbb;">
				<input name='title'
					style="border: 0px; font-size: 150%; margin: 20px; margin-left: 5px;width: 100%; outline: none;"
					readonly="readonly" value='<c:out value="${QA.title }"/>'>
			</div>

			<div class="form-group" style="border-bottom: 1px solid #bbb;">
				<div style="padding: 10px;">
					<label style="font-weight: bold;">작성자</label> <input name='writer'
						style="border: 0px; outline: none;" value='<c:out value="${QA.writer}"/>'
						readonly="readonly"> <label style="font-weight: bold;">작성일</label>
					<input name='regDate' style="border: 0px; outline: none;"
						value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${QA.regDate}" />'
						readonly="readonly"> <label style="font-weight: bold;">조회수</label>
					<input style="border: 0px; outline: none;" name='writer'
						value='<c:out value="${QA.readCnt}"/>' readonly="readonly">
				</div>

			</div>
			<div class="form-group"
				style="overflow: auto; height: 700px; white-space: pre-line;">
				<c:out value="${QA.content}" escapeXml="false" />
			</div>
			
			<div style="float: right; margin-bottom: 20px">
				<button data-oper='QAModify' class="btn btn-primary">수정</button>
				<button data-oper='QAList' class="btn btn-secondary">목록</button>
			</div>

			<div class="form-group" style="display: none">
				<label>글번호</label> <input class="form-control" name='bno'
					value='<c:out value="${QA.bno }"/>' readonly="readonly">
			</div>
		</form>
		<!-- 댓글 -->
		<div class='row'>

			<div class="col-lg-12">

				<!-- /.panel -->
				<div class="panel panel-default"
					style="margin-bottom: 30px; border: 2px solid #495057; padding: 10px; border-radius: 20px">
					<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->

					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i> 답변
					</div>


					<!-- /.panel-heading -->
					<div class="panel-body">
						<div>
							<textarea id="replyArea" rows="5" style="width: 90%; resize: none"></textarea>
							<button id='addReplyBtn'
								class='btn btn-primary btn-xs pull-right' style="margin-bottom:40px">답변
								작성</button>
							<button id='addModifyBtn'
							class='btn btn-primary btn-xs pull-right' style="margin-bottom:40px;display:none">답변
							수정</button>
						</div>
						<ul class="chat">
						
						</ul>
						<!-- ./ end ul -->
					</div>
					<!-- /.panel .chat-panel -->

					<div class="panel-footer"></div>


				</div>
			</div>
			<!-- ./ end row -->
		</div>
	</div>
</div>




<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
var admin = '<%=(String)session.getAttribute("admin")%>';
$(document).ready(function () {
if(admin == "null"){
	  $("#addReplyBtn").hide();
	  $("#replyArea").hide();
	  
  }
  var bnoValue = '<c:out value="${QA.bno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
function showList(page){
	
	  console.log("show list " + page);
    
    replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
    
    if(page == -1){
      pageNum = Math.ceil(replyCnt/10.0);
      showList(pageNum);
      return;
    }
      
     var str="";
     
     if(list == null || list.length == 0){
       return;
     }
     
     for (var i = 0, len = list.length || 0; i < len; i++) {
       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
       str +="  <div><div class='header'><strong class='primary-font'>["
    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
       if(admin != "null"){
       str +="    <small class='pull-right text-muted'>"
           +replyService.displayTime(list[i].replyDate)+"</small>&nbsp&nbsp<span class='fas fa-times' id='replyDeleteBtn' data-rno='"+list[i].rno+"'></span>&nbsp<a id='replyModifyBtn'><i class='fas fa-edit' data-rno='"+list[i].rno+"'></i></a>";    	   
       }
       str +="    </div><p>"+list[i].reply+"</p></div></li>";
     }
     
     replyUL.html(str);
     
     showReplyPage(replyCnt);

 
   });//end function
     
 }//end showList
    
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });     
    
    var replyModifyBtn = $("#replyModifyBtn");
    var replyDeleteBtn = $("#replyDeleteBtn");
    var addReplyBtn = $("#addReplyBtn");
    

    addReplyBtn.on("click",function(e){
      
      var reply = {
            reply: $("#replyArea").val(),
            replyer:"Admin", //어드민으로 고정
            bno:bnoValue
          };
      replyService.add(reply, function(result){
        
        alert(result);

        showList(-1);
        
      });
      
    });
    

  	$(".chat").on("click","li div div span",function(e){
  		e.stopPropagation();

   	  var rno = $(this).data("rno");
   	  
   	  replyService.remove(rno, function(result){
   	        
   	      alert(result);
   	      showList(pageNum);
   	      
   	  });
   	  
   	});
  	
  	
  	//수정하기 위한 정보 가져오기
  	$(".chat").on("click","li div div a i",function(e){
  		
  		e.stopPropagation();
     	  
  		 var rno = $(this).data("rno");
  		 console.log("댓글 수정"+rno);
  		 
  		 
  		$("#addReplyBtn").css("display","none");
  		$("#addModifyBtn").css("display","");
  		 
     	  
   	  replyService.get(rno, function(result){
   	    console.log(result); 	
   	    
   	    $("#replyArea").html(result.reply);
   	 	$("#replyArea").attr("data-rno",rno);
   	  
   	    
   		 //replyService.update(reply, function(result){
        
         showList(pageNum);
  		 
         
      // });
   	  });
   	  
   	});
  	
  	//댓글 수정
  	$("#addModifyBtn").click(function(){
  		var reply=$("#replyArea").val();
  		var rno=$("#replyArea").data("rno");
  		
  		var reply = {rno, reply};
  		
  		console.log("rno"+rno);
  		console.log("replyupadate"+reply);  		
  		
  		
  			
  		 replyService.update(reply, function(result){
  			$("#addReplyBtn").css("display","");
  	  		$("#addModifyBtn").css("display","none");
  	  		$("#replyArea").val("");
  	  		alert(result);
  	        showList(pageNum);	  	      
  		});		

  	});
});

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