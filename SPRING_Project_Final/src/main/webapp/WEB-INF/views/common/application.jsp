<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
<script type="text/javascript" src="resources/js/student.js"></script> 
<style>
.bg-gray {
	background-color: #E5E7EA;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<head>
	
	<script>

  var loadFile = function(event) {

    var output = document.getElementById('output');

    output.src = URL.createObjectURL(event.target.files[0]);

  };

</script>

</head>
	<jsp:include page="../layout/header_ara.jsp" />
<body>
	<div style="height: inherit; width: 1300px; display: inline-block;">
		<div style="width: 1300px; float: left;">
			<div class="container" style="margin-left: 100px;">
				<div class="mail-box">
						<form action="appPro" method="post" enctype="multipart/form-data" name="myForm" onsubmit="return inputCheck();">
								 <table style="width: 800px;" align="center">
 									<tr class="bg-gray" style="text-align:center">
										<th colspan="4"><h2>입학 신청서</h2></th>
									</tr>
 									<tr>
										<th>성명</th>
										<td colspan="2"><input type="text" name="name"></td>
										<td rowspan="3">
										프로필 사진
											<input type="file" name="image" id="image" accept="image/*" onchange="loadFile(event)">
											<img id="output" width="250" height="250"/>
										</td>
									</tr>
									<tr class="bg-gray">
										<th>주민등록번호</th>
										<td colspan="2">
											<input type="text" name="REGI_NO1" maxlength="6" style="width: 80px"> - 
											<input type="text" name="REGI_NO2" maxlength="7" style="width: 80px">
										</td>
									</tr>
									<tr>
										<th>학과</th>
										<td colspan="2">
											<select class="input" name="major">
												<option value="101">기계공학</option>
												<option value="102">소프트웨어공학</option>
												<option value="103">식품공학</option>
												<option value="104">전기공학</option>
												<option value="105">화학</option>
												
												<option value="201">물리학</option>
												<option value="202">미생물학</option>
												<option value="203">분자생물학</option>
												<option value="204">생명과학</option>
												<option value="205">화학</option>
												
												<option value="301">경영학</option>
												<option value="302">경제학</option>
												<option value="303">심리학</option>
												<option value="304">정치외교학</option>
												<option value="305">행적학</option>
												
												<option value="401">도예</option>
												<option value="402">무용</option>
												<option value="403">문예창작</option>
												<option value="404">실용음악</option>
												<option value="405">조소</option>
												
												<option value="501">국어국문학</option>
												<option value="502">사학</option>
												<option value="503">영어영문학</option>
												<option value="504">철학</option>
												<option value="505">포르투갈어</option>
												
												<option value="601">국제스포츠학</option>
												<option value="602">생활체육학</option>
												<option value="603">스포츠경영학</option>
												<option value="604">스포츠응용산업학</option>
												<option value="605">체육교육학</option>
										</select>
										</td>
									</tr>
									<tr class="bg-gray">
										<th>성적</th>
										<td colspan="4">
											<input type="text" name="grade">
										</td>
									</tr>
									<tr>
										<th>출신학교</th>
										<td colspan="4">
											<input type="text" name="highSchool">
										</td>
									</tr>
									<tr class="bg-gray">
										<th>이메일</th>
										<td colspan="4">
											<input type="text" name="email1" maxlength="10" style="width: 80px"> @ 
											<input type="text" name="email2" maxlength="20" style="width: 80px">
											<select class="input" name="email3" onchange="selectEmailCheck();">
												<option value="0">직접 입력</option>
												<option value="gmail.com">구글</option>
												<option value="daum.net">다음</option>
												<option value="naver.com">네이버</option>
												<option value="nate.com">네이트</option>
										</select>
										</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td colspan="2">
											<input type="text" name="hp1" maxlength="3" style="width: 50px"> - 
											<input type="text" name="hp2" maxlength="4" style="width: 50px"> - 
											<input type="text" name="hp3" maxlength="4" style="width: 50px">
										</td>
										<td colspan="2">장애여부					
											<select class="input" name="disability">
												<option value="0">이상 없음</option>
												<option value="1">장애 있음</option>
										</select>
										</td>
									</tr>
									<tr class="bg-gray">
										<th>주소</th>
										<td>
											<input name="zipcode" type="text" readonly="readonly"style="width: 100px" />
										</td>
										<td>
											<input name="searchAddrButton" value="주소 검색" type="button" onclick="openAddr();" />
										</td>
										<td colspan="2">
											<input style="width: 200px"  name="address1" type="text" readonly="readonly"/>
											<input style="width: 200px"  name="address2" type="text" />
										</td>
									</tr>
									<tr>
										<th colspan="4" style="text-align:center">
											<input type="submit" value="신청하기"> 
										</th>
									</tr>
								</table>
						</form>
					</div>
				</div>
		</div>
	</div>
</body>
<%@ include file="../layout/footer_lib.jsp"%>
</html>



