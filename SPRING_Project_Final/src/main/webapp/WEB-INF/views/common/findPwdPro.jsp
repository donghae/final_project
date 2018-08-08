<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form name="findForm" action="findPwdPro">
		<table class="st_navy">
			<thead>
				<tr>
					<th colspan="2">비밀번호찾기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<c:if test="${idList!=null}">
							이메일로 비밀번호가 전송되었습니다.
						</c:if>
						<c:if test="${idList==null}">
							비밀번호 찾기에 실패했습니다.
						</c:if>
					</td>
					
				</tr>				
				<tr>
					<td colspan="2">
						<input type="button" value="닫기" class="btn_navy" onclick="self.close();">						
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>