<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../setting.jsp" %>

<script type="text/javascript">
	function popup(){
		var url = "cy_form";
		window.open(url, "동영상", "menubar=no, width=800, height=600");
	}
	
	function loadVideo(value) {
        if(value.files && value.files[0]) {
        	var reader = new FileReader();
            reader.onload = function() {
                var media = new Audio(reader.result);
                media.onloadedmetadata = function(){
                     media.duration; // this would give duration of the video/audio file
                     var duration = media.duration;
             		var durationmin = Math.floor(duration / 60);
             		var durationsec = Math.floor(duration - (durationmin * 60));
             		if (durationmin < 10) {
            		    durationmin = "0" + durationmin;
            		}
            		if (durationsec < 10) {
            		    durationsec = "0" + durationsec;
            		}
            		var durationTotal = durationmin + ":" + durationsec;
             		document.getElementById("videoLength").value = durationTotal;
                };    
            };
            reader.readAsDataURL(value.files[0]);
        }
        
        
   }
</script>

<body>
	<%@include file="../layout/header_ara.jsp"%>
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<!-- Popular -->

	<div class="main-content">
		<input type="button" id="btn_popup" onclick="popup();" value="시청">
		<input type="text" id="totalTime">        
		<form action="cy_upload" method="post" enctype="multipart/form-data">
			<input type="file" name="lectureVideo" id="lectureVideo" onchange="" accept="video/mp4, video/mpeg4, video/avi">
			
			<input type="submit" value="전송">
		</form>
		<select>
			<c:forEach var="i" begin="1" end="16">
				<option value="i">${i}주차</option>
			</c:forEach>
		</select>
		<input type="text" id="videoLength">
		<a href="cy_download?fileName=cyber1_2018_07_27_074355.mp4">cyber1_2018_07_27_074355.mp4</a>

    </div>
	<%@include file="../layout/footer_lib.jsp"%>
</body>
</html>