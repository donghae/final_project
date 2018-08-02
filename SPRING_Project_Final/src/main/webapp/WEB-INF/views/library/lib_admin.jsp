<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../setting.jsp" %>  



<!-- 본문 : 도서관 홈 -->
<div class="super_container">

	<%@include file="../layout/header_lib_noNav.jsp" %>
	
	<!-- Home -->
	<div class="home">

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
					<div class="hero_slide_background" style="background-image:url(resources/boot_library/img/slider_background.jpg)"></div>
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
	



<footer class="footer">		
	<div class="container">
		<div class="hero_boxes">
		<div class="hero_boxes_inner">
			<div class="container">
				<div class="row">										
						
					<div class="col-lg-2 hero_box_col">
						<a href="lib_bookSearch">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/book_search.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">도서</h2>
									<h2 class="hero_box_title">검색</h2>
								</div>
							</div>
						</a>
					</div>	
								
									
					<div class="col-lg-2 hero_box_col">
						<a href="lib_bookAddForm">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/book_search.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">도서</h2>
									<h2 class="hero_box_title">등록</h2>
								</div>
							</div>
						</a>
						
					</div>
					<div class="col-lg-2 hero_box_col">
						<a href="lib_bookLoanForm">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/books.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">대출</h2>
									<hr>
									<h2 class="hero_box_title">연장</h2>
									<hr>
									<h2 class="hero_box_title">예약</h2>
								</div>
							</div>
						</a>
					</div>


					<div class="col-lg-2 hero_box_col">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/manuscript.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">희망</h2>
									<h2 class="hero_box_title">도서</h2>
									<h2 class="hero_box_title">관리</h2>
								</div>
							</div>
						</a>
					</div>
					
					
					<div class="col-lg-2 hero_box_col">
						<a href="lib_seat">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/lamp.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">좌석</h2>
									<h2 class="hero_box_title">현황</h2>
								</div>
							</div>
						</a>
					</div>

														
					<div class="col-lg-2 hero_box_col">
						<a href="#">
							<div class="hero_box d-flex flex-row align-items-center justify-content-start">
								<img src="resources/images/common_img/icons/library.png" class="svg" alt="">
								<div class="hero_box_content">
									<h2 class="hero_box_title">소개</h2><!-- 개요,현황,찾아오는길 -->
									<h2 class="hero_box_title">관리</h2>
								</div>
							</div>
						</a>
					</div>
					

<!-- 					<div class="col-lg-2 hero_box_col">
						<div class="hero_box d-flex flex-row align-items-center justify-content-start">
							<img src="resources/images/common_img/icons/chat.png" class="svg" alt="">
							<div class="hero_box_content">
								<h2 class="hero_box_title">Q&A</h2>
							</div>
						</div>
					</div> -->
				
				</div>
			</div>
		</div>
	</div>
	</div>

</footer>

	<%@include file="../layout/footer_lib.jsp" %>
</div>
