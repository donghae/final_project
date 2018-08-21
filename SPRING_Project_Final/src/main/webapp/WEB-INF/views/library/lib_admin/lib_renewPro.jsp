<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>
<body>
	<c:choose>
		<c:when test="${certiry == 1}">
		<!-- 학생,교수,관리자로 증명되었을 경우 -->
			<c:if test="${renewCnt > 0}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script type="text/javascript">
					swal(${renewCnt} + "권이 연장 되었습니다").then((okay) => {
						  if (okay) {
							  window.location="lib_loanSupervise";
							  }
							});
					
				</script>
			</c:if>
			<c:if test="${renewCnt == 0}">
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<script type="text/javascript">
					swal("연장 실패. 잠시 후, 다시 시도해 주시길 바랍니다").then((okay) => {
						  if (okay) {
							  window.location="lib_loanSupervise";
							  }
							});
					
				</script>
			</c:if>	
		</c:when>
		
		
		<c:when test="${certiry == -1}">
		<!-- 증명 실패했을 경우 -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
				swal("해당 도서관 이용권한이 없는 이용자입니다").then((okay) => {
					  if (okay) {
						  window.location="lib_loanSupervise";
						  }
						});
				
			</script>
		</c:when>
	</c:choose>
</body>
