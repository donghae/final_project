<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../circle_setting.jsp" %>
<%@ include file="../../setting.jsp" %>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->

<style>
	.carousel-item img{
		align:center;
		text-align:center;
		width:60%;
		height:50%;
	}
	
	.circle{
		position: absolute;
	}

	.info{
		width:900px;
		height:180px;

	} 
	
/* 	.table td{	
		width:500px;
		height:100px;
		font-size: 2em;
	} */
	.table{
		position: relative;
		top:50px;
		left:550px;
	}

	. table td a{
		position : relative;
		top:200px;
		color: black;
	}	
</style>     
<script>
	function circleDelete(){
		if(document.getElementById('circleDelete')){
			circle = confirm("삭제 처리하시겠습닊?");
		}
		
		if(circle == true){
			alert("삭제를 선택하셨군요");			
		}else{
			alert("삭제처리 되지 않았습니다.");
			location.href="ara";
			return false;
		}
		
		
		/* var url="confirm?userId=" + document.signIn.userId.value;
		window.open(url, "confirm", "menubar=no, width=100, height=100"); */
	}	


</script>

 <c:if test="${fn:substring(sessionScope.id,0,1) != 0}">
<%-- <c:if test="${fn:substring(sessionScope.id,0,1) == 2}">  --%>
<%-- <c:if test="${sessionScope.id == null}"> --%>
	<script>
		alert("동아리 소개를 시작한다 홍홍홍~");
	</script>

<jsp:include page="../../layout/header_ara.jsp"/>    
    
    <div class="info">
    	<table class="table">
    		<tr>
    			<td class="td"><a href="#">동아리 소개</a></td>
    			<td class="td"><a href="#">학생 식단표</a></td>
    			<td class="td"><a href="#">셔틀버스</a></td>
    		</tr>
    	</table>
    </div>
    
<!-- 본문 -->  
<!-- <div style="width:100px; height:300px; float: left;">

</div>	 -->  
	<header role="banner">
			<!-- <img src="resources/images/common_img/UNI/collage2.jpg" width="100%" height="300px"> -->		

		<!-- 동아리 소개 슬라이드 사진-->	
		<div id="carouselExampleControls" class="carousel slide circle" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="resources/images/aracircle_img/base.jpg" >
		    </div>
		    <div class="carousel-item">
		      <img src="resources/images/aracircle_img/piano.jpg" >
		    </div>
		    <div class="carousel-item">
		      <img src="resources/images/aracircle_img/stapan.jpg" >
		    </div>
		    <div class="carousel-item">
		      <img src="resources/images/aracircle_img/show.jpg" >
		    </div>   
		    <div class="carousel-item">
		      <img src="resources/images/aracircle_img/twice.jpg" >
		    </div>	    		     
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true" style="color: black;"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true" style="color: black;"></span>
		    <span clas="next">Next</span>
		  </a>
		</div>				
	</header>	

	<div id="list">
	<!-- 목록 조회 -->
	<article class="back_white">
		<div class="content">
			<table class="st_beige">
				<thead class="st_beige">
					<tr>
						<th style="width:12%;">동아리명</th>
						<th style="width:25%;">교번</th>
						<th style="width:7.5%;">장소</th>
						<th style="width:22%;">동아리 소개</th>
					</tr>
				</thead>
				
				<tbody class="st_beige">
					<c:if test="${cnt == 0}">
						<tr>
							<td></td>
							<td colspan="7">검색 결과가 없습니다</td>							
						</tr>
					</c:if>
					
					<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td style="width:15%;"><a href="araCircleBefore" style="color:black;">${dto.cc_name}</a></td>
							<td style="width:7.5%;">${dto.prof_no}</td>
							<td style="width:7.5%;">${dto.cc_loc}</td>
							<td style="width:50%;">${dto.cc_content}</td>					
						</tr>
					</c:forEach>
					</c:if>	
				</tbody>
			</table>
			
			
			
			<br><br>
			<!-- 페이지 컨트롤 버튼 -->
			<div class="cen_middle">
				<c:if test="${cnt > 0}">
					<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="lib_bookSearch">[◀◀]</a>
						<a href="lib_bookSearch?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
				
					<!-- 페이지 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<!-- 현재 페이지와 i가 같은 경우 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<!-- 현재 페이지와 i가 다를 경우 -->
						<c:if test="${i != currentPage}">
							<a href="lib_bookSearch?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="lib_bookSearch?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="lib_bookSearch?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>			
		</div>
	</article>
	</div>


