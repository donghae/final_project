<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>   
<link rel="stylesheet" href="resources/css/form-basic.css">

<!-- request.js를 resources 폴더안에 넣는다 -->
<script src="resources/js/request.js"></script>
<script type="text/javascript" src="${path}resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

function tab_change(){
/* 	("input[name='radio_answer']:checked")
	
	$("#tab1").prop("checked", true); */
	
/* 	var tab = document.getElementsByName('tab');
	var checked_index = -1;
	var checked_value = '';
	for( i=0; i<tab.length; i++ ) {
		if(tab[i].checked) {
			tab[i].prop("checked",true);
		}
	} */
	
	//대여 현황
	if(document.getElementById("tab1").checked) {
		sendRequest(loanlist_callback, "lib_bookLoanlist","post");
	}
/* 	//반납 현황
	if(document.getElementById("tab2").checked) {
		sendRequest(returnlist_callback, "lib_bookReturnlist","post");
	}
	//반납 예정 현황
	if(document.getElementById("tab3").checked) {
		sendRequest(return_prearranged_callback, "lib_bookRtPrearrangelist","post");
	}
	//예약 현황
	if(document.getElementById("tab4").checked) {
		sendRequest(reserlist_callback, "lib_bookReserlist","post");
	}
	//대여 
	if(document.getElementById("tab1_2").checked) {
		sendRequest(loanform_callback, "lib_bookLoanform","post");
	}
	//반납
	if(document.getElementById("tab2_2").checked) {
		sendRequest(returnform_callback, "lib_bookReturnform","post");
	}
	//연장
	if(document.getElementById("tab3_2").checked) {
		sendRequest(renewform_callback, "lib_bookRenewform","post");
	} */

		
} 



function loanlist_callback() {
	//응답받은 값을 저장
	var tab1_content = document.getElementById("tab1_content");
	
	if(httpRequest.readyState == 4) { 
		
		if(httpRequest.status == 200) { //200 : 정상종료
			
			var data = httpRequest.responseText;
			tab1_content.innerHTML = data;
			
		} else {
			tab1_content.innerHTML = "에러발생";
		}
	} else {
		tab1_content.innerHTML = "loading..";
	}
}

/* function returnlist_callback() {
	//응답받은 값을 저장
	var loanlistView = document.getElementById("tab2_content");
	
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

function return_prearranged_callback() {
	//응답받은 값을 저장
	var loanlistView = document.getElementById("tab3_content");
	
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

function reserlist_callback() {
	//응답받은 값을 저장
	var loanlistView = document.getElementById("tab4_content");
	
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

function loanform_callback() {
	//응답받은 값을 저장
	var loanlistView = document.getElementById("tab1_2_content");
	
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

function returnform_callback() {
	//응답받은 값을 저장
	var loanlistView = document.getElementById("tab2_2_content");
	
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


function renewform_callback() {
	//응답받은 값을 저장
	var loanlistView = document.getElementById("tab3_2_content");
	
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
} */

/* $(function() {
	$(document).on("click", ".seat_color", function() {
	
		
		//열람실 번호
			var rdRoom_no = document.getElementById("floor").value;
			//좌석 번호- attr('속성명') : 속성의 이름을 가져온다
			var data = $(this).attr('id');
			var seat_no = data.split("_")[0];
			var seat_state = data.split("_")[1];
			//빈 좌석일 시
			if(seat_state == 0) {
				var really = confirm(rdRoom_no+"호 "+seat_no+" 좌석을 이용하시겠습니까?");
				
				if(really == true) {
					
					var params = "seat_no="+ seat_no+"&rdRoom_no="+rdRoom_no;
					sendRequest(seat_callback, "lib_seat_update","post",params);			
					
				} else {
					return false;
				}
			}
			//이용중 좌석일 시
			if(seat_state == 1) {
				var really = confirm(rdRoom_no+"호 "+seat_no+" 좌석을 이용 중지 하시겠습니까?");
				
				if(really == true) {				
					var params = "seat_no="+ seat_no+"&rdRoom_no="+rdRoom_no;
					sendRequest(seat_callback, "lib_seat_update","post",params);			
					
				} else {
					return false;
				}
			}
		 
		 
	 });
}); */

	
</script>



<jsp:include page="../layout/header_lib_admin.jsp"/>


<!-- 섹션 : 도서 대출 양식 -->
<section>
	
		<div class="content_w50" >			
			<input id="tab1" type="radio" name="tab" checked="checked" onclick="tab_change();"/>
	        <input id="tab2" type="radio" name="tab" onclick="tab_change();"/>
	        <input id="tab3" type="radio" name="tab" onclick="tab_change();"/>
			<input id="tab4" type="radio" name="tab" onclick="tab_change();"/>
			
			<!-- 라벨 : 화면에 표시되는 탭 제목 -->
	        <label for="tab1">대여 현황</label>
	        <label for="tab2">반납 현황</label>
	        <label for="tab3">반납 예정 현황</label>
	        <label for="tab4">예약 현황</label>
	
			
	        <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->     
			<div class="tab1_content"> <!-- 대여 현황 -->
				
			</div>
					
			<div class="tab2_content"><!-- 반납 현황 -->
				
			</div>
			
			<div class="tab3_content"><!-- 반납 예정 현황 -->
				
			</div>
			
			<div class="tab4_content"><!-- 예약 현황 -->
				
			</div>
		</div>
		
	         
	        
		
		<div class="content_w50_2">
		
			<input id="tab1_2" type="radio" name="tab2" checked="checked" onclick="tab_change();"/>
	        <input id="tab2_2" type="radio" name="tab2" onclick="tab_change();"/>
	        <input id="tab3_2" type="radio" name="tab2" onclick="tab_change();"/>
	        
	        <!-- 라벨 : 화면에 표시되는 탭 제목 -->
	        <label for="tab1_2">대여</label>
	        <label for="tab2_2">반납</label>
	        <label for="tab3_2">연장</label>
	        			
	        <!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->     
			<div class="tab1_2_content"> <!-- 대여 -->
				
			</div>
			
			<div class="tab2_2_content"> <!-- 반납-->
				
			</div>
			
			<div class="tab3_2_content"> <!-- 연장-->
				
			</div>
			
		</div>
		

</section>