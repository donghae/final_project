<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"> -->

<link rel="stylesheet"
	href="resources/css/table_student.css">
</head>
<body>
	<%@include file="../layout/header_ara.jsp"%>


	

	<!-- Popular -->

	<div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<h1>학생</h1>
        <table class="st_navy">
        	<thead>
        		<tr>
        			<th>동아리명</th>
        			<th>위치</th>
        			<th>인원</th>
        			<th>분류</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>동아리1</td>
        			<td>101호</td>
        			<td>10명</td>
        			<td>1</td>
        		</tr>
        		<tr>
        			<td>동아리2</td>
        			<td>102호</td>
        			<td>20명</td>
        			<td>2</td>
        		</tr>
        		<tr>
        			<td>동아리3</td>
        			<td>103호</td>
        			<td>30명</td>
        			<td>3</td>
        		</tr>
        		<tr>
        			<td>동아리4</td>
        			<td>104호</td>
        			<td>40명</td>
        			<td>4</td>
        		</tr>        		
        	</tbody>
        </table>
        <h1>관리자</h1>
		<table class="st_navy">
        	<thead>
        		<tr>
        			<td align="center" colspan="5"><input type="button" class="btn_navy" value="추가"></td>
        		</tr>
        		<tr>
        			<th>동아리명</th>
        			<th>위치</th>
        			<th>인원</th>
        			<th>분류</th>
        			<th>수정/삭제</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>동아리1</td>
        			<td>101호</td>
        			<td>10명</td>
        			<td>1</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>동아리2</td>
        			<td>102호</td>
        			<td>20명</td>
        			<td>2</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>동아리3</td>
        			<td>103호</td>
        			<td>30명</td>
        			<td>3</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>동아리4</td>
        			<td>104호</td>
        			<td>40명</td>
        			<td>4</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>        		
        	</tbody>
        </table>
    </div>
	<%@include file="../layout/footer_lib.jsp"%>
</body>
</html>