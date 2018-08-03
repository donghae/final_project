<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dorm_setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
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
                                        <a class="nav-link" href="dormitory">아라기숙사 <span class="sr-only">(current)</span></a>
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
					 <%@ include file="../../layout/dt_layout/dt_stu_box.jsp" %>
				  </div>           
					
				  <c:if test="${dtos == null}">	
				  <div style="margin-left:400px; width:300px; height:100px; margin-top:100px;">
					<div class="container">
						<div class="row justify-content-center">
	                        <div class="col-12 col-md-10 col-lg-8">
	                            <form class="card card-sm" action="dt_stu_overnight_upd_pwd">
	                            <input type="hidden" name="textarea" value="textarea">
	                                <div class="card-body row no-gutters align-items-center">
	                                    <div class="col-auto">
	                                        <i class="fas fa-search h4 text-body"></i>
	                                    </div>
	                                    <!--end of col-->
	                                    <div class="col">
	                                        <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="학번을 입력해 주세요." name="pwd">
	                                    </div>
	                                    <!--end of col-->
	                                    <div class="col-auto">
	                                        <button class="btn btn-lg btn-success" type="submit">확인</button>
	                                    </div>
	                                    <!--end of col-->
	                                </div>
	                            </form>
	                        </div>
	                        <!--end of col-->
	                    </div>
					</div>
				  </div>
				  </c:if>
				  
<%-- 				  <c:if test="#{dtso != null}">
				  
				  </c:if> --%>
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