<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../setting.jsp" %>

	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
			alert("도서 수정 완료");
			window.location="lib_bookSearch";
		</script>
	</c:if>
	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
			alert("도서 수정 실패");
			window.location="lib_bookModiForm?b_no="+${b_no};
		</script>
	</c:if>
	
