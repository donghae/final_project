<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>    





<jsp:include page="../layout/header_lib_admin.jsp"/>


<!-- 본문 -->
<section>
	
	<form action="" name="">				
		<!-- 대출 현황 -->		
		<article class="back_white">
			<div id="header_fill"></div>
			
			<div class="content">
				<table class="st_mint">
				<thead class="st_mint">
					<tr>
						<th>대 출 일</th>
						<th>도서번호</th>
						<th>대 분 류</th>
						<th>제 목</th>
						<th>저 자</th>
						<th>출 판 사</th>
						<th>반납일</th>
						<th>현 황</th>
					</tr>
				</thead>
				<tbody class="st_mint">
					<tr>
						<td>2018-07-15</td>
						<td>KOR-J03-02977-22</td>
						<td>국내</td>
						<td>죽고싶지만 떡볶이는 먹고싶어</td>
						<td>백세희</td>
						<td>흔</td>
						<td></td>
						<td>대출 중</td>
					</tr>
					<tr>
						<td>2018-06-30</td>
						<td>KOR-J03-02977-22</td>
						<td>국내</td>
						<td>죽고싶지만 떡볶이는 먹고싶어</td>
						<td>백세희</td>
						<td>흔</td>
						<td>2018-07-02</td>
						<td>정상 반납</td>
					</tr>
					<tr>
						<td>2018-05-05</td>
						<td>KOR-J03-02977-22</td>
						<td>국내</td>
						<td>죽고싶지만 떡볶이는 먹고싶어</td>
						<td>백세희</td>
						<td>흔</td>
						<td></td>
						<td>미납</td>					
					</tr>
					<tr>
						<td>2018-04-15</td>
						<td>KOR-J03-02977-22</td>
						<td>국내</td>
						<td>죽고싶지만 떡볶이는 먹고싶어</td>
						<td>백세희</td>
						<td>흔</td>
						<td>2018-04-16</td>
						<td>정상 반납</td>					
					</tr>
					</tbody>
				</table>			
			</div>
		</article>
	</form>
	
</section>



<jsp:include page="../layout/footer_lib.jsp"/>