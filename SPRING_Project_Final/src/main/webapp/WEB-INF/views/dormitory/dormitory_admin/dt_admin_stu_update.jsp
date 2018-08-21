<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../../setting.jsp" %>  
<%-- <%@ include file="../dorm_setting.jsp" %> --%>

 <style>
	.penalty{
		position: relative;
		top:320px;

	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	}
	
	table td{
		font-size: 20px;
		padding:28px;
		margin-bottom: 5px;
	}
	
	 input{
		height:40px;
		 border-radius:0.5em;
		 moz-border-radius: 0.5em;
		 webkit-border-radius: 0.5em;
		 text-align: center;
		 
	}
	
	table{
		text-align: center;
	}	
	
	form{
		position:relative;
		top:-70px;
		margin-left:250px;
		
	}
</style>
<body>
<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		
		<div  style="width: 1200px; height: 40%;">
			<form action="dt_admin_stu_update?st_no=${st_no}" name="notice_modify" method="post">
				<table>			
					<tr>
						<td align="center" >학번</td>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${st_no}</td>	
					</tr>
					
					<tr>
						<td align="center" >이름</td>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${st_name}</td>
					</tr>				
					
					<tr>
						<td align="center">호실</td>
						<td align="left"><input type="text" name="dorm_room" value="${dorm_room}" style="width:300px;"></td>
					</tr>
					
					<tr>
						<td align="center" style="width:110px;">기숙사 시작일</td>
						<td align="left"><input type="date" name="dorm_st_dt" value="${dorm_st_dt}" style="width:300px;"></td>
					</tr>
					
					<tr>
						<td align="center" style="width:110px;">기숙사 종료일</td>
						<td align="left"><input type="date" name="dorm_end_dt" value="${dorm_end_dt}" style="width:300px;"></td>
					</tr>																										
				</table>
			
		        <br><br>
				<div class="form-row" style="margin-left:-180px;">
		            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="submit" value="수정" style="text-align: center; width:80px; color: navy; background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="button" value="목록" style="text-align: center; width:80px; color: navy; background-color: white;" onclick="history.back()">
		            </label>
		        </div>
		        </form>			
			</div>	
		</div>
</c:if>

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
