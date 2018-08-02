<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center"> 글쓰기 </h2>
	<form action="dt_admin_notice_write_ins" method="post" name="writeform" onsubmit="return writeCheck();">
	
	<!-- Controller에서 받은 값 4개 히든으로 넘긴다 -->
	<input type="hidden" name="num" value="${num}">


	<table align="center">
		<tr>
			<th> 관리자번호 </th>
			<td>
				<input type="text" name="ad_no" maxlength="20">
			</td>
		</tr>
	
		<tr>
			<th> 제목 </th>
			<td>
				<input type="text" name="title" maxlength="10">
			</td>
		</tr>	
		
		<tr>
			<th> 내용 </th>
			<td>
			<textarea rows="10" cols="40" name="content" style="width:270px"></textarea>
			</td>
		</tr>

		<tr>
			<th> 첨부파일 </th>
			<td>
				<input type="text" name="file" maxlength="50" style="width:270px;">
			</td>
		</tr>
			
		<tr>
			<th colspan="2">
				<input type="submit" value="작성">
				<input type="reset" value="취소">
				<input type="button" value="목록"
					   onclick="window.location='dormitory_admin_notice?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>

	</form>
</body>
</html>