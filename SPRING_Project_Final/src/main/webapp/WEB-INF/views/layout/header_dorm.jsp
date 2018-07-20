<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dorm_setting.jsp" %>   
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Favicon  -->
    <link rel="icon" href="resources/images/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="resources/boot_dormitory/dormitory_css/core-style.css">

    <!-- Responsive CSS -->
    <link href="resources/boot_dormitory/dormitory_css/responsive.css" rel="stylesheet">

</head>

<body>
   <div id="preloader">
        <div class="showbox">
            <div class="loader">
                <svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
                </svg>
            </div>
        </div>
        <div class="questions-area text-center">
            <p>아라야 이거아라?</p>
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
                                    <li class="nav-item active">
                                        <a class="nav-link" href="#">아라기숙사 <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">기숙사소개</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="dormitory_history">설립목적 및 연혁</a>
                                            <a class="dropdown-item" href="dormitory_admin">관리자 페이지</a>
                                            <a class="dropdown-item" href="#">오시는 길</a>
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
                                    <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">입.퇴사안내</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="#">입사안내</a>
                                            <a class="dropdown-item" href="about-me.html">퇴사안내</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">식단안내</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">문의사항</a>
                                    </li>
                                </ul>
                                <!-- Search Form -->
                                <div class="header-search-form ml-auto">
                                    <form action="#">
                                        <input type="search" class="form-control" placeholder="Input your keyword then press enter..." id="search" name="search">
                                        <input class="d-none" type="submit" value="submit">
                                    </form>
                                </div>
                                <!-- Search btn -->
                                <div id="searchbtn">
                                    <img src="resources/images/core-img/search.png" alt="">
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
<%--     <div class="social-sidebar-area bg-white" style=" opacity:0.7;">
		<%@ include file="../layout/side_dorm.jsp" %>
	</div> --%>
    
    <!-- Social Sidebar Area End -->
    	


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

</body>


</html>