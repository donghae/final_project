<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/box_mon.css"> 




<jsp:include page="../layout/header_lib2.jsp"/>


<!-- 본문 -->
<section>
	
	<form action="" name="">
	
		<!-- 검색칸 -->
		<article class="back_mint">
			<div id="header_fill"></div>
				<div class="content">
				<div class="center">
					<span style="padding:0px 3px;">
					<select class="hei">
						<optgroup label="대 분 류"></optgroup>
						<option value="1" selected="selected">국 내</option>
						<option value="2">유 럽</option>
						<option value="3">아 시 아</option>
						<option value="4">북 미</option>
						<option value="5">기 타</option>
					</select>
					</span>
					<span style="padding:0px 3px;">
					<select class="hei">
						<optgroup label="중 분 류"></optgroup>
						<option value="1" selected="selected">인 문</option>
						<option value="2">예 술</option>
						<option value="3">외 국 어</option>
						<option value="4">과 학</option>
						<option value="5">시/에세이</option>				
					</select>
					</span>
					<span style="padding:0px 3px;">
					<input class="hei" type="text" placeholder="저 자" style="width:100px;">		
					</span>
					<span style="padding:0px 3px;">
					<input class="hei" type="text" placeholder="출 판 사" style="width:100px;">		
					</span>
					<span style="padding:0px 3px;">					
					<input class="hei" type="text" placeholder="제 목" style="width:400px;">
					</span>		
					<span style="padding:0px 3px;">	
					<input class="btn_red" type="submit" value="검  색">
					</span>	
				</div>
			</div>	
		</article>					
		
	
		
		<!-- 목록 조회 -->
		<article class="back_white">
			<div class="content">
				<table class="st_beige">
					<thead class="st_beige">
						<tr>
							<th>도서번호</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>제 목</th>
							<th>저 자</th>
							<th>출판사</th>
							<th>대 출</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="st_beige">
						<tr>
							<td>KOR-J03-02977-22</td>
							<td>국내도서</td>
							<td>시/에세이</td>
							<td>죽고싶지만 떡볶이는 먹고싶어</td>
							<td>백세희</td>
							<td>흔</td>
							<td>대출 중</td>
							<td></td>
						</tr>
						<tr>
							<td>KOR-J03-02977-22</td>
							<td>국내도서</td>
							<td>시/에세이</td>
							<td>죽고싶지만 떡볶이는 먹고싶어</td>
							<td>백세희</td>
							<td>흔</td>
							<td>대출 중</td>
							<td></td>
						</tr>
						<tr>
							<td>KOR-J03-02977-22</td>
							<td>국내도서</td>
							<td>시/에세이</td>
							<td>죽고싶지만 떡볶이는 먹고싶어</td>
							<td>백세희</td>
							<td>흔</td>
							<td>대출 가능</td>
							<td><Button class="btn_navy" type="button">예약하기</Button></td>
						</tr>
						<tr>
							<td>KOR-J03-02977-22</td>
							<td>국내도서</td>
							<td>시/에세이</td>
							<td>죽고싶지만 떡볶이는 먹고싶어</td>
							<td>백세희</td>
							<td>흔</td>
							<td>대출 가능</td>
							<td><Button class="btn_navy" type="button">예약하기</Button></td>
						</tr>
					</tbody>
				</table>			
			</div>
		</article>
	</form>
	
</section>



<jsp:include page="../layout/footer_lib.jsp"/>