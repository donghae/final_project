<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<style>
.cy_1 {
	margin-top: 21px;
}

.tab1 {
	width: 100%;
	height: 80%;
	border: 1px solid;
	border-collapse: collapse;
	margin: 5px auto;
}

.tab1 tr td {
	border-top: 1px solid;
	border-left: 1px solid;
	text-align: center;
	border-collapse: collapse;
	height: 10%;
}

.section_0 {
	width: 100%;
	height: 1000px;
	display: inline;
	text-align: center;
	align-items: center;
}

.cy_2 {
	width: 100%;
}

.cy_h4 {
	
}

.cy_3 {
	width: 100%;
}

.th_1 {
	text-align: center;
	background-color: #C4E8F6;
}

.wrap_dev1 {
	display: inline;
	width: 100%;
	height: 40%;
}

.wrap_dev2 {
	text-align: center;
	background-color: #cacaca;
}

.left_div {
	margin-left: -20%;
	width: 40%;
	display: inline-block;
	text-align: center;
}

.right_div {
	width: 40%;
	display: inline-flex;
}
</style>


<body>
	<jsp:include page="../layout/header_ara.jsp" />

	<div align="center" style="    height: 600px;   margin-top: 50px;">
		<div class="cy_1">
			<h4 style="margin-left: 700px;">공지사항</h4>
		</div>
		<%@ include file="../cyber/cy_lec_sidebar_stu.jsp"%>
		<div class="left_div">
			<form action="cy_upload" method="post" enctype="multipart/form-data">
			<input type="hidden" name="lec_no" value="${lec_no}">
			<table class="st_mint" style="width: 1000px; height: 40%">
				<tr>
					<td>
						<select name="round_no">
							<c:forEach var="i" begin="1" end="15">
								<option value="${i}">${i}주차</option>
							</c:forEach>
						</select>
					</td>
					<th>주차</th>
					
				</tr>
				<tr>
					<th>강의명</th>
					<td>
						<input type="text" name="round_name" id="round_name">
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="lectureVideo" id="lectureVideo" onchange="" accept="video/mp4, video/mpeg4, video/avi">
					</td>
				</tr>
				
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="작성">
						<input class="inputButton" type="reset" value="취소">
						<input class="inputButton" type="button" value="목록" onclick="history.back();">
					</th>
				</tr>
			</table>
			</form>
			
		</div>
	</div>
</body>


<%@ include file="../layout/footer_stu.jsp"%>
