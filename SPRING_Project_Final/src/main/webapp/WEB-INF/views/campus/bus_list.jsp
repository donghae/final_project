<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>




<body>
	<%@include file="../layout/header_ara.jsp"%>


	

	<!-- Popular -->

	<div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<h1>학생</h1>
        <table class="st_navy">
        	<thead>
        		<tr>
        			<th>출발지</th>
        			<th>도착지</th>
        			<th>출발시간</th>
        			<th>소요시간</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        		</tr>        		
        	</tbody>
        </table>
        <h1>관리자</h1>
		<table class="st_navy">
        	<thead>
        		<tr>
        			<td align="center" colspan="5"><input type="button" class="btn_navy" value="추가"></td>
        		</tr>
        		<tr>
        			<th>출발지</th>
        			<th>도착지</th>
        			<th>출발시간</th>
        			<th>소요시간</th>
        			<th>수정/삭제</th>
        		</tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>
        		<tr>
        			<td>안산</td>
        			<td>서울</td>
        			<td>
        				07:10<br>
        				07:20
        			</td>
        			<td>
        				08:20<br>
        				08:30
        			</td>
        			<td><input type="button" class="btn_navy" value="수정/삭제"></td>
        		</tr>        		
        	</tbody>
        </table>
    </div>
	<%@include file="../layout/footer_lib.jsp"%>
</body>
</html>