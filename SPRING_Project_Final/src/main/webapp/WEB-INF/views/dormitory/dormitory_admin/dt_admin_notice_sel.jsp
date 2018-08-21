<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  
<%-- <%@ include file="../dorm_setting.jsp" %> --%>

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
			<h2>공지 사항</h2>	
			<table class="st_mint" >				
				<tr>
					<td colspan="7" align="center" style="height:25px">
						글목록(갯수 : ${cnt}) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="dt_admin_notice_write?pageNum=${pageNum}"> 글쓰기</a>
					</td>
				</tr>	
			</table>				
		</div>
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1200px; height: 40%;">
			<table class="st_mint" >			
				<thead>
					<tr>
						<td style="width:5%" align="center"> 글번호 </td>
						<td style="width:10%" align="center"> 작성자 </td>
						<td style="width:20%" align="center"> 제목 </td>
						<td style="width:20%" align="center"> 내용 </td>
						<td style="width:15%" align="center"> 작성일 </td>
						<!-- <td style="width:10%" align="center"> 첨부파일 </td> -->
						<td style="width:5%" align="center"> 조회수 </td>		
					</tr>
					
				</thead>
				<!-- 게시글이 있으면 -->
				<tbody>
					<c:if test="${requestScope.dtos!=null}">
						<c:forEach var="dto" items="${dtos}">							
							<tr>
								<%-- <td align="center">${number}<c:set var="number"
										value="${number-1}" />
								</td> --%>
								<td>									
									<a style="color: black;" href="#?num=${dto.dorm_n_no}&pageNum=${pageNum}">
										${dto.dorm_n_no} 
									</a>
								</td>
								<td align="center">
									<c:if test="${dto.ad_no == '018104001'}">
										박희현
									</c:if>
									<c:if test="${dto.ad_no == 018202001}">
										김동해
									</c:if>
									<c:if test="${dto.ad_no == 018304001}">
										이아름
									</c:if>											
									<c:if test="${dto.ad_no == 018401001}">
										이승희
									</c:if>						
									<c:if test="${dto.ad_no == 018505001}">
										최유민
									</c:if>
									<c:if test="${dto.ad_no == 018601001}">
										김광민
									</c:if>																	
								</td>
								<td><a style="color: black;" href="dt_admin_notice_board?num=${dto.dorm_n_no}&pageNum=${pageNum}&number=${number+1}&cnt=${dto.dorm_n_cnt}"> ${dto.dorm_n_title}</a></td>
								<td align="center">${dto.dorm_n_content}</td>
								<td align="center"><fmt:formatDate type="both"
										pattern="yyyy-MM-dd" value="${dto.dorm_n_dt}" /></td>
								<%-- <td align="center">${dto.dorm_n_file}</td> --%>
								<td align="center">${dto.dorm_n_cnt}</td>
							</tr>
							
							<c:if test="${requestScope.dtos==null}">
								<tr>					
									<td colspan="8" align="center">벌점 현황이 없습니다.</td>
								</tr>
							</c:if>																		
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		
		<br><br>
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
