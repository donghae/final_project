<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${selectCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal(admin_idChk).then((okay) => {
				  if (okay) {
					  window.location="history.back()";
					  }
					});
			
		</script>
	</c:if>

	<c:if test="${selectCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("관리자 로그인 되었습니다.").then((okay) => {
				  if (okay) {
					  window.location='dormitory_admin_stu';	
					  }
					});
		</script>	
	</c:if>


</body>
</html>