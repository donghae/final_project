<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>  

<link rel="stylesheet" href="resources/css/form-basic.css">


<body>



<%@include file="../layout/header_lib2.jsp" %>



	<!-- 본문 -->
	
	<div class="main-content" style="padding-top:50px;">
	
	<form class="form-basic" method="post" action="#">			
            <div class="form-title-row">
                <h1>희망 도서 신청서</h1>
            </div>

            <div class="form-row" >
                <label>
                    <span>대 분 류</span>
                    <select>
						<option value="1" selected="selected">국 내</option>
						<option value="2">유 럽</option>
						<option value="3">아 시 아</option>
						<option value="4">북 미</option>
						<option value="5">기 타</option>
					</select>
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>중 분 류</span>
                    <select>
						<option value="1" selected="selected">인 문</option>
						<option value="2">예 술</option>
						<option value="3">외 국 어</option>
						<option value="4">과 학</option>
						<option value="5">시/에세이</option>
					</select>
                </label>
            </div>


            <div class="form-row">
                <label>
                    <span>저 자</span>
                    <input type="text">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>도 서 명</span>
                    <input type="text">
                </label>
            </div>

            <div class="form-row">
 				 <label>
                    <span>신청 사유</span>
                    <textarea name="textarea"></textarea>
                </label>              
            </div>

            <div class="form-row">
           		<label>
                	<button type="submit" >신청하기</button>
                </label>
            </div>

        </form>
	</div>
	<%@include file="../layout/footer_lib.jsp" %>
</body>
</html>