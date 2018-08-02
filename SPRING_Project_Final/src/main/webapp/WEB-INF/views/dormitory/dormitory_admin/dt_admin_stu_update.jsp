<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dorm_setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학생 수정</title>
</head>
<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="showbox">
            <div class="loader">
                <svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
                </svg>
            </div>
        </div>

    </div>

    <!-- Gradient Background Overlay -->
    <div class="gradient-background-overlay"></div>

   <!-- 기숙사 헤더-->
   <header class="header-area">
        <div class="container-fluid h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 h-100">
                    <div class="main-menu h-100">
                        <nav class="navbar h-100 navbar-expand-lg">
                            <div class="collapse navbar-collapse" id="studioMenu">
                                <!-- Menu Area Start  -->
                                <ul class="navbar-nav ml-auto">
                                	<li>
                                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    <li class="nav-item active">
                                        <a class="nav-link" href="admin">아라기숙사 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li>
                                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">학생관리</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitoty_stu_selet">학생조회</a>
                                            <a class="dropdown-item" href="dormitoty_stu_insert">학생 등록</a>
                                            <a class="dropdown-item" href="dormitoty_stu_update">학생 수정</a>
                                            <a class="dropdown-item" href="dormitoty_studelete">학생 삭제</a>
                                        </div>
                                    </li>
                                    <!-- <li class="nav-item"> -->
                                    <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">생활안내</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="#">생활관규정</a>
                                            <a class="dropdown-item" href="#">전화번호</a>
                                            <a class="dropdown-item" href="#">이용안내</a>
                                            <a class="dropdown-item" href="#">생활수칙</a>
                                        </div>
                                    </li>
                                    
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">기숙사 식단표</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">공지사항</a>
                                    </li>
                                    
                                    <li class="nav-item dropdown" style="text-align:right;">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="#">학생 로그인</a>
                                            <a class="dropdown-item" href="about-me.html">관리자 로그인</a>
                                        </div>
                                    </li>
                                </ul>
                                
                                <!-- 검색 Form -->
                                <!-- <div class="header-search-form ml-auto">
                                    <form action="#">
                                        <input type="search" class="form-control" placeholder="Input your keyword then press enter..." id="search" name="search">
                                        <input class="d-none" type="submit" value="submit">
                                    </form>
                                </div>
                                <!-- Search btn -->
                                <!-- <div id="searchbtn">
                                    <img src="resources/images/core-img/search.png" alt=""> -->
                                </div>
                            </div>
                        </nav>                        
                    </div>
                </div>
            </div>
        </div>
    </header>
    
	<!-- 학생 정보 수정,등록,조회,삭제 이미지 -->
    <div class="social-sidebar-area bg-white" style=" opacity:1;">
		<%@ include file="../../layout/dt_layout/side_dorm.jsp" %>
	</div>

   <section class="welcome-area">
        <div class="carousel h-100 slide" data-ride="carousel" id="welcomeSlider">
            <!-- Carousel Inner -->
            <div class="carousel-inner h-100">						         			 <!-- 투명도 --> 
                <div class="carousel-item h-100 bg-img active" style= "/* opacity:0.5; */  background-image: url(resources/images/common_img/UNI/dormitory.jpg);">
                  <div style="padding:0px;">
					 <%@ include file="../../layout/dt_layout/box.jsp" %>
					</div>            
                    <%@ include file="../../layout/dt_layout/dt_stu_insert.jsp" %>
                    <div class="carousel-content h-100">
                        <div class="slide-text">
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        		
<!-- 푸터 include -->          
<%@ include file="../../layout/dt_layout/footer_dorm.jsp" %>
                        		
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="resources/boot_dormitory/dormitory_js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/boot_dormitory/dormitory_js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/boot_dormitory/dormitory_js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="resources/boot_dormitory/dormitory_js/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/boot_dormitory/dormitory_js/active.js"></script>
    <!-- 테이블 js -->
    <script src="${Ara}dormitory_js/dt_stu_table2.js"></script>

</body>
</html>