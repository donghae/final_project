<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/qr_js/jquery.qrcode.js"></script>
<script type="text/javascript" src="resources/js/qr_js/qrcode.js"></script>

<div id="gcDiv"></div>


<script>
	jQuery('#gcDiv').qrcode({
		render	: "table",
		width : 300,
		height : 300,
		
		text	: "https://blog.naver.com/fuqmy72"/* QR코드 스캔 시, 연결되는 페이지 */
	});	
</script>

</body>
</html>