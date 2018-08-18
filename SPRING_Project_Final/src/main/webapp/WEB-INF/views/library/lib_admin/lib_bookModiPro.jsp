<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt == 1}">
	
	<!-- 	<script type="text/javascript">
			alert("도서 수정 완료");
			window.location="lib_bookSearch_admin";
		</script> -->
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("도서 수정 완료");
			setTimeout(function() {
				window.location="lib_bookSearch_admin";
			}, 1000);
			
		</script>
	</c:if>
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			alert("도서 수정 실패");
			window.location="lib_bookModiForm?b_no="+${b_no};
		</script>
	</c:if>
</body>
</html>