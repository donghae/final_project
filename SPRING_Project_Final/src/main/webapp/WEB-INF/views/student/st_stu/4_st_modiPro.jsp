<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/boot_student/button.css">
<link rel="stylesheet" href="resources/boot_student/table_admin.css">
<link rel="stylesheet" href="resources/boot_student/table_student.css">
</head>
<body>
		<c:if test="${updateCnt == 0}">
			<script type="text/javascript">
				errorAlert(updateError);
			</script>
		</c:if>
		
		<c:if test="${updateCnt != 0}">
			<script type="text/javascript">
				alert("내 정보가 수정되었습니다.");
				window.location="st_stu?st_state=10";
			</script>
		</c:if>	
</body>
</html>