<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>    
<link rel="stylesheet" href="resources/css/form-basic.css">


<jsp:include page="../layout/header_lib_admin.jsp"/>


<!-- 섹션 : 도서 등록 양식 -->
<section>
	
	<div class="main-content" style="padding-top:50px;">	
	<form action="lib_bookAddPro" name="bookAddForm" class="form-basic" method="post" enctype="multipart/form-data" onsubmit="return bookAddForm_written();">
	
		<div class="form-title-row">
			<h1>도서 등록</h1>
		</div>

		<div class="form-row" >
			<label>
				<span>이 미 지</span>
				<input type="file" name="img">
            </label>
        </div>
          
		<div class="form-row" >
			<label>
				<span>대 분 류</span>
				<select name="global">
					<optgroup label="global">대 분 류</optgroup>
					<option value="1">국 내</option>
					<option value="2">국 외</option>					
				</select>
            </label>
        </div>

        <div class="form-row">
            <label>
                <span>중 분 류</span>
                <select name="category">
					<option value="1" selected="selected">소 설</option>
					<option value="2">예 술</option>
					<option value="3">외 국 어</option>
					<option value="4">과 학</option>
					<option value="5">시/에세이</option>
				</select>
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>ISBN</span>
                <input type="text" name="isbn">
            </label>
        </div>

		<div class="form-row">
            <label>
                <span>도 서 명</span>
                <input type="text" name="title">
            </label>
        </div>
		
		
		<div class="form-row">
            <label>
                <span>가 격</span>
                <input type="text" name="price">
            </label>
        </div>
		
		
		<div class="form-row">
            <label>
                <span>수 량</span>
                <input type="text" name="amt">
            </label>
        </div>
		
		
        <div class="form-row">
            <label>
                <span>저 자</span>
                <input type="text" name="author">
            </label>
        </div>

        
        <div class="form-row">
            <label>
                <span>출 판 사</span>
                <input type="text" name="publish">
            </label>
        </div>
        
        
        <div class="form-row">
            <label>
                <span>발 행 일</span>
                <input type="text" name="year" style="width:100px">&nbsp;년&nbsp;&nbsp;
                <input type="text" name="month" style="width:50px">&nbsp;월&nbsp;&nbsp;
                <input type="text" name="day" style="width:50px">&nbsp;일
            </label>
        </div>
        

        <div class="form-row">
       		<label>
            	<button type="submit">등 록</button>
            </label>
        </div>

        </form>
	</div>

</section>

<%@include file="../layout/footer_lib.jsp" %>