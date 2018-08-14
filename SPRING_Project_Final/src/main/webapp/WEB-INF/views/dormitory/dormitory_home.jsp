<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../setting.jsp" %>  


<!-- 본문 : 도서관 홈 -->
<div class="super_container" style="overflow-y: hidden;">

	<%@include file="../layout/header_lib.jsp" %>
	
	<!-- Home -->
	<div class="home" style="height:60%;">

		<!-- Hero Slider -->
		<div class="hero_slider_container">
			<div class="hero_slider owl-carousel">
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/boot_library/img/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Leading the Way to the <span>Future</span></h1>
						</div>
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/images/common_img/UNI/dormitory.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Leading the Way to the <span>Future</span></h1>
						</div>
						
					</div>
				</div>
				
				<!-- Hero Slide -->
				<div class="hero_slide">
					<div class="hero_slide_background" style="background-image:url(resources/boot_library/img/slider_background.jpg)"></div>
					<div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
						<div class="hero_slide_content text-center">
							<h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Leading the Way to the <span>Future</span></h1>
						</div>
					</div>
				</div>

			</div>

			<div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200">prev</span></div>
			<div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">next</span></div>
		</div>
		
	</div>
	
	
	
	
	
<footer class="footer" style="height:23%; margin-bottom:20px; padding-top:130px;">		
		
	<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">				
				<div class="cen_middle" style="width:100%;">
				
					<div class="col-lg-2 hero_box_col" style="display:inline-block;">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/book_search.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">기숙사</h2>
									<h2 class="hero_box_title">관리</h2>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-lg-2 hero_box_col" style="display:inline-block;">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/books.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">기숙사</h2>
									<hr>
									<h2 class="hero_box_title">월별</h2>
									<hr>
									<h2 class="hero_box_title">식단표</h2>
								</div>
							</div>
						</a>
					</div>


					<div class="col-lg-2 hero_box_col" style="display:inline-block;">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/lamp.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">기숙사</h2>
									<h2 class="hero_box_title">공지</h2>
								</div>
							</div>
						</a>
					</div>
					

					<div class="col-lg-2 hero_box_col" style="display:inline-block;">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/manuscript.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">외박</h2>
									<h2 class="hero_box_title">관리</h2>
								</div>
							</div>
						</a>
					</div>
					
					
					<div class="col-lg-2 hero_box_col" style="display:inline-block;">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/library.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">벌점</h2><!-- 개요,현황,찾아오는길 -->
									<h2 class="hero_box_title">관리</h2>
								</div>
							</div>
						</a>
					</div>

					</div>
				</div>
			</div>
		</div>
	
	</div>
<%@ include file="../layout/dt_layout/footer_dorm.jsp" %>	
</footer>
	
	

</div>
