<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>  
<link rel="stylesheet" href="resources/css/box_mon.css">

<script type="text/javascript">

/*ajax 로 검색*/
$(function() {
	
	$('#floor').change(function(){
		
		var floor = $(this).val();
		
		if(floor == null) {
			$('#view').css('visibility','hidden');
		} else {
			$('#view').css('visibility','visible');
			
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/lib_seat_sub',
				data : 'rdRoom_no='+ floor,
				
				success : function(data) {
					$('#view').html(data);
				},
				error : function() {
					alert('오류');
				}
				
			});
		}			
	});
	
});

</script>


<jsp:include page="../layout/header_lib_admin.jsp"/>


<!-- 본문 -->
<section>
	
	<form class="cen_middle">				
		<!-- 좌석 예약 -->
		<article class="back_white">
			<div id="header_fill"></div>
			
			<div>
				<h3>좌석 현황</h3>				
			</div>
			
			<div class="content">
				
				<div>
					<select id="floor" class="vertical" style="width:90px;">		
						<option selected="selected">층</option>			
						<option value="101">1F</option>
						<option value="201">2F</option>
						<option value="301">3F</option>
					</select>				
				</div>
				<br><br><br>
				
				<div id="view">			
				</div>
				
				<br><br><br><br>
			</div>
		</article>
	</form>	
	
</section>



<jsp:include page="../layout/footer_lib.jsp"/>