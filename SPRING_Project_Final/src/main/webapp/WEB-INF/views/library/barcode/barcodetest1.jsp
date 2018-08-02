<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="resources/js/bar_js/jquery-barcode.js"></script>
</head>
<body>

<div id="bcTarget"></div>
</body>

<script type="text/javascript">
    $("#bcTarget").barcode("2222223132", "code39");

    //    ���ڵ� Ÿ��    
    //    codabar
    //    code11 (code 11)
    //    code39 (code 39)
    //    code93 (code 93)
    //    code128 (code 128)
    //    ean8 (ean 8)	
    //    ean13 (ean 13)
    //    std25 (standard 2 of 5 - industrial 2 of 5)
    //    int25 (interleaved 2 of 5)
    //    msi
    //    datamatrix (ASCII + extended)
</script>

</html>