<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.table-responsive {height:180px;}
</style>

</head>
<body>

<div class="container">
    <div class="row">
      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
            <tr style="height:40px;">
              <th>학번</th>
              <th>이름</th>
              <th>호실</th>
              <th>외박신청일</th>
              <th>외박점수</th>
              <th>외박신청여부</th>
              <th>외박사유</th>
              <th>신청철회</th>
            </tr>
          </thead>        
          
          	<c:forEach var="dto" items="${dtos}">          	
          <tbody id="myTable">
         <c:if test="${dto.dorm_ex_dt == null }">
          	<tr style="height:40px;">
          		<td colspan="8" align="center">
          			외박 신청 현황이 없습니다.<br>
          		</td>
          	</tr>
          </c:if>
          
            <c:if test="${dto.dorm_ex_fl != 0 }">
            <tr style="height:60px;">
              <td>${dto.st_no}</td>
              <td>${dto.st_name}</td>
              <td>${dto.dorm_room}</td>
              <td>${dto.dorm_ex_dt}</td>
              <td>${dto.dorm_on_sc}</td>
              <td>   
	              <c:if test="${dto.dorm_ex_fl == 1 }">
	              	 외박 신청 승인 대기중  
	              </c:if>           
	              <c:if test="${dto.dorm_ex_fl == 2 }">
	              	 외박 신청 승인  
	              </c:if>      
	              <c:if test="${dto.dorm_ex_fl == 3 }">
	              	 외박 신청 철회
	              </c:if>	                      
	              <td>${dto.dorm_reason}</td>    
	              <td><a href="dt_stu_overnight_delete?st_no=${dto.st_no}&dorm_ex_dt=${dto.dorm_ex_dt}">신청 철회</a></td>                   
              </td> 
            </tr>
            </c:if>
          </tbody>
            </c:forEach> 
            
         </table>
 
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="dormitory_stu_overnight_sel">[◀◀]</a>
						<a href="dormitory_stu_overnight_sel?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i!=currentPage}">
							<a href="dormitory_stu_overnight_sel?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶]/ 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="dormitory_stu_overnight_sel?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="dormitory_stu_overnight_sel?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
	
      </div>
      <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>
      </div>
	</div>
</div>
<%-- <script src="${Ara}dormitory_js/dt_stu_table2.js"></script> --%>
</body>
</html>