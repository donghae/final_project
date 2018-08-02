<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<html>
<body>
	<script type="text/javascript">
		alert("승인되었습니다.")
		window.location = 'st_adm?st_state=6&major='+${major};
	</script>
</body>
</html>