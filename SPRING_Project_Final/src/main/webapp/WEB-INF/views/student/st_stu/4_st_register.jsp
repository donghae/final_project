<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function openAddr(){
	   daum.postcode.load(function(){
	          new daum.Postcode({
	              oncomplete: function(data) {
	                     document.getElementsByName( "st_zipcode" )[0].value = data.zonecode;
	                           document.getElementsByName( "addr1" )[0].value = data.roadAddress;
	              }
	          }).open();
	      });
	  }
	  
function nexthp1() {
	if(document.myForm.hp1.value.length>=3) {
		document.myForm.hp2.focus();
	}
}

function nexthp2() {
	if(document.myForm.hp2.value.length>=4) {
		document.myForm.hp3.focus();
	}
}	  
</script>
</head>
<style>
	.bg-gray {
		background-color:#E5E7EA;
	}
	
	#pf_img {
		width:140px;
	}
  table {
    width: 100%;
    border: 1px solid #6C6969;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #6C6969;
    padding: 10px;
  }
	
</style>
<body>
	<div style="width: 900px; float: left;">
		<div class="container" style="margin-left: 100px;">
			<div class="mail-box">
				<aside class="lg-side">
					<div class="inbox-head">
						<div style="width: 30%; float: left;">
							<br>
							<br>
							<h1>학적 관리</h1>
						</div>
						<div style="width: 30%; margin-left:750px;">
							<br><br><br><br><br>
							<h3>학적 관리 > 기본 학적</h3>
						</div>
						
						<div class="inbox-body">
						<div class="mail-option">
							<!-- <div class="container"> -->
							<div>
							<form action="StModiPro" method="post" name="myForm">
								<table>
									<thead>
										<tr> <!-- //resources/images/addmission_img/ -->
											<th rowspan="4"><img id="pf_img" src="resources/images/addmission_img/${vo.getSt_img()}"></th>
											<th class="bg-gray">이름</th>
											<td>${vo.getSt_name()}</td>
											<th class="bg-gray">생년월일</th>
											<td>${vo.getSt_birth()}</td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">학번</th>
											<td>${vo.getSt_no()}</td>
											<th class="bg-gray">학년</th>
											<td>${vo.getSt_level()}</td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">전공명</th>
											<td>${vo.getMaj_cd()}</td>
											<th class="bg-gray">입학일</th>
											<td>${vo.getSt_ent_dt()}</td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">이수학점</th>
											<td>${vo.getSt_point()}</td>
											<th class="bg-gray">휴학여부</th>
											<td>${vo.getSt_abs_fl()}</td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">이메일</th>
											<td colspan="2"><input type="email" value="${vo.getSt_email()}" name="email" style="width:300px;"></td>
											<th class="bg-gray">전화번호</th>
											<td colspan="2">
												<c:set var="hpArr" value="${fn:split(vo.getSt_hp(), '-')}"/> 
													<input class="input" type="text" name="hp1" maxlength="3"
														style="width:40px" onkeyup="nexthp1();" value="${hpArr[0]}">
													-	
													<input class="input" type="text" name="hp2" maxlength="4"
														style="width:40px" onkeyup="nexthp2();" value="${hpArr[1]}">
													-	
													<input class="input" type="text" name="hp3" maxlength="4"
														style="width:40px" value="${hpArr[2]}">
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">주소</th>
											<td colspan="2"><input name="st_zipcode" type="text" readonly="readonly" value="${vo.getSt_zipcode()}" style="width:80px;"/>
	   				<input name="searchAddrButton" class="btn_navy" value="주소찾기" type="button" onclick="openAddr();"/><br>
											<input name="addr1" type="text" value="${vo.getSt_addr1()}" style="width:350px;"/></td>
											<td colspan="2"><input name="addr2" type="text" value="${vo.getSt_addr2()}" style="width:300px;"/></td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">동아리명</th>
											<td colspan="2">${vo.getCc_name()}</td>
											<th class="bg-gray">장애여부</th>
											<td>
											<c:if test="${vo.getSt_disable_fl() ==0}">
												해당사항없음
											</c:if>
											<c:if test="${vo.getSt_disable_fl() !=0}">
												장애있음.
											</c:if>											
											</td>
										</tr>
										
										<tr>
											<th scope="row" class="bg-gray">은행</th>
											<td><input type="text" name="st_bk" value="${vo.getSt_bk()}">
											<!-- <select>
													<option value="kb">국민은행</option>
													<option value="ibk">기업은행</option>
													<option value="nh">농협</option>
													<option value="hana">하나은행</option>
													<option value="sh">신한은행(구조흥)</option>
													<option value="wr">우리은행</option>
											</select> --></td>
											<td><input type="text" name="st_bkno" value="${vo.getSt_bkno()}"></td>
											<th class="bg-gray">예금주명</th>
											<td><input type="text" name="st_bk_holder" value="${vo.getSt_bk_holder()}"></td>
										</tr>
										
										<tr>
											<td colspan="5">
												<input type="submit" class="btn_navy" value="저장" style="margin-left:850px;">
											</td>
										</tr>																			
									</thead>						
								</table></form>
							</div>
						</div></div>
<!-- <table><tr><td>
<input type="submit" class="btn_navy" value="저장" style="margin-left:850px;"></td></tr></table> -->
						</div>
				</aside>
			</div>
		</div>			
					</div>				
</body>
</html>