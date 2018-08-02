<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function seatchange(seat_no,rdRoom_no) {
	
	var really = confirm("선택하신 좌석을 이용하시겠습니까?");
	
	if(really == true) {

		('#aa').load("lib_seat_sub?seat_no="+ seat_no+'&rdRoom_no='+rdRoom_no, td);

	} else {
		return false;
	}
	
}
</script>



<!-- 열람실 좌석 현황 결과 -->
<div class="cen_middle_box">
	<p style="font-size:30px; text-align:left;">&nbsp;&nbsp;F</p><br><br>


	<table class="seat_table" id="aa">
		<tr>	
		<c:forEach var="sVO" items="${sVOs}">				
			<td>		
				<!-- 빈 좌석 -->		
				<c:if test="${sVO.seat_state == 0}">
					<a href="javascript:seatchange(${sVO.seat_no},${sVO.rdRoom_no});">
						${sVO.seat_no}
						<img src="${path}resources/images/library_img/seat/seat.png" width="60px">
					</a>
				</c:if>	
				<!-- 이용중 좌석 -->
				<c:if test="${sVO.seat_state == 1}">
					<a href="javascript:seatchange(${sVO.seat_no},${sVO.rdRoom_no});">
						${sVO.seat_no}
						<img src="${path}resources/images/library_img/seat/full.png" width="60px">
					</a>
				</c:if>	
				<!-- 사용불가 좌석 -->
				<c:if test="${sVO.seat_state == 2}">
					${sVO.seat_no}					
				</c:if>										
			</td>
			<c:if test="${sVO.seat_no % 8 == 0}">
				</tr>
				<tr>
			</c:if>
			
		</c:forEach>
		</tr>	
	</table>

	
	<br><br><br>
</div>	

