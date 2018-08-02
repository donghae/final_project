<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<c:if test="${selectCnt == 1}"	>
		<c:if test="${vo.getEnt_state() == 2}">
			<script type="text/javascript">
				window.location='chk2'
			</script>
		</c:if>
		
		<c:if test="${vo.getEnt_state() == 1}">
			<script type="text/javascript">
				alert("귀하는 합격자 명단에 없습니다.");
				window.location='chk'
			</script>
		</c:if>
	</c:if>	

	<c:if test="${selectCnt == 0}"	>
			<script type="text/javascript">
				alert("이름과 주민등록번호를 다시 확인해주세요.");
				window.location='chk'
			</script>
	</c:if>		
</body>
</html>