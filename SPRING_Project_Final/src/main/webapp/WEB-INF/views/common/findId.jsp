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
	<form name="findForm" action="findIdPro" onsubmit="return chk();">
		<table class="st_navy">
			<thead>
				<tr>
					<th colspan="2">아이디찾기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>이름 입력</td>
					<td><input type="text" name="userName" required></td>
				</tr>
				<tr>
					<td>생년월일 입력</td>
					<td><input type="text" size="6" maxlength="6" name="birth1" required>-<input type="text" maxlength="1" size="1" name="birth2" required>******</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="아이디찾기" class="btn_navy">						
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>