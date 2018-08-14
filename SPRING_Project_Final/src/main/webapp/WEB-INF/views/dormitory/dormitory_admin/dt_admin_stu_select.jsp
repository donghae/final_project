<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/boot_dormitory/dormitory_css/dt_table.css">
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>학생 정보 조회</title>

<style>
.btn-sq-lg {
  width: 100px !important;
  height: 100px !important;
}

.btn-sq {
  width: 100px !important;
  height: 100px !important;
  font-size: 10px;
}

.btn-sq-sm {
  width: 50px !important;
  height: 50px !important;
  font-size: 10px;
}

.btn-sq-xs {
  width: 50px !important;
  height: 50px !important;
  padding:2px;
}

	.box1{
		position: absolute;
	}
	
	.box2{
		position: relative;
		top:-50px;
		left:300px;
	}
</style>
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


    	
    <!-- ***** Welcome Area Start ***** -->
    <section class="welcome-area">
        <div class="carousel h-100 slide" data-ride="carousel" id="welcomeSlider">
            <!-- Carousel Inner -->
            <div class="carousel-inner h-100">						   <!-- 투명도 -->
                <div class="carousel-item h-100 bg-img active" style= "/* opacity:0.5; */  background-image: url(resources/images/common_img/UNI/dormitory.jpg);">
					<div>
						<div class="container">
						      <div class="row">
						        <div class="col-lg-12">
						          <p>
						            <a href="dormitoty_stu_select" class="btn btn-sq-lg btn-primary"><br>
						                <i class="fa fa-user fa-5x"></i><br/>
						                                학생 조회 <br>
						            </a>
						            <a href="dormitoty_stu_insert" class="btn btn-sq-lg btn-success"><br>
						              <i class="fa fa-user fa-5x"></i><br/>
						              	학생 등록 <br>
						            </a>
						            <a href="dormitoty_stu_update" class="btn btn-sq-lg btn-info"><br>
						              <i class="fa fa-user fa-5x"></i><br/>
						              	학생  수정 <br>
						            </a>
						            <a href="dormitoty_stu_delete" class="btn btn-sq-lg btn-warning"><br>
						              <i class="fa fa-user fa-5x"></i><br/>
						              	학생 삭제 <br>
						            </a>
						          </p>
						        </div>
							</div>
						</div>	
					</div>                 
                 	<%-- <div>
						<%@ include file="../../layout/dt_layout/box.jsp" %>
					</div> --%> 
					<div class="box1">
					</div>
					<div style="background-color:white; width:1200px; height:200px;" class="box2">
					 <div style="margin-top:100px; height:400px;">
						<%-- <%@ include file="../../layout/dt_layout/dt_stu_table2.jsp" %> --%>
						
						<div id="list">
						<!-- 목록 조회 -->
						<article class="back_white">
							<div class="content">
								<table class="st_beige">
									<thead class="st_beige">
										<tr>
											<th style="width:12%;">학번</th>
											<th style="width:7.5%;">이름</th>
											<th style="width:7.5%;">전공번호</th>
											<th style="width:22%;">호실</th>
											<th style="width:16%;">기숙사 시작일</th>
											<th style="width:13%;">기숙사 종료일</th>
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
												<td style="width:12%;">${dto.st_no}</td>
												<td style="width:7.5%;">${dto.st_name}</td>
												<td style="width:7.5%;">${dto.maj_cd}</td>
												<td style="width:22%;">${dto.dorm_room}</td>
												<td style="width:16%;">${dto.dorm_st_dt}</td>
												<td style="width:13%;">${dto.dorm_end_dt}</td>
												<td style="width:15%;">
													<Button class="btn_navy" type="button" onclick="window.location='lib_bookModiForm?b_no=${dto.st_no}'">수정</Button>&nbsp;
													<Button class="btn_navy" type="button" onclick="javascript:delBook('${dto.st_no}');">삭제</Button>
													<%-- <c:if test="${memId != null}">
														<Button class="btn_navy" type="button" onclick="window.location='#'">도서 예약</Button>							
													</c:if> --%>
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
			    	</div>
			    	</div>   
                    <div class="carousel-content h-100">
                        <div class="slide-text">
                   		</div>
					</div>
				</div>
			</div>
		</div>
	</section>  
	
	
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