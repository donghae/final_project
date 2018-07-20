<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
<body>
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
				<div class="inbox-head">
					<div style="width:30%; float:left;">
						<br><br>
						<c:if test="${sessionScope.state==0}">
							<h3>학적 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==1}">
							<h3>학생 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==2}">
							<h3>성적 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==3}">
							<h3>출결 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==4}">
							<h3>장학금 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==5}">
							<h3>지원서 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==6}">
							<h3>합격 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==7}">
							<h3>예비 합격자 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==8}">
							<h3>강의 관리</h3>
						</c:if>
					</div>
						<div style="width:30%;float:right;">
						<br><br>
							<c:if test="${sessionScope.state==0}">
							<h3></h3>
						</c:if>
						<c:if test="${sessionScope.state==1}">
							<h3>학사 관리 -> 학생 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==2}">
							<h3>학사 관리 -> 성적 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==3}">
							<h3>학사 관리 -> 출결 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==4}">
							<h3>학사 관리 -> 장학금 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==5}">
							<h3>입학 관리 -> 지원서 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==6}">
							<h3>입학 관리 -> 합격 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==7}">
							<h3>입학 관리 -> 예비합격자 관리</h3>
						</c:if>
						<c:if test="${sessionScope.state==8}">
							<h3>강의관리 -> 강의 관리</h3>
						</c:if>
						</div>
				</div>
				<div class="inbox-body">
					<div class="mail-option">
						<table class="table table-inbox table-hover">
							<tbody>
								<tr class="unread">
									<td class="view-message  dont-show">번호</td>
									<td class="view-message">이름</td>
									<td></td>
									<td></td>
									<td><span>분류
											<div>
												<span class="label label-success pull-left"> </span> <span
													class="label label-info pull-left"> </span> <span
													class="label label-warning pull-left"> </span> <span
													class="label label-danger pull-left"> </span>
											</div>
									</span></td>
									<td class="view-message  text-left">비고</td>
								</tr>
								<tr class="">
									<td class="view-message  dont-show">NV0001</td>
									<td colspan="3" class="view-message">박희현</td>
									<td>3</td>
									<td class="view-message  text-left">승인</td>
								</tr>
								<tr class="">
									<td class="view-message dont-show">NV0005</td>
									<td colspan="3" class="view-message">박희현</td>
									<td>2</td>
									<td class="view-message  text-left">승인</td>
								</tr>
								<tr class="">
									<td class="view-message dont-show">NV0006</td>
									<td colspan="3" class="view-message">박희현</td>
									<td>1</td>
									<td class="view-message  text-left">미승인</td>
								</tr>
								<tr class="">
									<td class="view-message dont-show">NV0010</td>
									<td colspan="3" class="view-message">박희현</td>
									<td>2</td>
									<td class="view-message  text-left">승인</td>
							</tbody>
						</table>
					</div>
				</aside>
			</div>
		</div>
	</div>
</body>