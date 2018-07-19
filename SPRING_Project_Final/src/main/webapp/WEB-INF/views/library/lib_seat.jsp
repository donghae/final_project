<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/box_mon.css"> 




<jsp:include page="../layout/header_lib2.jsp"/>


<!-- 본문 -->
<section>
	
	<form action="" name="">				
		<!-- 좌석 예약 -->
		<article class="back_white">
			<div id="header_fill"></div>
			
			<div class="content">
				<div>
					<select>
						<optgroup label="floor">층</optgroup>
						<option value="3" selected="selected">3층</option>
						<option value="4">4층<option>
					</select>				
				</div>
				<table class="st_mint">
					<thead class="st_mint">
						<tr>
							
						</tr>
					</thead>
					<tbody class="st_mint">
						<tr>
							
						</tr>
					</tbody>
				</table>	
				
				
				<br><br><br><br>
				<div class="center">
					<input class="btn_navy" type="submit" value="예약 하기">			
				</div>		
			</div>
		</article>
	</form>
	
</section>



<jsp:include page="../layout/footer_lib.jsp"/>