<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../setting.jsp"%>
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
	    width:60px;	
	}
	.st_navy td {
	    text-align:center;
	    width:60px;	
	}
</style>
</head>
<body>
	<div style="width:900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<div style="width: 30%; float: left;">
							<br><br>
							<h1>출결현황</h1>
						</div>
						<div style="width: 30%; margin-left:720px;">
							<br><br><br><br><br>
							<h3>강의별 출결현황</h3>
						</div>
					</div>
				</aside>			
							
				<div class="inbox-body">	
					<div class="mail-option">
					<p>강의명 : ${lec_name}</p>
						<table class="st_navy" style="text-align:center;">
							<thead>	
								<tr>
										<c:forEach var="i" begin="0" end="14">
									<th>${i+1}</th>
										</c:forEach>
								</tr>
						</thead>
											
		<tbody>
			<tr>
				<c:forEach var="i" begin="0" end="14">	
					<td>
					<c:if test="${list[i].attend_fl == 0}"><!-- 결석 -->
						Ⅹ</c:if>
					<c:if test="${list[i].attend_fl==1}"><!-- 정상 -->
						○</c:if>
					<c:if test="${list[i].attend_fl==2}"><!-- 지각 -->
						△</c:if>
					</td>	
				</c:forEach>
			</tr>
		</tbody>						
							<tfoot>
									<tr>
										<td colspan="16" style="text-align:right;">O:출석, △:지각, X:결석</td>
									</tr>		
							</tfoot>
						</table>
					</div><!-- mail-box -->
				</div><!-- container -->
			</div>
		</div>
	</div>
</body>
</html>