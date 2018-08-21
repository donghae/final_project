<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/form-basic.css">  
<%@ include file="../../setting.jsp" %>  
<%-- <%@ include file="../dorm_setting.jsp" %> --%>

 <style>
	.penalty{
		position: relative;
		top:250px;

	} 
	
	.footer{
		position: relative;
		top:400px;
	}
	
	.side{
	position: relative;
	top:50px;
	}
	
	.form-row span{
		font-size: 20px;		
	}
	.form-row input{
		height:40px;
		 border-radius:0.5em;
		 moz-border-radius: 0.5em;
		 webkit-border-radius: 0.5em;
	}
</style>

<body>
<c:if test="${fn:substring(sessionScope.id,0,2) == 01}">	
<%@include file="../../layout/header_dormitory_home.jsp" %> 	
	
	<div align="center" class="penalty">
		<div class="cy_1">
			<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;벌점 등록</h2>			
		</div>
		<div class="side">		
			 <%@ include file="../../layout/dt_admin_side.jsp"%> <!-- 사이드바 -->
		</div>
		<div class="left_div" style="width: 1200px; height: 40%;">
					
			 <form action="dt_admin_penalty_admin" name="penalty" method="post">			
				<div class="form-row">
		            <label>
		                <span>  학    번 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="text" name="st_no">
		            </label>
		        </div>
<!-- 				<br><br>
				<div class="form-row">
		            <label>
		                <span>  이    름 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="text" name="st_name">
		            </label>
		        </div> -->		        
				<br><br>
				<div class="form-row">
		            <label>
		                <span>  벌    점 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="text" name="dorm_penalty">
		            </label>
		        </div>
		  		<br><br>
				<div class="form-row">
		            <label>
		                <span> 벌점 부여일 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="date" name="dorm_penalty_dt">
		            </label>
		        </div>
		        <br><br>		        				
				<div class="form-row">
		            <label>
		                <span style="margin-left: 5px;">벌점 사유 </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="text" name="dorm_reason">
		            </label>
		        </div>		        
		        <br><br>
				<div class="form-row">
		            <label>
		                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="submit" value="등록" style="text-align: center; width:100px;">
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
