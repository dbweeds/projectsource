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
                <li class="breadcrumb-item active" aria-current="page" style="color: black;"><b>${QA.writer} : ${QA.title}</b></li>
            </ol>
        </nav>
    </div>
</div>
<div class="row">
	<div class="container">
		<h2 style="font-weight: bolder; margin: 40px; margin-left: 5px; padding-bottom:20px">문의사항</h2>
		<form role="form" action="/comunity/QAModify" method="get" style="margin-bottom:100px">

			<div
				style="border-bottom: 1px dotted #bbb; border-top: 1px solid #bbb;">
				<input name='title'
					style="border: 0px; font-size: 150%; margin: 20px; margin-left: 5px;"
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
			<div class="form-group" style="height: 400px; padding-top: 20px">
				<textarea cols=100 rows=20 name='content'
					style="overflow: auto; resize: none; border: none;"
					readonly="readonly"><c:out value="${QA.content}" /></textarea>
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
		<div class='row' >

			<div class="col-lg-12">

				<!-- /.panel -->
				<div class="panel panel-default" style="margin-bottom:30px; border: 2px solid #495057; padding:10px; border-radius:20px">
					<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->

					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i> 답변
						<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>답변 작성</button>
					</div>


					<!-- /.panel-heading -->
					<div class="panel-body">

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



		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Replyer</label> <input class="form-control" name='replyer'
								value='replyer'>
						</div>
						<div class="form-group">
							<label>Reply</label> <input class="form-control" name='reply'
								value='New Reply!!!!'>
						</div>
						<div class="form-group">
							<label>Reply Date</label> <input class="form-control"
								name='replyDate' value='2018-01-01 13:13'>
						</div>

					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
						<button id='modalRegisterBtn' type="button"
							class="btn btn-primary">Register</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!--  end panel-body -->
</div>



<%@include file="../includes/footer.jsp"%>
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
var admin = '<%=(String)session.getAttribute("admin")%>';
$(document).ready(function () {
  
if(admin == "null"){
	  $("#addReplyBtn").hide();
  }
  var bnoValue = '<c:out value="${QA.bno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
function showList(page){
	
	  console.log("show list " + page);
    
    replyService.getList({bno:bnoValue,page: page|| 1 }, function(replyCnt, list) {
      
    console.log("replyCnt: "+ replyCnt );
    console.log("list: " + list);
    console.log(list);
    
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
       str +="    <small class='pull-right text-muted'>"
           +replyService.displayTime(list[i].replyDate)+"</small></div>";
       str +="    <p>"+list[i].reply+"</p></div></li>";
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

    
/*     function showList(page){
      
      replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
        
        var str="";
       if(list == null || list.length == 0){
        
        replyUL.html("");
        
        return;
      }
       for (var i = 0, len = list.length || 0; i < len; i++) {
           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
           str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
           str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
           str +="    <p>"+list[i].reply+"</p></div></li>";
         }


    replyUL.html(str);

      });//end function
      
   }//end showList */
   
    var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
    $("#addReplyBtn").on("click", function(e){
      
      modal.find("input").val("");
      modalInputReplyDate.closest("div").hide();
      modal.find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      
      $(".modal").modal("show");
      
    });
    

    modalRegisterBtn.on("click",function(e){
      
      var reply = {
            reply: modalInputReply.val(),
            replyer:modalInputReplyer.val(),
            bno:bnoValue
          };
      replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        //showList(1);
        showList(-1);
        
      });
      
    });


  //댓글 조회 클릭 이벤트 처리 
if(admin != "null"){
  	
    $(".chat").on("click", "li", function(e){
      
      var rno = $(this).data("rno");
      
      replyService.get(rno, function(reply){
      
        modalInputReply.val(reply.reply);
        modalInputReplyer.val(reply.replyer);
        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
        .attr("readonly","readonly");
        modal.data("rno", reply.rno);
        
        modal.find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").modal("show");
            
      });
    });
}
  
    
/*     modalModBtn.on("click", function(e){
      
      var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
      
      replyService.update(reply, function(result){
            
        alert(result);
        modal.modal("hide");
        showList(1);
        
      });
      
    });

    modalRemoveBtn.on("click", function (e){
    	  
  	  var rno = modal.data("rno");
  	  
  	  replyService.remove(rno, function(result){
  	        
  	      alert(result);
  	      modal.modal("hide");
  	      showList(1);
  	      
  	  });
  	  
  	}); */

    modalModBtn.on("click", function(e){
    	  
   	  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
   	  
   	  replyService.update(reply, function(result){
   	        
   	    alert(result);
   	    modal.modal("hide");
   	    showList(pageNum);
   	    
   	  });
   	  
   	});


   	modalRemoveBtn.on("click", function (e){
   	  
   	  var rno = modal.data("rno");
   	  
   	  replyService.remove(rno, function(result){
   	        
   	      alert(result);
   	      modal.modal("hide");
   	      showList(pageNum);
   	      
   	  });
   	  
   	});

 
});

</script>



<script>

/* console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>'; */

//for replyService add test
/* replyService.add(
    
    {reply:"JS Test", replyer:"tester", bno:bnoValue}
    ,
    function(result){ 
      alert("RESULT: " + result);
    }
); */


//reply List Test
/* replyService.getList({bno:bnoValue, page:1}, function(list){
    
	  for(var i = 0,  len = list.length||0; i < len; i++ ){
	    console.log(list[i]);
	  }
});
 */

 
/*  //17번 댓글 삭제 테스트 
 replyService.remove(17, function(count) {

   console.log(count);

   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 */
 

//12번 댓글 수정 
/* replyService.update({
  rno : 12,
  bno : bnoValue,
  reply : "Modified Reply...."
}, function(result) {

  alert("수정 완료...");

});  
 */

</script>

<!-- 수정, 목록 버튼이동 -->
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
