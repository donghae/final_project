<%@page import="com.spring.projectFinal.LIVO.SeatVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	SeatVO sVO = (SeatVO)request.getAttribute("sVO");	
%>
<%= sVO.getRdRoom_no()%>|<%= sVO.getSeat_no()%>|<%= sVO.getUser_no()%>|<%= sVO.getUser_name()%>|<%= sVO.getSeat_st_dt()%>-<%=sVO.getSeat_end_dt() %>

