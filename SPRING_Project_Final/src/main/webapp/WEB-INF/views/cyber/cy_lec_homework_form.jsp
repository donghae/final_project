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
			<h4 style="margin-left: 700px;">과제 제출</h4>
		</div>
		<%@ include file="../cyber/cy_lec_sidebar_stu.jsp"%>
		<div class="left_div">
			<table class="st_mint" style="width: 1000px; height: 70%">
				
				<tr>
					<th>첨부파일</th>
					<td>
						<input class="input" type="file" style="width:270px">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea class="input" rows="10" cols="40" name="content" style="width:270px;resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputButton" type="submit" value="제출">
						<input class="inputButton" type="reset" value="취소">
					</th>
				</tr>
			</table>

			
		</div>
	</div>
</body>


<%@ include file="../layout/footer_ara.jsp"%>
