<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/box_mon.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/font_common.css">
<link rel="stylesheet" href="resources/css/footer_ara.css">
<link rel="stylesheet" href="resources/css/form-basic.css">
<link rel="stylesheet" href="resources/css/header_ara.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
<style type="text/css">
.st_navy th {
	text-align:center;
}
.st_navy td {
	text-align:center;
}
</style>
<script type="text/javascript">
   function locate(){
      window.location='st_stu?st_state=15&semester='+loca.value;
   }
   function focus(semester){
      loca.value=semester;
   }
</script>
</head>
<body onload="focus(${semester});">
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
						<div style="width: 30%; float: left;">
							<br>
							<br>
							<h1>성적 관리</h1>
						</div>
						<div style="width: 30%; margin-left:650px;">
							<br><br><br><br><br>
							<h3>성적 관리 > 성적 조회</h3>
						</div>
						</div>
					</aside>
					
				<div><!-- <div class="inbox-body"> -->
				

				<table class="st_navy">
					<thead>
						<tr>
							<td colspan="5">
								<select id="loca" class="input" name="semester">			
				                     <option value="2018-1">2018-1학기</option>
				                     <option value="2017-2">2017-2학기</option>
				                     <option value="2017-1">2017-1학기</option>
				                     <option value="2016-2">2016-1학기</option>
				                     <option value="2016-1">2016-1학기</option>
				                     <option value="2015-2">2015-1학기</option>
				                     <option value="2015-1">2015-1학기</option>
			                  </select>
			                  <input class="btn_navy" type="button" value="조회"
			                     onclick="locate();">
							</td>
						</tr>
					
						<tr>
							<th>연도-학기</th>
							<th>강의번호</th>
							<th>강의명</th>
							<th>평균평점</th>
							<th>성적인정</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${cnt>0}">
						<c:set var="avg" value="0" />
						<c:forEach var="dto" items="${dtos}">
							<tr>
								<td>${dto.gpa_semester}학기</td>					
								<td>${dto.lec_no}</td>													
								<td>${dto.lec_name}</td>						
								<td>${dto.gpa}</td>					
								<td>Y</td>
							</tr>
							<c:set var="avg" value="${avg + dto.gpa}" />
						</c:forEach>

						<tr>
							<td colspan="5" style="text-align:right;">평점평균: 
								<fmt:formatNumber value="${avg/cnt}" pattern=".00"/>
							</td>
						</tr>
						</c:if>
						
						<c:if test="${cnt==0}">
						
							<tr>
								<td colspan="5">
									해당하는 학기의 성적이 없습니다.
								</td>
							</tr>
						
						</c:if>
					</tbody>	
				</table>
			</div>	
			</div>
		</div>
	</div>
</body>