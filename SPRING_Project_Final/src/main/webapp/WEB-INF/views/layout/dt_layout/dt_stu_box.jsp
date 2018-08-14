<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/mvcajax/resources/request.js"></script>

<style>
.btn-sq-lg {
  width: 100px !important;
  height: 100px !important;
}

.btn-sq {
  width: 100px !important;
  height: 100px !important;
  font-size: 10px;
}

.btn-sq-sm {
  width: 50px !important;
  height: 50px !important;
  font-size: 10px;
}

.btn-sq-xs {
  width: 25px !important;
  height: 25px !important;
  padding:2px;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="container">
	      <div class="row">
	        <div class="col-lg-12" style="margin-top:-100px;">
	          <p>
	            <a href="dormitoty_stu_overnight_select" class="btn btn-sq-lg btn-primary"><br>
	                <i class="fa fa-user fa-5x"></i><br/>
	                                외박 조회 <br>
	            </a>
	            <a href="dormitory_stu_overnight_insert" class="btn btn-sq-lg btn-success"><br>
	              <i class="fa fa-user fa-5x"></i><br/>
	              	외박 신청 <br>
	            </a>
	            <a href="dormitory_stu_overnight_update" class="btn btn-sq-lg btn-info"><br>
	              <i class="fa fa-user fa-5x"></i><br/>
	              	외박 수정 <br>
	            </a>
	            <a href="#" class="btn btn-sq-lg btn-warning"><br>
	              <i class="fa fa-user fa-5x"></i><br/>
	              	외박 삭제 <br>
	            </a>
	          </p>
	        </div>
		</div>
	</div>	
</div>
</body>
</html>