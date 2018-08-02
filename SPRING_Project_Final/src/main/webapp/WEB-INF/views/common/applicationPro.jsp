<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<html>
<body>
	<c:if test="${chkCnt==0}">
		<script type="text/javascript">
			alert("신청완료")
			window.location = 'admission';
		</script>
	</c:if>
	<c:if test="${chkCnt==1}">
		<script type="text/javascript">
			alert("신청완료된 학생입니다.");
			window.location = 'admission';
		</script>
	</c:if>
</body>
</html>