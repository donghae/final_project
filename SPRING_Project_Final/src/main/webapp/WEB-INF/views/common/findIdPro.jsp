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
	<form name="findForm" action="findPwd">
		<table class="st_navy">
			<thead>
				<tr>
					<th colspan="2">아이디찾기</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${idList!=null}">
					<tr>

						<td>아이디 :</td>
						<td><c:forEach var="id" items="${idList}">
							${id}<input type="hidden" name="id" value="${id}">
						</c:forEach></td>
					</tr>
				</c:if>
				<c:if test="${idList==null}">
					<tr>
						<td colspan="2">아이디가 없습니다</td>
					</tr>
				</c:if>

				<tr>
					<td colspan="2">
						<c:if test="${idList!=null}">
							<input type="submit" value="비밀번호찾기" class="btn_navy">
						</c:if>
							<input type="button" value="닫기" class="btn_navy" onclick="self.close();">
						
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>