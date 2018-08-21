<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/boot_student/sidebar.css">
<style>
	.sidebar{
		position: relative;
		left:-200px;
		top:-100px;
	}
</style>
<body>
	<div style="float: left; margin-top:38px;" class="sidebar" >
		<!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
		<div class="col-md-3" >
			<div id="sidenav1">
 				<div class="navbar-header">
				</div>			
				<div class="collapse navbar-collapse" id="sideNavbar">
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">						
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									공지 사항
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dt_admin_notice_write">공지사항 등록</a></center></li>
										<li><center><a href="dt_admin_notice_sel">공지사항 조회</a></center></li>
									</ul>
								</li>							
						</div>
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									학생 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitoty_stu_select">학생 정보</a></center></li>
										<li><center><a href="dormitoty_stu_insert">학생 등록</a></center></li>
										<li><center><a href="#">학생 정보 삭제</a></center></li>
									</ul>
								</li>														
							</div>							
						</div>
						
						<div class="panel panel-defaul">						
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="dormitory_admin_penalty" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									벌점 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dormitory_admin_penalty">벌점 현황</a></center></li>
										<li><center><a href="dt_admin_penalty_ins">벌점 등록</a></center></li>
									</ul>
								</li>							
							</div>
						</div>	
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<li class="main_nav_item">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color:white; font-weight:500;" >
									외박 관리
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><center><a href="dt_admin_overnight">외박 신청 승인</a></center></li>
										<li><center><a href="dt_admin_overnight_sel">외박 승인 조회</a></center></li>
									</ul>
								</li>								
							</div>
						</div>	


																
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>