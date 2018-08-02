<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/box_mon.css">

<!-- request.js를 resources 폴더안에 넣는다 -->
<script src="resources/js/request.js"></script>

<script type="text/javascript">
$(function() {
	$('#floor').change(function(){
		
		var floor = $(this).val();
		
		if(floor != null) {	
			
			var params = "rdRoom_no="+ floor;
			sendRequest(seat_callback, "lib_seat_sub","post",params);
		}		
	});
});


	
function seat_callback() {
	//응답받은 값을 저장
	var view = document.getElementById("view");
	
	if(httpRequest.readyState == 4) { 
		
		if(httpRequest.status == 200) { //200 : 정상종료
			
			var data = httpRequest.responseText;
			view.innerHTML = data;
		} else {
			view.innerHTML = "오류";
		}
	} else {
		view.innerHTML = "loading..";
	}
}
	
</script>


<jsp:include page="../layout/header_lib_admin.jsp"/>



<!-- 좌석 현황 : 열람실 선택 -->
<section>
	
	<form class="cen_middle">				
		<!-- 좌석 예약 -->
		<article class="back_white">
			<div id="header_fill"></div>
			
			<div>
				<h3>좌석 현황</h3>				
			</div>
			
			<div class="content">
				
				<div>
					<select id="floor" class="vertical" style="width:90px;">		
						<option selected="selected">층</option>			
						<option value="101">1F</option>
						<option value="201">2F</option>
						<option value="301">3F</option>
					</select>				
				</div>
				<br><br><br>
				
				<div id="view">	<!-- 열람실 현황 결과 -->		
				</div>
				
				<br><br><br><br>
			</div>
		</article>
	</form>	
	
</section>



<jsp:include page="../layout/footer_lib.jsp"/>