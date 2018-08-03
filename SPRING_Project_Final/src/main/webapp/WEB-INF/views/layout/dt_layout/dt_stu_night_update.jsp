<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700);
@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

#paste
{width:550px; height:150px; padding:0px;}

body {
    background: #48FFFF;
	font-family: 'Roboto', sans-serif;
	color:#333;
	line-height: 22px;
	height:600px;
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 400;
	color:#111;
	margin-top:5px;
	margin-bottom:5px;
}
h1, h2, h3 {
	text-transform:uppercase;
}

input.upload {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
    padding: 0;
    font-size: 12px;
    cursor: pointer;
    opacity: 1;
    filter: alpha(opacity=1);    
}

.form-inline .form-group{
    margin-left: 0;
    margin-right: 0;
}
.control-label {
    color:#48FFFF;
}

</style>
<title>외박 수정 폼</title>
</head>
<body>
<c:if test="${dtos != null }"> 
<c:forEach var="dto" items="${dtos}">
<div class="container" style="margin-left:550px;">
	<div class="row">
    <div class="col-md-8">
   <h1 class="entry-title" style="margin-left:350px;"><span style="font-size:x-large; color:#48FFFF;" >외 박 신 청<br></span> </h1>
   
      <section>      
        <hr>
            <form class="form-horizontal" method="post" name="signup" id="signup" enctype="multipart/form-data" action="dt_stu_overnight_revision">        
        <div class="form-group">
          <label class="control-label col-sm-3">학번<span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control" name="st_no" id="emailid"  value="${dto.st_no}">
            </div>
            </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">호실 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="text" class="form-control" name="dorm_room" id="password"  value="${dto.dorm_room}">
           </div>   
          </div>
        </div>
        
        <div class="form-group" style="margin-left: 5px;">
          <label class="control-label col-sm-3">외박신청일  <span class="text-danger">*</span></label>
          <div class="col-xs-8">
          	<input type="Date" value="${dto.dorm_ex_dt}" name="dorm_ex_date">

          </div>
        </div>
        <label class="control-label col-sm-3">&nbsp; 외박 신청사유  <span class="text-danger">*</span></label>
		<div class="container">
			<div class="row">
		&nbsp;<textarea  id="paste" name="textarea">${dto.dorm_reason}</textarea>
			</div>
		</div>
		
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10" style="margin-left:300px;">
            <br><br><input name="Submit" type="submit" value="등록" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
</div>
</div>
</c:forEach>
</c:if>
</body>
</html>