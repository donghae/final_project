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
	<c:if test="${updateCnt == 0}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("공지사항 수정이 취소 되었습니다." +"\n" + "다시 시도해 주세요").then((okay) => {
				  if (okay) {
					  window.location="history.back()";
					  }
					});
			
		</script>
	</c:if>

	<c:if test="${updateCnt == 1}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("수정이 정상 처리되었습니다.").then((okay) => {
				  if (okay) {
					  window.location='dt_admin_notice_sel';
					  }
					});
		</script>	
	</c:if>
</body>
</html>