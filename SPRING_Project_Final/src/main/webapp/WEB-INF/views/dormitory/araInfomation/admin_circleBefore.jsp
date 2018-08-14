<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../circle_setting.jsp" %>
<%@ include file="../../setting.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<c:if test="${fn:substring(sessionScope.id,0,1) == 0}">
<jsp:include page="../../layout/header_ara.jsp"/>    
    
<!--     <div class="info">
    	<table class="table">
    		<tr>
    			<td align="center"><a href="#" style="color: black; font-size: 2em; ">동아리 관리</a></td>
    			<td align="center"><a href="#" style="color: black; font-size: 2em; ">학생 식단표 관리</a></td>
    			<td align="center"><a href="#" style="color: black; font-size: 2em; ">셔틀버스 관리</a></td>
    		</tr>
    	</table>
    </div> -->
    
<!-- 본문 -->  

<!-- 	<header role="banner">
			<img src="resources/images/common_img/UNI/collage2.jpg" width="100%" height="300px">
	</header> -->
	
	<div id="list">
	<!-- 목록 조회 -->
	<article class="back_white">
		<div class="content">

				
				<tbody class="st_beige">
					<c:forEach var="dto" items="${dtos}">
					<c:if test="${dto.cc_name == null}">
						<tr>
							<td></td>
							<td colspan="7">검색 결과가 없습니다</td>							
						</tr>
					</c:if>
					
					<c:if test="${dto.cc_name != null}">
						<form action="araCircleAfter" name="circleForm" method="post"><!-- onsubmit='return circleForm();' -->
							<table class="st_beige">
							<thead class="st_beige">
								
								<tr>
									<td style="width:10%" align="center">동아리명</td>
									<td style="width:25%"><input type="text" name="cc_name" value="${dto.cc_name}" size="60%" style="text-align: center; height:50px;"></td>					
								</tr>	

								<tr>
									<td style="width:10%">교수번호</td>
									<td style="width:25%"><input type="text" name="prof_no" value="${dto.prof_no}" size="60%" style="text-align: center; height:50px;"></td>					
								</tr>

								<tr>
									<td style="width:10%">장소</td>
									<td style="width:25%"><input type="text" name="cc_loc" value="${dto.cc_loc}" size="60%" style="text-align: center; height:50px;"></td>					
								</tr>

								<tr>
									<td style="width:10%">동아리 소개</td>
									<td style="width:25%"><input type="text" name="cc_content" value="${dto.cc_content}" size="60%" style="text-align: center; height:50px;"></td>					
								</tr>	
								<tr>
									<td colspan="2"></td>
								</tr>
								<tr>
									<td colspan="2"></td>
								</tr>								
								<tr>
									<td colspan="2" style="width:10%;">
										<input type="submit" value="수정" style="width:60px; height:40px; font-size:15px; background-color:#C4E8F6; ">					
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="button" value="목록" onclick="window.location='ara'" style="width:60px; height:40px; font-size:15px; background-color:#C4E8F6;">
									</td>
								</tr>
							</thead>																														
							</table>
						</form>
							
					</c:if>	
					</c:forEach>

				</tbody>		
						


<!-- 게시판/바로가기 -->
	<br><br><br><br><br><br>
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

</body>
</html>