<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${updateCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("외박 신청 삭제 중 오류가 발생했습니다. "+"\n" + "다시 시도해 주세요.").then((okay) => {
				  if (okay) {
					  window.location="dormitory_stu_overnight";
					  }
					});
		</script>
	</c:if>

	<c:if test="${updateCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
				swal("외박 삭제 신청 되었습니다.").then((okay) => {
					  if (okay) {
						  window.location='dormitory_stu_overnight';
						  }
						});
		</script>	
	</c:if>
</body>
</html>