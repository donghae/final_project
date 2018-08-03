<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/boot_student/sidebar.css">
<body>
	<div style="height: 400px; width: 400px; float: left;">
		<!-- I was motivated to create this after seeing BhaumikPatel's http://bootsnipp.com/snippets/featured/-menu; I adapted it to a list format rather than a table so that it would be easy to create a nav toggle button when viewed on mobile devices -->
		<div class="col-md-3">
			<div id="sidenav1">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#sideNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="sideNavbar"
					>
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_main">공지사항</a>
								</h4>
							</div>
							<!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default -->
							
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_lec_list">강의목록</a>
								</h4>
							</div>							
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseThree">성적 관리<span class="caret"></span></a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<ul class="list-group">
									<li><a href="" class="navlink">성적 조회</a></li>
								</ul>
							</div>
						</div>

						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseFour">장학금 관리<span class="caret"></span></a>
								</h4>
							</div>
							<div id="collapseFour" class="panel-collapse collapse">
								<ul class="list-group">
									<li><a href="" class="navlink">장학금 신청</a></li>
									<li><a href="" class="navlink">장학금 수여 내역 조회</a></li>
								</ul>
							</div>
						</div>

						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseFive">등록금 관리<span class="caret"></span></a>
								</h4>
							</div>
							<div id="collapseFive" class="panel-collapse collapse">
								<ul class="list-group">
									<li><a href="" class="navlink">등록금 납부 조회</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>