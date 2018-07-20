<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--  <%@ include file="../setting.jsp" %> --%>
<style>
	.cy_1{
		margin-top: 21px;
	}
	.tab1{
		margin-left:21%; 
		width:60%; 
		height: 80%; 
		border: 1px solid;
		border-collapse: collapse;
	}
	 .tab1 tr td{
		border-top: 1px solid;
		border-left: 1px solid;
		text-align: center;
		border-collapse: collapse;
		height: 10%;
		 
	}
	
	.section_0{
		width: 100%;
		height: 1000px;

	}
	.cy_2{
		width: 60%;
	}
	.cy_h4{
		margin-left: 35%;
		
	}
	.cy_3{
	width:60%;
	margin-left:21%;
	}
	.th_1{
	text-align: center;
	background-color: #C4E8F6;
	}
	.wrap_dev1{
	display: inline;
	width: 100%;
	height: 40%;
	}
	.wrap_dev2{
	
	text-align:center;
	background-color: #cacaca;
	}

	
</style>
<jsp:include page="../layout/header_ara.jsp"/>
    
<body>
<article>
<div class="wrap_dev1">
					<!-- gnb_dep1 영역 -->
					
						<div class="wrap_dev2">
							<div>
								<a href="cy_main"><span style="font-size: 2em;">온라인 강의</span></a>
							
								<a href="cy_add"><span style="font-size: 2em; margin-left: 10%;">강의추가</span></a>
							
								<a href="cy_comm"><span style="font-size: 2em; margin-left: 10%;">커뮤니티</span></a>
								
							</div>

						</div>

					</div>

</article>
<section class="section_0">
	<div class="cy_1">
	<div class="cy_2">
	<h4 class="cy_h4">
	학기 정보 : 2018년 2학기
	</h4>
	</div>		
	<div class="cy_3">
		
				<select title="선택해주세요">
					<option value="" >과정</option>
				</select>

				<select title="선택해주세요">
					<option value="" >   2018학년도 1학기</option> 
					<option value="" >   2017학년도 2학기</option> 
					<option value="" >   2017학년도 1학기</option> 
					<option value="" >   2016학년도 2학기</option> 
					<option value="" >   2016학년도 1학기</option> 
					<option value="" >   2015학년도 2학기</option> 
				</select>

					<select title="선택해주세요">
						<option value="all" >강의형태</option>
						<option value="online" >온라인</option>
						<option value="offline" >오프라인</option>
						<option value="mixed" >혼합</option>
					</select>
					<select title="선택해주세요">
						<option value="" selected>과목명</option>
						<option value="">과목코드</option>
						<option value="">교수자 명</option>
					</select>
		
				<!-- <input type="text" name="" maxlength="100" value="" id="search" title="검색">
				<input type="button" name="" value="검색"> -->
	</div>
	<p style="font-size: 2em; color:black; margin-left:21%">ara-online 강의 리스트</p>
	
	
	<table class="tab1">
		<!-- <caption style="font-size: 2em;">ara-online 강의 리스트</caption> -->
		<thead style="text-align: center">
			<tr>
				
				<th class="th_1">번 호 </th>
				<th class="th_1">구분</th>
				<th class="th_1">강의명</th>
				<th class="th_1">학습시간</th>
				<th class="th_1">출결정보</th>
				<th class="th_1">강의보기</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>6</td>
				<td>온라인</td>
				<td>왕초보 첫걸음 내딛기</td>
				<td></td>
				<td></td>
				<td>
					<button value="강의 보기" style="width: 60%; height: 30%;">강의 보기</button>
				</td>
			</tr>

			<tr>
				<td>5</td>
				<td>온라인</td>
				<td>말하게 하는 스토리북</td>
				<td></td>
				<td></td>	
				<td>
					<button value="강의 보기" style="width: 60%; height: 30%;">강의 보기</button>
				</td>	
			</tr>

			<tr>
				<td>4</td>
				<td>온라인</td>
				<td>영어 기초 탄탄히 쌓기</td>
				<td></td>	
				<td></td>
				<td>
					<button value="강의 보기" style="width: 60%; height: 30%;">강의 보기</button>
				</td>
			</tr>

			<tr>
				<td>3</td>
				<td>온라인</td>
				<td>왕초보 탈출하기</td>
				<td></td>
				<td></td>
				<td>
					<button value="강의 보기" style="width: 60%; height: 30%;">강의 보기</button>
				</td>			
			</tr>

			<tr>
			<td>2</td>
				<td>온라인</td>
				<td>실전 회화 완성하기</td>
				<td></td>
				<td></td>
				<td>
					<button value="강의 보기" style="width: 60%; height: 30%;">강의 보기</button>
				</td>
			</tr>	
			<tr>
				<td>1</td>
				<td>온라인</td>
				<td>20분 실전 표현 영어</td>
				<td></td>
				<td></td>	
				<td>
					<button value="강의 보기" style="width: 60%; height: 30%;">강의 보기</button>
				</td>							
			</tr>
		</tbody>
	</table>
	
	</div>
</section>
</body>

		
<%@ include file = "../layout/footer_ara.jsp"%>
