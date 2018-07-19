<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/box_mon.css"> 




<jsp:include page="../layout/header_lib2.jsp"/>


<!-- 본문 -->
<section>
	
	<form action="" name="">				
		<!-- 예약 현황 -->		
		<article class="back_mint">
			<div id="header_fill"></div>
			
			<div class="content">
				<table class="st_navy">
					<thead class="st_navy">
						<tr>
							<th>예 약 일</th>
							<th>도서번호</th>
							<th>대 분 류</th>
							<th>제 목</th>
							<th>저 자</th>
							<th>출 판 사</th>
							<th>현 황</th>
						</tr>
					</thead>
					<tbody class="st_navy">
						<tr>
							<td>2018-07-19</td>
							<td>KOR-J03-02977-22</td>
							<td>국내</td>
							<td>죽고싶지만 떡볶이는 먹고싶어</td>
							<td>백세희</td>
							<td>흔</td>
							<td>예약 중</td>
						</tr>
						<tr>
							<td>2018-06-20</td>
							<td>KOR-J03-02977-22</td>
							<td>국내</td>
							<td>죽고싶지만 떡볶이는 먹고싶어</td>
							<td>백세희</td>
							<td>흔</td>
							<td>예약 취소</td>
						</tr>	
					</tbody>			
				</table>			
			</div>
		</article>
	</form>
	
</section>



<jsp:include page="../layout/footer_lib.jsp"/>