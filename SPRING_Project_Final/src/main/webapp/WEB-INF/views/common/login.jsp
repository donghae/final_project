<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function loginChk(){
		if(!document.loginForm.userId.value){
			document.loginForm.userId.focus();
			return false;
		}else if(!document.loginForm.passwd.value){
			document.loginForm.passwd.focus();
			return false;
		}
	}
	function findId(){
		var url = "findId";
		window.open(url, "아이디찾기", "menubar=no, width=700, height=300");
	}
	function findPwd(){
		var url = "findPwd";
		window.open(url, "비밀번호찾기", "menubar=no, width=700, height=300");
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header_ara.jsp" />
		<form name="loginForm" action="login" method="post" onsubmit="return loginChk();" style="height: 500px;margin-top: 150px;">
			<table class="st_navy_login">
				<thead>
					<tr>
						<th colspan="2">로그인</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							아이디							
						</td>
						<td>
							<input type="text" name="userId" id="userId" required/>
						</td>						
					</tr>
					<tr>
						<td>
							비밀번호							
						</td>
						<td>
							<input type="password" name="passwd" id="passwd" required/>
						</td>						
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="로그인" class="btn_navy">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="아아디찾기" class="btn_navy" onclick="findId();">
							<input type="button" value="비밀번호찾기" class="btn_navy" onclick="findPwd();">
						</td>
					</tr>
				


			</tbody>
			</table>			
		</form>
	<%@ include file="../layout/footer_stu.jsp"%>
</body>
</html>