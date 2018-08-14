<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file= "../../setting.jsp" %>

<c:choose>
	<c:when test="${insertCnt == amt && insertCnt > 0}">
		<script type="text/javascript">
			alert("도서 등록 완료");
			var choice = confirm("다른 도서를 등록하시겠습니까?");
			if(choice == true) {
				window.location="lib_bookAddForm";
			} else {
				window.location="lib_bookSearch_admin";
			}			
		</script>
	</c:when>
	
	<c:when test="${insertCnt != amt && insertCnt > 0}">
		<script type="text/javascript">
			alert("도서 등록에 누락된 도서가 있습니다. 확인바랍니다");
			window.location="lib_bookSearch_admin";
		</script>
	</c:when>
	
	<c:otherwise>
		<script type="text/javascript">
			alert("도서 등록 실패");
			window.location="lib_bookAddForm";
		</script>
	</c:otherwise>
</c:choose>
