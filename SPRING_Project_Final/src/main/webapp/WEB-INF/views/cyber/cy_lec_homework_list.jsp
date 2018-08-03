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
		</div>
		<%@ include file="../cyber/cy_lec_sidebar_stu.jsp"%>
		<div class="left_div">
			<table class="st_mint" style="width: 1000px; height: 50%">
				<thead>
					<tr>
						<th style="width: 10%">과제번호</th>
						<th style="width: 10%">주차</th>
						<th style="width: 50%">제목</th>
						<th style="width: 10%">제출여부</th>
						<th style="width: 20%">제출일</th>

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
									<!-- 추가 Start --> <!-- hot 이미지(조회수10이상) --> <c:if
										test="${vo.readCnt > 10}">
										<img src="${path}/images/hot.gif" border="0" width="20"
											height="15">
									</c:if> <!-- 추가 End --> <c:set var="fname" value="${vo.num}" /> <a
									href="boardContentForm?num=${vo.num}&pageNum=${pageNum}&number=${number+1}">
										${vo.subject} <c:if test="${replyCnt[fname]!=0}">
									[${replyCnt[fname]}]
								</c:if>
								</a>
								</td>
								<td align="center">${vo.id}</td>
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd HH:mm" value="${vo.reg_date}" /></td>
								<td align="center">${vo.readCnt}</td>

							</tr>
						</c:forEach>
					</c:if>
					<!-- 게시글이 없으면 -->
					<c:if test="${requestScope.dtos==null}">
						<tr>
							<th colspan="6" align="center">게시글이 없습니다. 글을 작성해 주세요.</th>
						</tr>
					</c:if>
				</tbody>
			</table>

			<table style="width: 1000px" align="center">
				<tr>
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음 : ◀◀                                  이전 : ◀-->
							<c:if test="${startPage > pageBlock}">
								<a href="boardQnaList">◀◀</a>
								<a href="boardQnaList?pageNum=${startPage-pageBlock}">&nbsp;◀</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="boardQnaList?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 끝 : ▶▶                                       다음 : ▶-->
							<c:if test="${pageCount > endPage}">
								<a href="boardQnaList?pageNum=${startPage+pageBlock}">▶&nbsp;</a>
								<a href="boardQnaList?pageNum=${pageCount}">▶▶</a>
							</c:if>
						</c:if></th>
				</tr>
			</table>
		</div>
	</div>
</body>


<%@ include file="../layout/footer_ara.jsp"%>
