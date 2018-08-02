<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../dorm_setting.jsp" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td{
		height:40px;
	}
</style>
</head>
<body>
	<h2 align="center">공지사항</h2>
	<h2 align="center"> </h2>
	<table style="width:1000px" align="center" border="1">
		<tr>
			<td colspan="7" align="center" style="height:25px">
				글목록(갯수 : ${cnt}) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="dt_admin_notice_write?pageNum=${pageNum}"> 글쓰기</a>
			</td>
		</tr>
		
		<tr>
			<td style="width:5%" align="center"> 글번호 </td>
			<td style="width:10%" align="center"> 작성자 </td>
			<td style="width:20%" align="center"> 제목 </td>
			<td style="width:20%" align="center"> 내용 </td>
			<td style="width:15%" align="center"> 작성일 </td>
			<td style="width:10%" align="center"> 첨부파일 </td>
			<td style="width:5%" align="center"> 조회수 </td>
		</tr>
		
		<!-- 게시글이 있으면 -->
		<c:if test="${cnt>0}">
			<c:forEach var="dto" items="${dtos}"> <!-- 큰바구니에서 작은 바구니를 꺼내서 출력, 건수만큼 반복 -->
				<tr>
					<td align="center">
						${dto.dorm_n_no}
					</td>
					
 					<td align="center">
						<c:if test="${dto.ad_no == '018104001'}">
							박희현
						</c:if>
						<c:if test="${dto.ad_no == 018202001}">
							김동해
						</c:if>
						<c:if test="${dto.ad_no == 018304001}">
							이아름
						</c:if>						
						<c:if test="${dto.ad_no == 018104001}">
							박희현
						</c:if>						
						<c:if test="${dto.ad_no == 018401001}">
							이승희
						</c:if>						
						<c:if test="${dto.ad_no == 018505001}">
							최유민
						</c:if>
						<c:if test="${dto.ad_no == 018601001}">
							김광민
						</c:if>																	
					</td>																											
					<td align="center">
						
<%-- 						<!-- 추가 Start -->
						<!-- 답글인경우 : 들여쓰기 >1 -->
						<c:if test="${dto.ref_level > 1 }"> <!-- 답글인 경우: 들여쓰기 > 1 -->
							<c:set var="wid" value="${(dto.ref_level-1) * 10}" />
							<img src="${path}images/level.gif" border="0" width="${wid}" height="15">
						</c:if>
					
						<!-- 답글인경우: 들여쓰기 > 0 -->
						<c:if test="${dto.ref_level > 0}">
							<img src="${path}images/re.gif" border="0" width="20" height="15">
						</c:if>
					
						<!-- hot이미지 -->
						<c:if test="${dto.readCnt > 10}">
							<img src="${path}images/hot.gif" border="0" width="20" height="20">
						</c:if>

						<!-- 추가 End --> --%>				
					
						<!-- 글제목 클릭시 num,pageNum,number 를 같이 넘긴다. -->
						<a href="dt_admin_notice_board?num=${dto.dorm_n_no}&pageNum=${pageNum}&number=${number+1}&cnt=${dto.dorm_n_cnt}"> ${dto.dorm_n_title}</a>
						
					</td>
					<td align="center">
						${dto.dorm_n_content}
					</td>
					<td align="center">
						<fmt:formatDate type="both" pattern="yyy-MM-dd" value="${dto.dorm_n_dt}"/>
					</td>
					<td align="center">
						${dto.dorm_n_file}
					</td>
					<td align="center">
						${dto.dorm_n_cnt}
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 게시글이 없으면 -->
		<c:if test="${cnt==0}">
			<tr>
				<td colspan="6" align="center">
					게시글이 없습니다. 글을 작성해주세요.!!
				</td>
			</tr>
		</c:if>
	</table>
		<!-- 페이지 컨트롤 -->
<div style=" padding:10em;">		
	<table style="text-align: center;">
		<tr>
			<th align="center">
				<c:if test="${cnt > 0}">
					<!-- 처음[◀◀] / 이전블록[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="dt_admin_notice_sel">[◀◀]</a>
						<a href="dt_admin_notice_sel?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i==currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<c:if test="${i!=currentPage}">
							<a href="dt_admin_notice_sel?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶]/ 끝[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="dt_admin_notice_sel?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="dt_admin_notice_sel?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</th>
		</tr>
	</table>
</div>	
</body>
</html>