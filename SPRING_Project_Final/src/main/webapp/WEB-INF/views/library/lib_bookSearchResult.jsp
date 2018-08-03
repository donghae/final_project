<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   
<link rel="stylesheet" href="resources/css/box_mon.css"> 



		
<!-- 검색 결과 -->

	<div class="content">
		<table class="st_beige">
			<thead class="st_beige">
				<tr>
					<th>도서번호</th>
					<th>대 분 류</th>
					<th>중 분 류</th>
					<th>제 목</th>
					<th>저 자</th>
					<th>출 판 사</th>
					<th>대출가능</th>
					<th></th>
				</tr>
			</thead>
			
			<tbody class="st_beige">
				<c:if test="${bVOs == null}">
					<tr>
						<td></td>
						<td colspan="7">검색 결과가 없습니다</td>							
					</tr>
				</c:if>



				
				<c:if test="${bVOs != null}">
				<c:forEach var="bVOs" items="${bVOs}">
					<tr>
						<td>${bVOs.b_no}</td>
						<td>${bVOs.b_global}</td>
						<td>${bVOs.b_category}</td>
						<td>${bVOs.b_title}</td>
						<td>${bVOs.b_author}</td>
						<td>${bVOs.b_publish}</td>
						<td>${bVOs.b_state_fl}</td>
						<td>
							<Button class="btn_navy" type="button" onclick="window.location='lib_bookModiForm?b_no=${bVOs.b_no}'">수정</Button>&nbsp;
							<Button class="btn_navy" type="button" onclick="javascript:delBook('${bVOs.b_no}');">삭제</Button>
							<%-- <c:if test="${memId != null}">
								<Button class="btn_navy" type="button" onclick="window.location='#'">도서 예약</Button>							
							</c:if> --%>
						</td>								
					</tr>
				</c:forEach>
				</c:if>	
			</tbody>
		</table>
		
					<br><br>
			<!-- 페이지 컨트롤 버튼 -->
			<div class="cen_middle">
				<c:if test="${cnt > 0}">
					<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="lib_bookSearch">[◀◀]</a>
						<a href="lib_bookSearch?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
				
					<!-- 페이지 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<!-- 현재 페이지와 i가 같은 경우 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<!-- 현재 페이지와 i가 다를 경우 -->
						<c:if test="${i != currentPage}">
							<a href="lib_bookSearch?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="lib_bookSearch?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="lib_bookSearch?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>			
		</div>
	</article>
	
	
