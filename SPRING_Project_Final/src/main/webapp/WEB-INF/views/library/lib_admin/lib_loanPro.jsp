<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>


	<c:choose>
		
		<c:when test="${certiry == 1}">
		<!-- 학생,교수,관리자로 증명되었을 경우 -->
			<c:if test="${loanCnt > 0}">
			<!-- 도서 대여 성공 시 -->
				<c:if test="${loan_unable != null}">					
				<!-- 대여가 안된 도서가 있을 경우 -->
					<c:set var="a" value="a"/>
					<c:forEach var="unable" items="${loan_unable}">
						<c:choose>						
							<c:when test="${a=='a'}">
								<c:set var="a" value="${unable}"/>	
							</c:when>
							
							<c:otherwise>
								<c:set var="a" value="${a},${unable}"/>	
							</c:otherwise>					
						</c:choose>
					</c:forEach>
					
					<script type="text/javascript">						
						alert("${a} 은 대여 중인 도서입니다");						
					</script>					
				</c:if>	
				
				<script type="text/javascript">
					alert(${loanCnt} + "권이 대여 되었습니다");
					window.location="lib_loanSupervise";
				</script>
			</c:if>
			
			<!-- 제목 ,반납일, 해당 도서는 없습니다  -->			
			<c:if test="${loanCnt == 0 || loanCnt == null}">
			
				<c:if test="${b_certiry == 0}">
					<script type="text/javascript">
						alert("유효하지 않는 도서가 있습니다");
						window.location="lib_loanSupervise";
					</script>
				</c:if>	
				
				<c:if test="${b_certiry != 0}">
					<script type="text/javascript">
						alert("대여 중인 도서가 있습니다");
						window.location="lib_loanSupervise";
					</script>
				</c:if>
				
				<c:if test="${loaning == 2}"><!-- (1:도서관보관중 , 2:대여중) -->
					<script type="text/javascript">
						alert("대여 중인 도서가 있습니다");
						window.location="lib_loanSupervise";
					</script>
				</c:if>
			</c:if>	
		
		</c:when>
		
		
		<c:when test="${certiry == -1}">
		<!-- 증명 실패했을 경우 -->
			<script type="text/javascript">
				alert("도서관 이용권한이 없습니다");
				window.location="lib_loanSupervise";
			</script>
		</c:when>
		
	</c:choose>