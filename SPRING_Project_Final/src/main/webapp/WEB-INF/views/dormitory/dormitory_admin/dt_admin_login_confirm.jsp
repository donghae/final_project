<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dorm_setting.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${selectCnt == 0}">
		<script type="text/javascript">
			alert(admin_idChk);
			window.location="history.back()";
		</script>
	</c:if>

	<c:if test="${selectCnt == 1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("관리자 로그인 되었습니다.");
				window.location='dormitory_admin_stu';				
			}, 1000)	
		</script>	
	</c:if>


</body>
</html>