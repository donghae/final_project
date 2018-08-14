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
	<h2><center> 상세페이지 </center></h2>

	<table align="center" border="1">
		<tr>
			<th style="width:150px"> 글번호 </th>
			<td style="width:150px"> ${dto.dorm_n_no} </td>
			<th style="width:150px"> 조회수 </th>
			<th style="width:150px"> ${dto.dorm_n_cnt}	</th>
		</tr>
	
		<tr>
			<th style="width:150px"> 작성자 </th>
 					<td align="center">
						<c:if test="${dto.ad_no == '018104001'}">
							박희현
						</c:if>
						<c:if test="${dto.ad_no == 018202001}">
							김동해
						</c:if>
						<c:if test="${dto.ad_no == 018304001}">
							이아름
						</c:if>											
						<c:if test="${dto.ad_no == 018401001}">
							이승희
						</c:if>						
						<c:if test="${dto.ad_no == 018505001}">
							최유민
						</c:if>
						<c:if test="${dto.ad_no == 018601001}">
							김광민
						</c:if>																	
					</td>
		
			<th style="width:150px"> 작성일 </th>
			<td style="width:150px" align="center"> 
				<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.dorm_n_dt}"/> </td>
		</tr>
	
		<tr>
			<th> 글제목 </th>
			<td colspan="3"> ${dto.dorm_n_title}</td>	
		</tr>
	
		<tr>
			<th> 글내용 </th>
			<td colspan="3"> ${dto.dorm_n_content} </td>
		</tr>
	
		<tr>
			<th> 첨부파일 </th>
			<td colspan="3"> ${dto.dorm_n_file} </td>
		</tr>
	
		<tr>
			<th colspan="4">
				<input class="inputButton" type="button" value="글수정"
					onclick="window.location='dt_admin_notice_modify?num=${dto.dorm_n_no}&pageNum=${pageNum}'">
					
				<input class="inputButton" type="button" value="글삭제"
					onclick="window.location='#?num=${dto.dorm_n_no}&pageNum=${pageNum}'">
					
				<input class="inputButton" type="button" value="목록보기"
					onclick="window.location='dt_admin_notice_sel?pageNum=${pageNum}'">
		</tr>
	
	</table>
</body>
</html>