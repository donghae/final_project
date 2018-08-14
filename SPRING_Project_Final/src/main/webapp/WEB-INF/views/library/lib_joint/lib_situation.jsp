<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>  



<%@include file="../../layout/header_lib.jsp" %>
	
<!-- 도서관 현황 -->
<section>
	<article style="padding:230px 0px 25px;">
		<div id="header_fill"></div>
	</article>
	
		<div class="popular page_section" style="padding:0px;">
			<div class="content">
			<div class="container" style="max-width:80%; width:100%; magin:0 auto; padding:0px;">
				<div class="row">
					<div class="col">
						<div class="section_title text-center">
							<h1>도서관 현황</h1>
						</div>
					</div>
				</div>

				<div class="row course_boxes">
					
					<!-- Popular Course Item -->
					<div class="col-lg-12 course_box">
						<div class="card">
							<img class="card-img-top" src="resources/boot_library/img/courses_background.jpg" >
							<div class="card-body text-center">
							
								<div class="card-title" style="height:50px;"></div>
								
								<div class="card-text">
									<label>도서자료</label>
									<table class="table">
										<thead class="thead-dark">
											<tr style="padding: 15px;">
												<th style="padding: 5px;">구분</th>
												<th style="padding: 5px;">소설</th>
												<th style="padding: 5px;">수필</th>
												<th style="padding: 5px;">전문</th>
												<th style="padding: 5px;">기타</th>
											</tr>
										</thead>
										<tbody>
											<tr style="padding: 15px;">
												<td style="padding: 5px;">국내</td>
												<td style="padding: 5px;">31,930</td>
												<td style="padding: 5px;">24,818</td>
												<td style="padding: 5px;">9,316</td>
												<td style="padding: 5px;">120,586</td>
											</tr>
											<tr style="padding: 15px;">
												<td style="padding: 5px;">국외</td>
												<td style="padding: 5px;">12,207</td>
												<td style="padding: 5px;">4,819</td>
												<td style="padding: 5px;">1,916</td>
												<td style="padding: 5px;">29,203</td>
											</tr>
										</tbody>
										
									</table>
								</div>
							</div>							
						</div>
					</div>
					
				</div>
			</div>		
		</div>
	</div>
</section>


	<%@include file="../../layout/footer_lib.jsp" %>