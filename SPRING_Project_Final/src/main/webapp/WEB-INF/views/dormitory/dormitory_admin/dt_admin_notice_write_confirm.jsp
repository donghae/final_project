<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dorm_setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${insertCnt == 0}">
		<script type="text/javascript">
			alert("공지사항 등록에 실패 했습니다." +"\n" + "다시 시도해 주세요");
			window.location="dormitory_admin_notice";
		</script>
	</c:if>

	<c:if test="${insertCnt == 1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("정상적으로 공지사항 등록  되었습니다.");
				window.location='dormitory_admin_notice';				
			}, 1000)	
		</script>	
	</c:if>
</body>
</html>