<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/box_mon.css">
<link rel="stylesheet" href="resources/css/button.css">
<link rel="stylesheet" href="resources/css/font_common.css">
<link rel="stylesheet" href="resources/css/footer_ara.css">
<link rel="stylesheet" href="resources/css/form-basic.css">
<link rel="stylesheet" href="resources/css/header_ara.css">
<link rel="stylesheet" href="resources/css/table_admin.css">
<link rel="stylesheet" href="resources/css/table_student.css">
</head>
<body>
      <input type="hidden" value="${lec_name}" name="lec_name">
      <input type="hidden" value="${st_no}" name="st_no">
   
      <c:if test="${insertCnt == 0}">
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <script type="text/javascript">
            swal("다시 입력해주세요.").then((okay) => {
			  if (okay) {
				  window.location='st_pro?st_state=51&lec_name=${lec_name}&st_no=${st_no}';
				  }
				});
         </script>
      </c:if>

      <c:if test="${insertCnt != 0}">
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <script type="text/javascript">
       		swal("입력 완료").then((okay) => {
			  if (okay) {
				  window.location='st_pro?st_state=51&lec_name=${lec_name}&st_no=${st_no}';
				  }
				});
            
         </script>         
      </c:if>   
</body>
</html>