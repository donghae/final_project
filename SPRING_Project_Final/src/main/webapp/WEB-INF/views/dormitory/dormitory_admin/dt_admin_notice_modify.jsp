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
		
 		 <c:if test="${dto !=null}">
		<div  style="width: 1200px; height: 40%;">
			<form action="dt_admin_notice_modify_con?dorm_n_no=${dto.dorm_n_no}" name="notice_modify" method="post">
				<table>			
					<tr>
						<td align="center" >글번호</td>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${dto.dorm_n_no}</td>	
					</tr>
					
					<tr>
						<td align="center" >조회수</td>
						<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${dto.dorm_n_cnt}</td>
					</tr>				
					
					<tr>
						<td align="center">작성자</td>
						<td align="left"><input type="text" name="ad_no" value="${dto.ad_no}"></td>
					</tr>
					<tr>
						<td align="center">제목</td>
						<td align="left"><input type="text" name="dorm_n_title" value="${dto.dorm_n_title}"></td>
					</tr>
					<tr>
						<td align="center">내용</td>
						<td align="left"><input type="text" name="dorm_n_content" value="${dto.dorm_n_content}"></td>
					</tr>
					<tr>
						<td align="center">작성일</td>
						<td align="left"><input type="date" name="dorm_n_dt" value="${dto.dorm_n_dt}" style="width:230px;"></td>
					</tr>																										
				</table>
			
		        <br><br>
				<div class="form-row" style="margin-left:-180px;">
		            <label>
		                <input type="submit" value="수정" style="text-align: center; width:80px; color: navy; background-color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                <input type="button" value="목록" style="text-align: center; width:80px; color: navy; background-color: white;" onclick="history.back()">
		            </label>
		        </div>
		        </form>			
			</div>
		</c:if> 		
		</div>
</c:if>	 

</body>	
<!-- 푸터 -->
<div class="footer">
	<%@include file="../../layout/footer_lib2.jsp" %>		
</div>
