<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../setting.jsp" %>


	<c:choose>
		
		<c:when test="${certiry == 1}">
		<!-- 학생,교수,관리자로 증명되었을 경우 -->
			<c:if test="${loanCnt > 0}">
				<script type="text/javascript">
					alert(${loanCnt} + "권이 대출 되었습니다");
					window.location="lib_bookLoanForm";
				</script>
			</c:if>
			
			<!-- 제목 ,반납일, 해당 도서는 없습니다  -->
			
			<c:if test="${loanCnt == 0}">
				<script type="text/javascript">
					alert("대여 실패. 해당 도서는 대여 중입니다");
					window.location="lib_bookLoanForm";
				</script>
			</c:if>	
		</c:when>
		
		
		<c:when test="${certiry == -1}">
		<!-- 증명 실패했을 경우 -->
			<script type="text/javascript">
				alert("해당 도서관 이용권한이 없는 이용자입니다");
				window.location="lib_bookLoanForm";
			</script>
		</c:when>
	</c:choose>