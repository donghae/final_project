<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>

	
	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			alert("도서 삭제 완료");
			window.location="lib_bookSearch_admin";
		</script>
	</c:if>
	<c:if test="${deleteCnt != 1}">
		<script type="text/javascript">
			alert("도서 삭제 실패");
			window.location="lib_bookSearch_admin";
		</script>
	</c:if>
