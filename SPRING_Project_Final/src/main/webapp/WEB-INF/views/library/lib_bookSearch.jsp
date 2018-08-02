<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>  

<script src="resources/js/request.js"></script>

<script type="text/javascript">

	var checkFirst = true; 
	var loopSendKeyword = false; 
	var lastKeyword1 = null;	
	var lastKeyword2 = null;
	
	function startSuggest() {
		
		hide("list");
		
		if(checkFirst == true) {
			loopSendKeyword = true; 
			setTimeout("sendKeyword()", 500);
		}
		checkFirst = false; 
	}
	
	
	 
	function sendKeyword() {
		if(loopSendKeyword == false) {
			return false;
		} 
	
		var author = document.search.author.value;
		var title = document.search.title.value;
		

		if(author != lastKeyword1 || title != lastKeyword2){
			if(author != lastKeyword1){
				lastKeyword1 = author;
			}
			if(title != lastKeyword2){
				lastKeyword2 = title;
			}
			
			var params = "title="+title+"&author="+author;
			
			sendRequest(result_callback, "lib_bookSearchResult", "GET", params);
		} 
	
		setTimeout("sendKeyword()", 500);
	}
	
	
	
	function result_callback() {
		var suggestlist = document.getElementById("suggestlist");
		
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				
				var data = httpRequest.responseText;
				suggestlist.innerHTML = data;
				
			} else {
				suggestlist.innerHTML = "에러발생";
			}
		
		} else {
			suggestlist.innerHTML = "검색 중..";
		}
	}
	
	
	function select(book) {
		document.search.keyword.value = book;		
		loopSendKeyword = false;	
		
		checkFirst = true;	
		hide("divSuggest");
	}
	
	
	function show(str) {
		var element = document.getElementById(str);
		
		if(element) {
			element.style.display=""; 
		}
	}
	function hide(str) {
		var element = document.getElementById(str);
		
		if(element) {
			element.style.display="none"; 
		}
	}
</script>

  
<link rel="stylesheet" href="resources/css/box_mon.css"> 



<jsp:include page="../layout/header_lib_admin.jsp"/>


<!-- 본문 -->
<section>
	
	<form name="search">
	
		<!-- 검색칸 -->
		<article class="back_mint" style="padding:95px 0px 25px;">
			<div id="header_fill"></div>
				<div class="content">
				<div class="cen_middle">
				
					<span style="padding:0px 3px;">
						<select class="vertical" style="width:100px; height:47px;">
							<!-- <optgroup label="대 분 류"></optgroup> -->
							<option value="0" selected="selected">대 분 류</option>
							<option value="1">국 내</option>
							<option value="2">국 외</option>						
						</select>
					</span>
					
					<span style="padding:0px 3px;">
						<select class="vertical" style="width:100px; height:47px;">
							<!-- <optgroup label="중 분 류"></optgroup> -->
							<option value="0" selected="selected">중 분 류</option>
							<option value="1">소 설</option>
							<option value="2">예 술</option>
							<option value="3">외 국 어</option>
							<option value="4">과 학</option>
							<option value="5">시/에세이</option>				
						</select>
					</span>
					
					<span style="padding:0px 3px;">
						<input class="vertical" type="text" name="author" onkeydown="javascript:startSuggest();"
								placeholder="저 자" style="width:150px;">		
					</span>
									
					<span style="padding:0px 3px;">					
						<input class="vertical" type="text" name="title" onkeydown="javascript:startSuggest();"
								placeholder="제 목" style="width:400px;">
					</span>&nbsp;
							
					<span style="padding:0px 3px;">	
						<input class="btn_red" type="submit" value="검 색" style="height:45px; width:80px;font-size:15px;">
					</span>	
				</div>
			</div>	
		</article>					
	</form>		
	
	
	<div id="list">
	<!-- 목록 조회 -->
	<article class="back_white">
		<div class="content">
			<table class="st_beige">
				<thead class="st_beige">
					<tr>
						<th>도서번호</th>
						<th>대 분 류</th>
						<th>중 분 류</th>
						<th>제 목</th>
						<th>저 자</th>
						<th>출 판 사</th>
						<th>대출가능</th>
						<th></th>
					</tr>
				</thead>
				
				<tbody class="st_beige">
					<c:if test="${cnt == 0}">
						<tr>
							<td></td>
							<td colspan="7">검색 결과가 없습니다</td>							
						</tr>
					</c:if>
					
					<c:if test="${cnt > 0}">
					<c:forEach var="bVOs" items="${bVOs}">
						<tr>
							<td>${bVOs.b_no}</td>
							<td>${bVOs.b_global}</td>
							<td>${bVOs.b_category}</td>
							<td>${bVOs.b_title}</td>
							<td>${bVOs.b_author}</td>
							<td>${bVOs.b_publish}</td>
							<td>${bVOs.b_state_fl}</td>
							<td>
								<Button class="btn_navy" type="button" onclick="window.location='lib_bookModiForm?b_no=${bVOs.b_no}'">수정</Button>&nbsp;
								<Button class="btn_navy" type="button" onclick="javascript:delBook('${bVOs.b_no}');">삭제</Button>
								<%-- <c:if test="${memId != null}">
									<Button class="btn_navy" type="button" onclick="window.location='#'">도서 예약</Button>							
								</c:if> --%>
							</td>								
						</tr>
					</c:forEach>
					</c:if>	
				</tbody>
			</table>
			
			
			
			<br><br>
			<!-- 페이지 컨트롤 버튼 -->
			<div class="cen_middle">
				<c:if test="${cnt > 0}">
					<!-- 처음 블럭[◀◀] / 이전 블럭[◀] -->
					<c:if test="${startPage > pageBlock}">
						<a href="lib_bookSearch">[◀◀]</a>
						<a href="lib_bookSearch?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
				
					<!-- 페이지 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<!-- 현재 페이지와 i가 같은 경우 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<!-- 현재 페이지와 i가 다를 경우 -->
						<c:if test="${i != currentPage}">
							<a href="lib_bookSearch?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="lib_bookSearch?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="lib_bookSearch?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>			
		</div>
	</article>
	</div>
	
	
	<div id="divSuggest">
		<div id="suggestlist"><!-- 검색 결과 값이 들어옴 --></div>
	</div>
</section>



<jsp:include page="../layout/footer_lib.jsp"/>