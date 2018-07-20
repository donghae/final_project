<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="resources/css/box_mon.css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@include file="../layout/header_lib2.jsp" %>
	<!-- <div class="menu_container menu_mm">

		Menu Close Button
		<div class="menu_close_container">
			<div class="menu_close"></div>
		</div>

		Menu Items
		<div class="menu_inner menu_mm">
			<div class="menu menu_mm">
				

				Menu Social
				
				<div class="menu_social_container menu_mm">
					<ul class="menu_social menu_mm">
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-pinterest"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-instagram"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
						<li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-twitter"></i></a></li>
					</ul>
				</div>

				<div class="menu_copyright menu_mm">Colorlib All rights reserved</div>
			</div>

		</div>

	</div>
	
	Home

	<div class="home">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx" style="background-image:url(resources/images/common_img/UNI/library.jpg)"></div>
		</div>
		
	</div> -->

	<!-- Popular -->

	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title text-center">
						<h1>도서관 현황</h1>
					</div>
				</div>
			</div>

			<div class="row course_boxes">
				
				<!-- Popular Course Item -->
				<div class="col-lg-12 course_box">
					<div class="card">
						<img class="card-img-top" src="resources/boot_library/img/courses_background.jpg" >
						<div class="card-body text-center">
							<div class="card-title"></div>
							<div class="card-text">
								<label>찾아오시는 길</label>
								<div id="map" style="width: 50%; height: 50%;"></div>
								
							</div>
						</div>
						
					</div>
				</div>

				<!-- Popular Course Item -->
				

			</div>
		</div>		
	</div>
	<%@include file="../layout/footer_lib.jsp" %>
</body>
</html>