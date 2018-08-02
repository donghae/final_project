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
	table.table_student {
		border:1px solid black;
		text-align:center;
		width:300px;
		margin-left:500px;
	}
	.table_student th, td {
	    text-align:center;
	}
	.st_navy th {
	    text-align:center;		
	}
	.st_navy {
		border:1px solid black;
		text-align:center;
		width:700px;
	}
	.st_navy td {
	    text-align:center;
	}
	.btn_navy {
		float:right;
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
							<h1>장학금 신청</h1>
						</div>
						<div style="width: 30%; margin-left:560px;">
							<br><br><br><br><br>
							<h3>장학금 관리 > 장학금 신청</h3>
						</div>
					</div>
				</aside>			

				<!-- <div class="inbox-body" style="width: 1300px; height: 1000px; margin-left:0%;"> -->							
				<div class="inbox-body">	
					<div class="mail-option">
						<table class="st_navy">
							<thead>
								<tr>
									<th>학기</th>
									<th>학년</th>
									<th>학과</th>
									<th>학번</th>
									<th>이름</th>
									<th>성적</th>
								</tr>
							</thead>
						
							<tbody>	
									<tr>
										<td>(학기)</td>
										<td>${vo.getSt_level()}</td>
										<td>${vo.getMaj_cd()}</td>
										<td>${vo.getSt_no()}</td>
										<td>${vo.getSt_name()}</td>
										<td>(성적)</td>
									</tr>																																																
							</tbody>
							
							<tfoot>
								<tr>
									<td colspan="6">
										<input class="btn_navy" type="button" value="신청">
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>