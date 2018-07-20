<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/boot_student/sidebar.css">
<body>
	<div style="height: 700px; width: 400px; float: left;">
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
				<div class="collapse navbar-collapse" id="sideNavbar">
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseOne"><span class="glyphicon glyphicon-book">
									</span>학사 관리<span class="caret"></span></a>
								</h4>
							</div>
							<!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default -->
							<div id="collapseOne" class="panel-collapse collapse in">
								<ul class="list-group">
									<li><a href="st_adm?state=1" class="navlink">학생 관리</a></li>
									<li><a href="st_adm?state=2" class="navlink">성적 관리</a></li>
									<li><a href="st_adm?state=3" class="navlink">출결 관리</a></li>
									<li><a href="st_adm?state=4" class="navlink">장학금 관리</a></li>
								</ul>
							</div>
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseTwo"><span class="glyphicon glyphicon-cog">
									</span>입학 관리<span class="caret"></span></a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<ul class="list-group">
									<li><a href="st_adm?state=5" class="navlink">지원서 관리</a></li>
									<li><a href="st_adm?state=6" class="navlink">합격 관리</a></li>
									<li><a href="st_adm?state=7" class="navlink">예비 합격자 관리</a></li>
								</ul>
							</div>
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapseThree">
										<span class="glyphicon glyphicon-calendar"> </span>강의 관리
										<span class="caret"></span>
									</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<ul class="list-group">
									<li><a href="st_adm?state=8" class="navlink">강의 관리</a></li>
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