<!-- 게시판/바로가기 -->
 		<div class=" gtco-section" style="background-color:#C4E8F6;">
			<div class="gtco-container">
			
				<div class="row">					
					<div class="col-md-7">
					<h3>공지 사항</h3>
											
					</div>	
						
					<div class="col-md-5">	
					<h3>주요 서비스 보기</h3>
						<table class="iconTable">											
							<tr>																
								<td><a href="#"><img src="resources/images/common_img/icons/user.png" width="70px"></a></td>
								<td><a href="lib_home"><img src="resources/images/common_img/icons/library.png" width="70px"></a></td>
								<td><a href="dormitory"><img src="resources/images/common_img/icons/domi.png" width="70px"></a></td>
							</tr>
							<tr>
								<td><a href="#"><img src="resources/images/common_img/icons/cyber.png" width="70px"></a></td>
								<td><a href="#"><img src="resources/images/common_img/icons/schedule.png" width="70px"></a></td>
								<td><a href="#"><img src="resources/images/common_img/icons/schoolbus.png" width="70px"></a></td>
							</tr>
						</table>						
					</div>					
				</div>
				
			</div>
		</div>
		
<%@ include file = "../../layout/footer_ara.jsp"%>


</c:if>
<%-- </c:if> --%>




		<!--  -->
		<!--  sessionScope.id == 0 관리자 부분 시작 -->
		<!--  -->

<c:if test="${fn:substring(sessionScope.id,0,1) == 0}">

<jsp:include page="../../layout/header_ara.jsp"/>    
    
    <div class="info">
    	<table class="table">
    		<tr>
    			<td align="center"><a href="#" style="color: black; font-size: 2em; ">동아리 관리</a></td>
    			<td align="center"><a href="#" style="color: black; font-size: 2em; ">학생 식단표 관리</a></td>
    			<td align="center"><a href="#" style="color: black; font-size: 2em; ">셔틀버스 관리</a></td>
    		</tr>
    	</table>
    </div>
    
<!-- 본문 -->  

<!-- 	<header role="banner">
			<img src="resources/images/common_img/UNI/collage2.jpg" width="100%" height="300px">
	</header> -->
	
	<div id="list">
	<!-- 목록 조회 -->
	<article class="back_white">
		<div class="content">
			<table class="st_beige">
				<thead class="st_beige">
					<tr>
						<th style="width:15%;">동아리명</th>
						<th style="width:25%;">교번</th>
						<th style="width:10%;">장소</th>
						<th style="width:25%;">동아리 소개</th>
						<th style="width:25%;">관리</th>
					</tr>
				</thead>
				
				<tbody class="st_beige">
					<c:if test="${cnt == 0}">
						<tr>
							<td></td>
							<td colspan="7">검색 결과가 없습니다</td>							
						</tr>
					</c:if>
					
					<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td style="width:15%;"><a href="#" style="color:black;">${dto.cc_name}</a></td>
							<td style="width:25%;">${dto.prof_no}</td>
							<td style="width:10%;">${dto.cc_loc}</td>
							<td style="width:40%;">${dto.cc_content}</td>
							<td style="width:10%;">
								<a href="araCircleBefore?cc_name=${dto.cc_name}" style="color: black;">수정</a>
								<a href="araCircleDelete?cc_name=${dto.cc_name}" style="color: black;" onclick="return circleDelete()" id="circleDelete">삭제</a>
							</td>					
						</tr>
					</c:forEach>
					</c:if>	
				</tbody>
			</table>
			
			
			
			<br><br>
			<!-- 페이지 컨트롤 버튼 -->
			<div class="cen_middle">
				<c:if test="${cnt > 0}">
					<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="lib_bookSearch">[◀◀]</a>
						<a href="lib_bookSearch?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
				
					<!-- 페이지 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<!-- 현재 페이지와 i가 같은 경우 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<!-- 현재 페이지와 i가 다를 경우 -->
						<c:if test="${i != currentPage}">
							<a href="lib_bookSearch?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="lib_bookSearch?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="lib_bookSearch?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>			
		</div>
	</article>
	</div>


<!-- 게시판/바로가기 -->
 		<div class=" gtco-section" style="background-color:#C4E8F6;">
			<div class="gtco-container">
			
				<div class="row">					
					<div class="col-md-7">
					<h3>공지 사항</h3>
											
					</div>	
						
					<div class="col-md-5">	
					<h3>주요 서비스 보기</h3>
						<table class="iconTable">											
							<tr>																
								<td><a href="#"><img src="resources/images/common_img/icons/user.png" width="70px"></a></td>
								<td><a href="lib_home"><img src="resources/images/common_img/icons/library.png" width="70px"></a></td>
								<td><a href="dormitory"><img src="resources/images/common_img/icons/domi.png" width="70px"></a></td>
							</tr>
							<tr>
								<td><a href="#"><img src="resources/images/common_img/icons/cyber.png" width="70px"></a></td>
								<td><a href="#"><img src="resources/images/common_img/icons/schedule.png" width="70px"></a></td>
								<td><a href="#"><img src="resources/images/common_img/icons/schoolbus.png" width="70px"></a></td>
							</tr>
						</table>						
					</div>					
				</div>
				
			</div>
		</div>
		
<%@ include file = "../../layout/footer_ara.jsp"%>
</c:if>

