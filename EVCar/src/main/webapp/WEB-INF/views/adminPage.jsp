<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="includes/header.jsp" %>
     
<!-- Start Header -->
<div class="fables-header fables-after-overlay bg-rules">
    <div class="container"> 
         <h2 class="fables-page-title fables-second-border-color wow fadeInLeft" data-wow-duration="1.5s" style="margin-top: 90px">공지사항</h2>
    </div>
</div>  
<!-- /End Header -->
     
<!-- Start Breadcrumbs -->
<div class="fables-light-background-color">
    <div class="container"> 
        <nav aria-label="breadcrumb">
          <ol class="fables-breadcrumb breadcrumb px-0 py-3">
            <li class="breadcrumb-item"><a href="#" class="fables-second-text-color">Home</a></li>
          </ol>
        </nav> 
    </div>
</div>
<article>
   <div class="container" role="main" style="width: 50%;height:500px; text-align: center;">
      <h2 style="margin-bottom: 15px">관리자 페이지</h2>
      <hr>
      <form action="/adminPage" method="post" class="loginForm" style="text-align: center;">
      <h3 style="margin: 30px 0 10px 0;">Login</h3>
      <div class="idForm" style="padding: 10px 10px;">
        <input type="text" class="id" name="adminId" id="adminId" placeholder="ID">
      </div>
      <div class="passForm" style="padding: 10px 10px;margin-bottom: 20px">
        <input type="password" class="pw" name="adminPassword" id="adminPassword" placeholder="PW">
      </div>
       <button type="submit" class="btn btn-primary">확인</button>
       <button type="button" class="btn btn-light" onclick="location.href='/'">취소</button>

      </form>

      <div></div>
   </div>
</article>
<%@include file="includes/footer.jsp"%>
<script type="text/javascript">
	
	
	$(function() {
		var error = '${error}';
		if(error){
			alert(error);
		}
	})
</script>