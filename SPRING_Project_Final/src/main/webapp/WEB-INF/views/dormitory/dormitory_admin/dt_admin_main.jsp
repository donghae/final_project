<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %> 
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
                                                                        
                                    <c:if test="${sessionScope.id == null }">
	                                    <li class="nav-item dropdown" style="text-align:right;">
	                                    <a class="nav-link dropdown-toggle" href="dormitoty_stu_login_form" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
	                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	                                            <a class="dropdown-item" href="dormitoty_admin_login_form">학생 로그인</a>
	                                            <a class="dropdown-item" href="dormitoty_admin_login_form">관리자 로그인</a>
	                                        </div>
	                                    </li>
                                    </c:if>
									
									<c:if test="${sessionScope.id != null }">
										<li class="nav-item dropdown" style="text-align:right;">
	                                    <a class="nav-link" href="logout">${sessionScope.name}로그아웃</a>
	                                    </li>
									</c:if>
                                </ul>                              
                                </div>
                            </div>
                        </nav>                        
                    </div>
                </div>
            </div>
    </header>
    <!-- Header Area End -->
    <!-- Social Sidebar Area Start -->
    <div class="social-sidebar-area bg-white" style=" opacity:0.7;">
		<%@ include file="../../layout/dt_layout/side_dorm.jsp" %>
	</div>

    <!-- Social Sidebar Area End -->
    	
    <!-- ***** Welcome Area Start ***** -->
    <section class="welcome-area" style="height:1400px;">
        <div class="carousel h-100 slide" data-ride="carousel" id="welcomeSlider">
            <!-- Carousel Inner -->
            <div class="carousel-inner h-100" >       <!-- 투명도 -->
                <div class="carousel-item h-100 bg-img active" style= " /* opacity:0.5; */  background-image: url(resources/images/common_img/UNI/dormitory.jpg); padding:0px;">
               		<div style="padding-top: 100px;">
               			<%-- <%@ include file="../dt_layout/dt_admin_login_form.jsp" %> --%>
               			<%@ include file="../../layout/dt_layout/dt_admin_form.jsp" %>
               		</div>  
                    <div class="carousel-content h-100">
                        <div class="slide-text">
 
                   	 	</div>
                	</div>
            	</div>
            </div>	
        </div>
       
    </section>
    <!-- ***** Welcome Area End ***** -->
 



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

</body>


</html>