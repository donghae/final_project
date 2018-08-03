<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dorm_setting.jsp" %> 
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" type="text/css" href="resources/boot_dormitory/dormitory_css/dt_table.css">
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     Favicon 
     <link rel="icon" href="resources/images/core-img/favicon.ico">
    Core Style CSS
    <link rel="stylesheet" href="resources/boot_dormitory/dormitory_css/core-style.css">
    Responsive CSS
    <link href="resources/boot_dormitory/dormitory_css/responsive.css" rel="stylesheet">

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

    <!-- Header Area Start -->
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
                                        <a class="nav-link dropdown-toggle" href="dormitory_admin_stu" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">기숙사 학생 관리</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitoty_admin_stu_sel">조회</a>
                                            <a class="dropdown-item" href="dormitoty_admin_stu_ins">등록</a>
                                            <a class="dropdown-item" href="dormitoty_admin_stu_upd">수정</a>
                                            <a class="dropdown-item" href="dormitoty_admin_stu_del">삭제</a>
                                        </div>
                                    </li>
                                    
                                    <!-- <li class="nav-item"> -->
                                    <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="dormitory_admin_card" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">월별 식단표</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitory_admin_card_sel">조회</a>
                                            <a class="dropdown-item" href="dormitory_admin_card_ins">등록</a>
                                            <a class="dropdown-item" href="dormitory_admin_card_upd">수정</a>
                                            <a class="dropdown-item" href="dormitory_admin_card_del">삭제</a>
                                        </div>
                                    </li>
                                    
                                    <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="dormitory_admin_notice" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공지사항</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitory_admin_notice_sel">조회</a>
                                            <a class="dropdown-item" href="dormitory_admin_notice_ins">등록</a>
                                            <a class="dropdown-item" href="dormitory_admin_notice_upd">수정</a>
                                            <a class="dropdown-item" href="dormitory_admin_notice_del">삭제</a>
                                        </div>
                                    </li>
                                    
                                    <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="dormitory_admin_sleepover" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">외박 관리</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitory_admin_sleepover_sel">조회</a>
                                            <a class="dropdown-item" href="dormitory_admin_sleepover_ins">등록</a>
                                            <a class="dropdown-item" href="dormitory_admin_sleepover_upd">수정</a>
                                            <a class="dropdown-item" href="dormitory_admin_sleepover_del">삭제</a>
                                        </div>
                                    </li>                                    
                                    
                                    <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="dormitory_admin_penalty" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">벌점관리</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitoty_stu_selet">조회</a>
                                            <a class="dropdown-item" href="dormitoty_stu_insert">등록</a>
                                            <a class="dropdown-item" href="dormitoty_stu_update">수정</a>
                                            <a class="dropdown-item" href="dormitoty_studelete">삭제</a>
                                        </div>
                                    </li>
                                                                        
                                    <li class="nav-item dropdown" style="text-align:right;">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitory_stu_login">학생 로그인</a>
                                            <a class="dropdown-item" href="dormitoty_admin_login_form">관리자 로그인</a>
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
    <!-- Header Area End -->
    <!-- Social Sidebar Area Start -->
    <div class="social-sidebar-area bg-white" style=" opacity:0.7;">
		<%@ include file="../../layout/dt_layout/side_dorm.jsp" %>
	</div>
	

	
<!-- 	<div>
		<div class="container" style="margin-left:485px;">
		      <div class="row">
		        <div class="col-lg-12">
		          <p>
		            <a href="dt_stu_insert" class="btn btn-sq-lg btn-primary">
		                <i class="fa fa-user fa-5x"></i><br/>
		                	학생등록 <br>Button
		            </a>
		            <a href="#" class="btn btn-sq-lg btn-success">
		              <i class="fa fa-user fa-5x"></i><br/>
		              	학생 수정 <br>Button
		            </a>
		            <a href="#" class="btn btn-sq-lg btn-info">
		              <i class="fa fa-user fa-5x"></i><br/>
		              	학생 조회 <br>Button
		            </a>
		            <a href="#" class="btn btn-sq-lg btn-warning">
		              <i class="fa fa-user fa-5x"></i><br/>
		              	학생 삭제 <br>Button
		            </a>
		          </p>
		        </div>
			</div>
		</div>	
	</div> -->
    <!-- Social Sidebar Area End -->
    	
    <!-- ***** Welcome Area Start ***** -->
    <section class="welcome-area">
        <div class="carousel h-100 slide" data-ride="carousel" id="welcomeSlider">
            <!-- Carousel Inner -->
            <div class="carousel-inner h-100">						   <!-- 투명도 -->
                <div class="carousel-item h-100 bg-img active" style= "hheight:200px;  /* opacity:0.5; */  background-image: url(resources/images/common_img/UNI/dormitory.jpg);">
                	<div style="padding-top: 100px;">
               			<div align="center" style="background-color: white; width:1100px; height:600px; margin-left:450px;">
               				<%@ include file="../../layout/dt_layout/dt_admin_notice_detail.jsp" %>
               			</div>
               		</div>                                
                
                    <div class="carousel-content h-100">
                        <div class="slide-text">					
						
			    	</div>
			    	</div> 
       
               	
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </section>
    <!-- ***** Welcome Area End ***** -->
 
    <!-- ***** Contact Area Start ***** -->
    <div class="contact-popup-form" id="contact-modal-lg">
        <div class="modal fade contact-modal-lg" tabindex="-1" role="dialog" aria-labelledby="contact-modal-lg" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="contact-heading-text text-center mb-30">
                                    
                                    <span></span>
                                    <h2>Please get in touch</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    Contact Form Area
                    <div class="contact-form-area">
                        <div class="container-fluid">
                            <form action="#" method="post">
                                <div class="row">
                                    <div class="col-12 col-md-4">
                                        <input type="text" class="form-control" name="name" id="name" placeholder="Your Name">
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <input type="email" class="form-control" name="email" id="email" placeholder="Your Email">
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject">
                                    </div>
                                    <div class="col-12">
                                        <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                    <div class="col-12 text-center">
                                        <button type="submit" class="btn studio-btn mt-3"><img src="resources/images/core-img/logo-icon.png" alt=""> Send</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%-- <%@ include file="../dt_layout/table.jsp" %> --%>
<%@ include file="../../layout/dt_layout/footer_dorm.jsp" %>
    
    <!-- ***** Contact Area End ***** -->

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