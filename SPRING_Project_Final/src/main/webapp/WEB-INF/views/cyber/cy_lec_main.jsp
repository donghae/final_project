<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<style>
.cy_1 {
	margin-top: 21px;
}

.tab1 {
	width: 100%;
	height: 80%;
	border: 1px solid;
	border-collapse: collapse;
	margin: 5px auto;
}

.tab1 tr td {
	border-top: 1px solid;
	border-left: 1px solid;
	text-align: center;
	border-collapse: collapse;
	height: 10%;
}

.section_0 {
	width: 100%;
	height: 1000px;
	display: inline;
	text-align: center;
	align-items: center;
}

.cy_2 {
	width: 100%;
}

.cy_h4 {
	
}

.cy_3 {
	width: 100%;
}

.th_1 {
	text-align: center;
	background-color: #C4E8F6;
}

.wrap_dev1 {
	display: inline;
	width: 100%;
	height: 40%;
}

.wrap_dev2 {
	text-align: center;
	background-color: #cacaca;
}

.left_div {
	margin-left: -20%;
	width: 40%;
	display: inline-block;
	text-align: center;
}

.right_div {
	width: 40%;
	display: inline-flex;
}
</style>


<body>
	<jsp:include page="../layout/header_ara.jsp" />

	<div align="center">
		<div class="cy_1">
			<h4>온라인 강의 공지사항</h4>
			<c:if test="${sessionScope.id == null}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script type="text/javascript">
					swal("권한이 없습니다.");
					window.history.back();
				</script>	
			</c:if>
			<c:if test="${fn:substring(sessionScope.id,0,1) == 0 || fn:substring(sessionScope.id,0,1) == 1}">
				<input type="button" value="글 작성" onclick="window.location='cy_lec_notice_write_form?lec_no=${lec_no}'">
			</c:if>
				
		</div>
		<%@ include file="../cyber/cy_lec_sidebar_stu.jsp"%>
		<div class="left_div" style="width: 800px; height: 40%;">
			<table class="st_mint">
				<thead>
					<tr>
						<th style="width: 10%">글번호</th>
						<th style="width: 50%">글제목</th>
						<th style="width: 10%">작성자</th>
						<th style="width: 20%">작성일</th>
						<th style="width: 10%">조회수</th>

					</tr>
					
				</thead>
				<!-- 게시글이 있으면 -->
				<tbody>
					<c:if test="${requestScope.dtos!=null}">

						<c:forEach var="vo" items="${dtos}">
							<tr>
								<td align="center">${number}<c:set var="number"
										value="${number-1}" />
								</td>
								<td>
									
									<a style="color: black;" href="cy_lec_notice_form?num=${vo.cy_lec_n_no}&pageNum=${pageNum}&lec_no=${lec_no}">
										${vo.cy_lec_n_title} 
									</a>
								</td>
								<td align="center">${vo.prof_name}</td>
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${vo.cy_lec_n_dt}" /></td>
								<td align="center">${vo.cy_lec_n_cnt}</td>

							</tr>
						</c:forEach>
					</c:if>
					<!-- 게시글이 없으면 -->
					<c:if test="${requestScope.dtos==null}">
						<tr>
							<th colspan="5" align="center">게시글이 없습니다. 글을 작성해 주세요.</th>
						</tr>
					</c:if>
				</tbody>
			</table>
		
			<table style="width: 800px; text-align: center">
				<tr>
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음 : ◀◀                                  이전 : ◀-->
							<c:if test="${startPage > pageBlock}">
								<a href="cy_lec_main?lec_no=${lec_no}">◀◀</a>
								<a href="cy_lec_main?lec_no=${lec_no}&pageNum=${startPage-pageBlock}">&nbsp;◀</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="cy_lec_main?lec_no=${lec_no}&pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 끝 : ▶▶                                       다음 : ▶-->
							<c:if test="${pageCount > endPage}">
								<a href="cy_lec_main?lec_no=${lec_no}&pageNum=${startPage+pageBlock}">▶&nbsp;</a>
								<a href="cy_lec_main?lec_no=${lec_no}&pageNum=${pageCount}">▶▶</a>
							</c:if>
						</c:if></th>
				</tr>
			</table>
		</div>
	</div>
</body>


<%@ include file="../layout/footer_lib.jsp"%>
