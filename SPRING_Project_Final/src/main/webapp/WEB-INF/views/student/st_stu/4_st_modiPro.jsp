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
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
			swal("정보수정실패").then((okay) => {
				  if (okay) {
					  window.location="st_stu?st_state=10";
					  }
					});
			</script>
		</c:if>
		
		
		<c:if test="${updateCnt != 0}">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<script type="text/javascript">
			swal("내 정보가 수정되었습니다.").then((okay) => {
				  if (okay) {
					  window.location="st_stu?st_state=10";
					  }
					});
			</script>
		</c:if>	
</body>
</html>