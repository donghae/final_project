<%@page import="org.springframework.web.context.request.RequestAttributes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ include file="../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/form-basic.css">


	
<form class="form-basic" method="post" name="seat_form" action="lib_seat_update" onsubmit="javascript:closeWithSubmit();">			
 <input type="hidden" name="seat_no" value="${param.seat_no}">
 <input type="hidden" name="rdRoom_no" value="${param.rdRoom_no}">
 
    <div class="form-title-row">
        <h1>좌석 등록</h1>
        <p> ${param.rdRoom_no} 호 -  좌석 : ${param.seat_no}</p>
    </div>

    <div class="form-row">
        <label>
            <span>회원 번호</span>
            <p>
	            <input type="text" name="user_no" style="width:150px;">
	            <button type="submit">등 록</button>
            </p>
        </label>
    </div>
    
     
</form>