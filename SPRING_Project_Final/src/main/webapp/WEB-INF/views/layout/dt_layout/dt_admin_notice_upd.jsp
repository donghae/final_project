<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td{
		height:40px;
	}
</style>
</head>
<body>
	<h2 align="center">글 수정</h2>
	<h2 align="center"> </h2>
	<c:if test="${dto == null}">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script type="text/javascript">
			swal("글 수정 중 오류가 발생 했습니다.").then((okay) => {
				  if (okay) {
					  window.location="dormitory_admin_notice";
					  }
					});
		</script>
	</c:if>
	
	<c:if test="${dto != null }">
	<form action="dt_admin_notice_modify_con" name="notice_modify" method="post">
		<table style="width:1000px" align="center" border="1">
			<tr>
				<td colspan="2" align="center"> 수정할 정보를 입력하세요.</td>
			</tr>

			<tr>
				<td align="center"> 관리자번호 </td>
					<td align="center"> 
						<c:if test="${dto.ad_no == 018202001}">
							<input type="text" name="dh">
						</c:if>
						<c:if test="${dto.ad_no == 018304001}">
							<input type="text" name="dh">
						</c:if>						
						<c:if test="${dto.ad_no == 018104001}">
							<input type="text" name="dh">
						</c:if>						
						<c:if test="${dto.ad_no == 018401001}">
							<input type="text" name="dh">
						</c:if>						
						<c:if test="${dto.ad_no == 018505001}">
							<input type="text" name="dh">
						</c:if>
						<c:if test="${dto.ad_no == 018601001}">
							<input type="text" name="dh">
						</c:if>	
					</td>
			</tr>
			
			<tr>
				<td align="center"> 글제목 </td>
				<td align="center">
					<input type="text" name="notice_title" maxlength="50"
						   value="${dto.dorm_n_title}" style="width:500px;">
				</td>
			</tr>
			
			<tr>
				<td align="center"> 글내용 </td>
				<td align="center">
					<textarea  rows="10" cols="40" name="notice_content" style="size:10em;">${dto.dorm_n_content}</textarea>
				</td>
			</tr>
		
			<tr>
				<td align="center"> 작성일 </td>
				<td align="center"> 
					<input  type="Date" name="notice_dt" maxlength="10" value="${dto.dorm_n_dt}">
				</td>
			</tr>
			
			<tr>
				<td align="center"> 첨부파일 </td>
				<td align="center">
					<input type="text" name="notice_file" value="${dto.dorm_n_file}">
				</td>
			</tr>
		
			<tr>
				<td colspan="2" align="center">
					<input class="inputButton" type="submit" value="수정">
					<input class="inputButton" type="reset" value="수정취소">
					<input class="inputButton" type="button" value="목록보기"
					       onclick="window.location='dt_admin_notice_board?pageNum=${pageNum}&num=${dto.dorm_n_no}'">
				</td>
			</tr>
		</table>	
	</form>	
	</c:if>
</body>
</html>