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
            <tr>
              <th>학번</th>
              <th>이름</th>
              <th>호실</th>
              <th>벌점</th>
              <th>벌점부여일</th>
              <th>벌점사유</th>
            </tr>
          </thead>
          <c:if test="${cnt >0}">
          	<c:forEach var="dto" items="${dtos}">
          <tbody id="myTable">
            <tr>
              <td>${dto.st_no}</td>
              <td>${dto.st_name}</td>
              <td>${dto.dorm_room}</td>
              <td>${dto.dorm_penalty}</td>
              <td>${dto.dorm_penalty_dt}</td>
              <td>${dto.dorm_reason}</td>            
            </tr>
          </tbody>
            </c:forEach>
          </c:if>  
         </table>
 
<%-- 	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="dormitoty_stu_select">[◀◀]</a>
						<a href="dormitoty_stu_select?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i!=currentPage}">
							<a href="dormitoty_stu_select?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶]/ 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="dormitoty_stu_select?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="dormitoty_stu_select?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table> --%>
	
      </div>
      <div class="col-md-12 text-center">
      <ul class="pagination pagination-lg pager" id="myPager"></ul>
      </div>
	</div>
</div>
<%-- <script src="${Ara}dormitory_js/dt_stu_table2.js"></script> --%>
</body>
</html>