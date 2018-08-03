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
				
				<div class="collapse navbar-collapse" id="sideNavbar"
					>
					<div class="panel-group" id="accordion">
						<div class="panel panel-defaul">
							<div class="panel-heading" >
								<h4 class="panel-title">
									<a href="cy_lec_main?lec_no=${lec_no}">공지사항</a>
								</h4>
							</div>							
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_select_lec_list?lec_no=${lec_no}">수업목차</a>
								</h4>
							</div>
							<!-- Note: By adding "in" after "collapse", it starts with that particular panel open by default; remove if you want them all collapsed by default -->
							
						</div>
						
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_lec_homework_list?lec_no=${lec_no}">과제목록</a>
								</h4>
							</div>							
						</div>
						<div class="panel panel-defaul">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a href="cy_main">돌아가기</a>
								</h4>
							</div>							
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>