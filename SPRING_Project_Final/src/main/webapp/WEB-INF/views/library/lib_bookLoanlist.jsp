<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file="../setting.jsp" %>  --%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!-- 대여 현황 -->

		
			<table class="responsive">
				<thead class="responsive">
					<tr>
						<th>대 여 일</th>
						<th>도서번호</th>
						<th>이 름</th>
						<th>반 납 예 정 일</th>
					</tr>
				</thead>
				<tbody class="responsive">
					<c:if test="${bloanVOs == null}">
						<tr>
							<td></td>
							<td colspan="7">검색 결과가 없습니다</td>							
						</tr>
					</c:if>
				
					<c:if test="${bloanVOs != null}">
					<c:forEach var="bloanVO" items="bloanVOs">
						<tr>
							<td>${bloanVO.loan_dt}</td>
							<td>${bloanVO.b_no}</td>
							<td>${bloanVO.user_no}</td>
							<td>${bloanVO.return_dt}</td>						
						</tr>
					</c:forEach>	
					</c:if>		
					
					<c:if test="${cnt > 0}">
						<tr>
							<td colspan="4">
								<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
								<c:if test="${startPage > pageBlock}">
									<a href="lib_bookLoanlist">[◀◀]</a>
									<a href="lib_bookLoanlist?pageNum=${startPage - pageBlock}">[◀]</a>
								</c:if>
							
								<!-- 페이지 -->
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<!-- 현재 페이지와 i가 같은 경우 -->
									<c:if test="${i == currentPage}">
										<span><b>[${i}]</b></span>
									</c:if>
									<!-- 현재 페이지와 i가 다를 경우 -->
									<c:if test="${i != currentPage}">
										<a href="lib_bookLoanlist?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>
								
								<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<a href="lib_bookLoanlist?pageNum=${startPage + pageBlock}">[▶]</a>
									<a href="lib_bookLoanlist?pageNum=${pageCount}">[▶▶]</a>
								</c:if>
							</td>
						</tr>
					</c:if>		
				</tbody>
			</table>	
		