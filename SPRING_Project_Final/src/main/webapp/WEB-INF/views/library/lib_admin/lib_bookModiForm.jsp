<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/form-basic.css">


<jsp:include page="../../layout/header_lib_admin.jsp"/>


<script type="text/javascript">
/*도서 수정 양식 입력여부*/
function bookModiForm_written() {
	if (!document.bookModiForm.global.value || document.bookModiForm.global.value == 0) {
		alert(msg_text);
		document.bookModiForm.global.focus();
		return false;
	}
	if (!document.bookModiForm.category.value || document.bookModiForm.category.value == 0) {
		alert(msg_text);
		document.bookModiForm.category.focus();
		return false;
	}
	if (!document.bookModiForm.isbn.value) {
		alert(msg_text);
		document.bookModiForm.isbn.focus();
		return false;
	}
	if (!document.bookModiForm.title.value) {
		alert(msg_text);
		document.bookModiForm.title.focus();
		return false;
	}
	if (!document.bookModiForm.price.value) {
		alert(msg_text);
		document.bookModiForm.price.focus();
		return false;
	}
	if (!document.bookModiForm.amt.value) {
		alert(msg_text);
		document.bookModiForm.amt.focus();
		return false;
	}
/*	if (!document.bookModiForm.img.value) {
		alert(msg_text);
		document.bookModiForm.img.focus();
		return false;
	}*/
	if (!document.bookModiForm.publish.value) {
		alert(msg_text);
		document.bookModiForm.publish.focus();
		return false;
	}
	if (!document.bookModiForm.year.value) {
		alert(msg_text);
		document.bookModiForm.year.focus();
		return false;
	}
	if (!document.bookModiForm.month.value) {
		alert(msg_text);
		document.bookModiForm.month.focus();
		return false;
	}
	if (!document.bookModiForm.day.value) {
		alert(msg_text);
		document.bookModiForm.day.focus();
		return false;
	}

}

</script>

<section onload="modiBookload(${bVO.b_date});">
	
	<div class="main-content" style="padding-top:50px;">	
	<form action="lib_bookModiPro" name="bookModiForm" class="form-basic" method="post" 
		enctype="multipart/form-data" onsubmit="javascript:bookModiForm_written();">
	<input type="hidden" name="b_no" value="${bVO.b_no}">
	
	
		<div class="form-title-row">
			<h1>도서 수정</h1>
		</div>

		<div class="form-row" >
			<label>
				<span>이 미 지</span>
				<input type="hidden">
				<input type="file" name="img" value="${bVO.b_img}" style="display:inline-block;">
            </label>
        </div>
          
		<div class="form-row">
			<label>
				<span>대 분 류</span>
				<select name="global">					
					<option value="1"
						<c:if test="${bVO.b_global==1}">selected="selected"</c:if>>국 내
					</option>
					<option value="2"
						<c:if test="${bVO.b_global==2}">selected="selected"</c:if>>국 외
					</option>									
				</select>
            </label>
        </div>

        <div class="form-row">
            <label>
                <span>중 분 류</span>
                <select name="category">   
                	<option value="1"
						<c:if test="${bVO.b_category==1}">selected="selected"</c:if>>소 설
					</option>
					<option value="2"
						<c:if test="${bVO.b_category==2}">selected="selected"</c:if>>예 술
					</option>
					<option value="3"
						<c:if test="${bVO.b_category==1}">selected="selected"</c:if>>외 국 어
					</option>
					<option value="4"
						<c:if test="${bVO.b_category==2}">selected="selected"</c:if>>과 학
					</option>
					<option value="5"
						<c:if test="${bVO.b_category==1}">selected="selected"</c:if>>시/에세이
					</option>
				</select>
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>ISBN</span>
                ${bVO.b_no}
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>도 서 명</span>
                <input type="text" name="title" value="${bVO.b_title}">
            </label>
        </div>
		
		
		<div class="form-row">
            <label>
                <span>가 격</span>
                <input type="text" name="price" value="${bVO.b_price}">
            </label>
        </div>
		
		
        <div class="form-row">
            <label>
                <span>저 자</span>
                <input type="text" name="author" value="${bVO.b_author}">
            </label>
        </div>

        
        <div class="form-row">
            <label>
                <span>출 판 사</span>
                <input type="text" name="publish" value="${bVO.b_publish}">
            </label>
        </div>
        
        
        <div class="form-row">
            <label>
                <span>발 행 일</span>
                <script type="text/javascript">
                function modiBookload(b_date){
                	
                
                	var receive = b_date;
               	
                	var year = "";
                	var month = "";
                	var day = "";
                	
                	for(var i=0; i<receive.length; i++) {
                		
                		var date = receive.split("/");
                		
                		year = date[0];
                		month = date[1];
                		day = date[2];
                	}
                	document.getElementsByName("year")[0].value = year;
            		document.getElementsByName("month")[0].value = month;
            		document.getElementsByName("day")[0].value = day;
                }
                </script>
                
                
                <input type="text" name="year" style="width:100px">&nbsp;년&nbsp;&nbsp;
                <input type="text" name="month" style="width:50px">&nbsp;월&nbsp;&nbsp;
                <input type="text" name="day" style="width:50px">&nbsp;일
            </label>
        </div>
        

        <div class="form-title-row">
       		<label>
            	<button type="submit">수 정</button>
            </label>
        </div>

        </form>
	</div>

</section>

<%@include file="../../layout/footer_lib.jsp" %>