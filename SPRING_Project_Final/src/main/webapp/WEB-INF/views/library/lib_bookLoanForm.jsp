<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>   
<script src="resources/js/library.js"></script> 
<link rel="stylesheet" href="resources/css/form-basic.css">


<jsp:include page="../layout/header_lib_admin.jsp"/>


<!-- 섹션 : 도서 대출 양식 -->
<section>
	<div class="main-content" style="padding-top:50px;">	
		<form action="lib_bookLoanPro" name="bookLoanForm" class="form-basic" method="post" onsubmit="return bookLoanForm_written();">
		
			<div class="form-title-row">
				<h1>도서 대출/반납</h1>
			</div>
	
			<div class="form-row">
				<label>
					<span>이용자 번호</span>
					<input type="text" name="user_no">
	            </label>
	            <br>
				<label class="formplus">
					<span>도서 번호</span>
					<input type="text" name="b_no">
					<a href="javascript:void(0);" onclick="addloanForm();return false;">
	    				<img src="resources/images/library_img/touch.png" style="width:50px;">
	    			</a>	
	            </label>	           
	        </div>
    
        	<div class="form-row">
			    <div class="cen_middle">
				    <input type="button" class="btn_navy" style="padding:10px 20px;" value="반 납" 
				    		onclick="javascript:bookReturn_written();">
				    &nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="button" class="btn_navy" style="padding:10px 20px;" value="연 장" 
				    		onclick="javascript:bookRenew_written();">
				    &nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="submit" class="btn_navy" style="padding:10px 20px;" value="대 출">
		     	</div>
	     	</div>
     	</form>
    
      </div>
</section>