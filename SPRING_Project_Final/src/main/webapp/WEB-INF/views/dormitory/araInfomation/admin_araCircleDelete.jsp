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
	<c:if test="${deleteCnt == 0}">
		<script type="text/javascript">
			alert("동아리 삭제가 취소 되었습니다." +"\n" + "다시 시도해 주세요");
			window.location="araCircleBefore";
		</script>
	</c:if>

	<c:if test="${deleteCnt == 1}">
		<script type="text/javascript">
			setTimeout(function(){
				alert("동아리 삭제가 정상 처리되었습니다.");
				window.location='stu_infomation';				
			}, 1000)	
		</script>	
	</c:if>
</body>
</html>