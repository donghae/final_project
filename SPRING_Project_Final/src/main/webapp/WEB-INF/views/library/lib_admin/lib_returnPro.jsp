<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>


	<c:choose>
		
		<c:when test="${certiry == 1}">
		<!-- 학생,교수,관리자로 증명되었을 경우 -->
			<c:if test="${returnCnt > 0}">
			<!-- 반납 성공 시 -->
			<c:if test="${return_unable != null}">					
				<!-- 반납이 안된 도서가 있을 경우 -->
					<c:set var="a" value="a"/>
					<c:forEach var="unable" items="${return_unable}">
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
						alert("${a} 은 반납할 수 없는 도서입니다");						
					</script>					
				</c:if>	
				
				<script type="text/javascript">
					alert(${returnCnt} + "권이 반납되었습니다");
					window.location="lib_loanSupervise";
				</script>
			</c:if>
			
			<!-- 제목 ,반납일, 해당 도서는 없습니다  -->			
			<c:if test="${returnCnt == 0 || returnCnt == null}">			
				<c:if test="${b_certiry == 0}">
					<script type="text/javascript">
						alert("유효하지 않는 도서번호 입니다");
						window.location="lib_loanSupervise";
					</script>
				</c:if>	
				
				<c:if test="${b_certiry != 0}">
					<script type="text/javascript">
						alert("반납 실패. 대여정보가 일치하지 않습니다");
						window.location="lib_loanSupervise";
					</script>
				</c:if>	
				
				<c:if test="${loaning == 1}"><!-- (1:도서관보관중 , 2:대여중) -->
					<script type="text/javascript">
						alert("대여 기록이 없는 도서입니다");
						window.location="lib_loanSupervise";
					</script>
				</c:if>	
						
			</c:if>	
		</c:when>
		
		
		<c:when test="${certiry == -1}">
		<!-- 증명 실패했을 경우 -->
			<script type="text/javascript">
				alert("해당 도서관 이용권한이 없는 이용자입니다");
				window.location="lib_loanSupervise";
			</script>
		</c:when>
	</c:choose>