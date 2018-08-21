<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  

 <style>
	.penalty{
		position: relative;
		top:250px;

	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	top:50px;
	}
</style>
<body>
<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="cy_1">
			<h2>외박 승인 대기</h2>			
		</div>
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1200px; height: 40%;">
			<table class="st_mint" >
				<thead>
					<tr>
						<th style="width: 7%">번호</th>
						<th style="width: 10%">학번</th>
						<th style="width: 10%">이름</th>
						<th style="width: 7%">외박점수</th>
						<th style="width: 15%">외박신청일</th>
						<th style="width: 35%">외박사유</th>
						<th style="width: 16%">승인여부</th>			
					</tr>
					
				</thead>
				<!-- 게시글이 있으면 -->
				<tbody>
					<c:if test="${requestScope.dtos!=null}">
						<c:forEach var="dto" items="${dtos}">
							<c:if test="${dto.dorm_ex_fl != 1}">
							<tr>
								<td align="center">${number}<c:set var="number"
										value="${number-1}" />
								</td>
								<td>${dto.st_no} </td>
								<td align="center">${dto.st_name}</td>
								<td align="center">${dto.dorm_on_sc}</td>
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.dorm_ex_dt}" /></td>
								<td align="center">${dto.dorm_reason}</td>
								<td align="center">승인 완료</td>
							</tr>				
							</c:if>		
							<c:if test="${dto.dorm_ex_fl == 1}">
								<tr>					
									<td colspan="8" align="center">외박 신청 현황이 없습니다.</td>
								</tr>
							</c:if>																
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		
			<table style="text-align: center">
				<tr>
					<th align="center"><c:if test="${cnt>0}">
							<!-- 처음 : ◀◀                                  이전 : ◀-->
							<c:if test="${startPage > pageBlock}">
								<a href="cy_main">◀◀</a>
								<a href="cy_main?pageNum=${startPage-pageBlock}">&nbsp;◀</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i==currentPage}">
									<span><b>[${i}]</b></span>
								</c:if>
								<c:if test="${i!=currentPage}">
									<a href="cy_main?pageNum=${i}">[${i}]</a>
								</c:if>
							</c:forEach>

							<!-- 끝 : ▶▶                                       다음 : ▶-->
							<c:if test="${pageCount > endPage}">
								<a href="cy_main?pageNum=${startPage+pageBlock}">▶&nbsp;</a>
								<a href="cy_main?pageNum=${pageCount}">▶▶</a>
							</c:if>
						</c:if></th>
				</tr>
			</table>
		</div>
	</div>
</c:if>	

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
