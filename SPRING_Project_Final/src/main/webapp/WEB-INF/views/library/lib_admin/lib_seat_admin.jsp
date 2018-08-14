<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/box_mon.css">

<!-- request.js를 resources 폴더안에 넣는다 -->
<script src="resources/js/request.js"></script>
<script type="text/javascript" src="${path}resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

function floor_change(){
	
	var floor = document.getElementById("floor");
	
	//선택되면 해당아이디를 가진 셀렉트 옵션을 삭제
	$('#del').remove();
	
	if(floor.value != null) {
	
		var params = "rdRoom_no="+ floor.value;
		sendRequest(seat_callback, "lib_seat_sub_admin","post",params);
	}	
}

function seat_callback() {
	//응답받은 값을 저장
	var view = document.getElementById("view");
	
	if(httpRequest.readyState == 4) { 
		
		if(httpRequest.status == 200) { //200 : 정상종료
			
			var data = httpRequest.responseText;
			view.innerHTML = data;
			
		} else {
			view.innerHTML = "에러발생";
		}
	} else {
		view.innerHTML = "loading..";
	}
}


$(function() {
	$(document).on("click", ".seat_color", function() {
		
		//열람실 번호
		var rdRoom_no = document.getElementById("floor").value;
		//좌석 번호- attr('속성명') : 속성의 이름을 가져온다
		var data = $(this).attr('id');
		var seat_no = data.split("_")[0];
		var seat_state = data.split("_")[1];

		//이용중 좌석일 시
		if(seat_state == 1) {
			
			var params = "seat_no="+ seat_no+"&rdRoom_no="+rdRoom_no;
			sendRequest(user_callback, "lib_seat_user","post",params);						
		}		 		 
	 });
});

function trim(stringToTrim) {
    return stringToTrim.replace(/^\s+|\s+$/g,"");
}
function user_callback() {
	
	if(httpRequest.readyState == 4) { 
		
		if(httpRequest.status == 200) { //200 : 정상종료
			
			var data = trim(httpRequest.responseText);
			var result = data.split("|");
			
			alert(result[0]+"\n"+result[1]+"\n"+result[2]+"\n"+result[3]+"\n"+result[4]); 
			/* 
			window.open("lib_seat_userInfo?",'userInfo',data); */

		} else {
			alert("에러발생");
		}
	}
}
	
</script>




<jsp:include page="../../layout/header_lib_admin.jsp"/>



<!-- 좌석 현황 : 열람실 선택 -->
<section>
	
	
	<form class="cen_middle" name="seat_view">				
		<!-- 좌석 예약 -->
		<article class="back_white">
			<div id="header_fill" style="height:100px;"></div>
			
			<div>
				<h3>좌석 현황</h3>				
			</div>
			
			<div class="content">
				
				<div>
					<select id="floor" class="vertical" style="width:90px;" onchange="floor_change();">		
						<option id="del">층</option>			
						<option value="101">1F</option>
						<option value="201">2F</option>
						<option value="301">3F</option>
					</select>				
				</div>
				<br><br><br>
				
				
				<div id="view" style="magin:0px; padding:0px; height:800px;"></div>
			</div>					
		</article>
	</form>	
	
</section>



<jsp:include page="../../layout/footer_lib.jsp"/>