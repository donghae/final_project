<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../setting.jsp" %>  

<script src="resources/js/request.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

	var checkFirst = true; 
	var loopSendKeywordAdmin = false; 
	var lastKeyword1 = null;	//title	
	var lastKeyword2 = null;	//author
	var searchSelect1 = null;	//global
	var searchSelect2 = null;	//category
	
	
	$(function() {		
		$('a[name=pageNum_nm]').click(function(e) {//데이터 입력이 끝났을 때:keyup(),  데이터 입력 중:keydown()
			e.preventDefault();
			var search=$(this).attr('id'); //입력한 키워드
			hide("list");
			var title = $('input[name=title]').val();
			var author = $('input[name=author]').val();
			var global = $('select[name=global]').val();
			var category = $('select[name=category]').val();
			
		
			if(author != lastKeyword1 || title != lastKeyword2){
				if(author != lastKeyword1){
					lastKeyword1 = title;
				}
				if(title != lastKeyword2){
					lastKeyword2 = author;
				}
				if(global != searchSelect1){
					searchSelect1 = global;
				}
				if(category != searchSelect2){
					searchSelect2 = category;
				}		
				
				var params = "b_title="+title+"&b_author="+author+"&b_global="+global+"&b_category="+category+"&pageNum="+search;
				
				
				$.ajax({
					type : 'get',
					url : 'lib_bookSearchResult_admin',
					data : params,
					
					success : function(data) {
						$('#suggestlistAdmin').html(data);
					},
					error : function() {
						alert('검색 오류');
					}
					
				});
			}		
		});
	});
	
	
		
	//검색입력시
	function startSuggestAdmin() {
		
		hide("list");
		
		if(checkFirst == true) {
			loopSendKeyword = true; 
			/* setTimeout("sendKeywordAdmin()", 500); */
		}
		checkFirst = false; 
	}
	
	
	 
	function sendKeywordAdmin() {
		
		/* if(loopSendKeywordAdmin == false) {
			return false;
		}  */
	
		hide("list");
		var title = document.booksearch.title.value;
		var author = document.booksearch.author.value;		
		var global = document.booksearch.global.value;
		var category = document.booksearch.category.value; 

		if(author != lastKeyword1 || title != lastKeyword2){
			if(author != lastKeyword1){
				lastKeyword1 = title;
			}
			if(title != lastKeyword2){
				lastKeyword2 = author;
			}
			if(title != lastKeyword2){
				searchSelect1 = global;
			}
			if(title != lastKeyword2){
				searchSelect2 = category;
			}
			
			var params = "b_title="+title+"&b_author="+author+"&b_global="+global+"&b_category="+category;
			
			sendRequest(adminresult_callback, "lib_bookSearchResult_admin", "GET", params);
		} 
	
		/* setTimeout("sendKeywordAdmin()", 500); */
	}
	
	
function sendKeyword2(pageNum) {
		
		/* if(loopSendKeyword == false) {
			return false;
		}  */
		hide("list");
		var title = document.booksearch.title.value;
		var author = document.booksearch.author.value;		
		var global = document.booksearch.global.value;
		var category = document.booksearch.category.value;
		
	
		if(author != lastKeyword1 || title != lastKeyword2){
			if(author != lastKeyword1){
				lastKeyword1 = title;
			}
			if(title != lastKeyword2){
				lastKeyword2 = author;
			}
			if(global != searchSelect1){
				searchSelect1 = global;
			}
			if(category != searchSelect2){
				searchSelect2 = category;
			}		
			
			var params = "b_title="+title+"&b_author="+author+"&b_global="+global+"&b_category="+category+"&pageNum="+pageNum;
			
			sendRequest(adminresult_callback, "lib_bookSearchResult_admin", "GET", params);
		} 
	 
		/* setTimeout("sendKeyword()", 500); */
		
	}
	
	
	
	function adminresult_callback() {
		var suggestlistAdmin = document.getElementById("suggestlistAdmin");
		
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				
				var data = httpRequest.responseText;
				suggestlistAdmin.innerHTML = data;
				
			} else {
				suggestlistAdmin.innerHTML = "에러발생";
			}
		
		} else {
			suggestlistAdmin.innerHTML = "검색 중..";
		}
	}
	
	
	function select(book) {
		document.booksearch.keyword.value = book;		
		loopSendKeywordAdmin = false;	
		
		checkFirst = true;	
		hide("divSuggestAdmin");
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



<jsp:include page="../../layout/header_lib_admin.jsp"/>


<!-- 본문 -->
<section>
	
	<form name="booksearch">
	
		<!-- 검색칸 -->
		<article class="back_mint" style="padding:95px 0px 25px;">
			<div id="header_fill"></div>
				<div class="content">
				<div class="cen_middle">
				
					<span style="padding:0px 3px;">
						<select name="global" class="vertical" onchange="startSuggestAdmin();" style="width:100px; height:47px;">							
							<option value="0" selected="selected">대 분 류</option>
							<option value="1">국 내</option>
							<option value="2">국 외</option>						
						</select>
					</span>
					
					<span style="padding:0px 3px;">
						<select name="category" class="vertical" onchange="startSuggestAdmin();" style="width:100px; height:47px;">							
							<option value="0" selected="selected">중 분 류</option>
							<option value="1">소 설</option>
							<option value="2">예 술</option>
							<option value="3">외 국 어</option>
							<option value="4">과 학</option>
							<option value="5">시/에세이</option>				
						</select>
					</span>
					
					<span style="padding:0px 3px;">
						<input class="vertical" type="text" name="author" onkeydown="javascript:startSuggestAdmin();"
								placeholder="저 자" style="width:150px;">		
					</span>
									
					<span style="padding:0px 3px;">					
						<input class="vertical" type="text" name="title" onkeydown="javascript:startSuggestAdmin();"
								placeholder="제 목" style="width:400px;">
					</span>&nbsp;
							
					<span style="padding:0px 3px;">	
						<input class="btn_red" value="검 색" style="height:45px; width:80px;font-size:15px;">
					</span>	
				</div>
			</div>	
		</article>					
	</form>		
	
	
	<div id="list">
	<!-- 목록 조회 -->
	<article class="back_white" >
		<div class="content" id="suggestlist_main">
			<table class="st_beige" >
				<thead class="st_beige">
					<tr>
						<th style="width:12%;">도서번호</th>
						<th style="width:7.5%;">대 분 류</th>
						<th style="width:7.5%;">중 분 류</th>
						<th style="width:22%;">제 목</th>
						<th style="width:16%;">저 자</th>
						<th style="width:13%;">출 판 사</th>
						<th style="width:7%;">대여정보</th>
						<th style="width:15%;"></th>
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
					<c:set var="len" value="${fn:length(bVOs)}" />
					<c:forEach var="i" begin="0" end="${len-1}">
						<tr>
							<td style="width:12%;">${bVOs[i].b_no}</td>
							
							<c:if test="${bVOs[i].b_global == 1}">
								<td style="width:7.5%;">국내</td>							
							</c:if>
							<c:if test="${bVOs[i].b_global == 2}">
								<td style="width:7.5%;">국외</td>							
							</c:if>
							
							<c:if test="${bVOs[i].b_category == 1}">
								<td style="width:7.5%;">소설</td>							
							</c:if>
							<c:if test="${bVOs[i].b_category == 2}">
								<td style="width:7.5%;">예술</td>							
							</c:if>
							<c:if test="${bVOs[i].b_category == 3}">
								<td style="width:7.5%;">외국어</td>							
							</c:if>
							<c:if test="${bVOs[i].b_category == 4}">
								<td style="width:7.5%;">과학</td>							
							</c:if>
							<c:if test="${bVOs[i].b_category == 5}">
								<td style="width:7.5%;">시/에세이</td>							
							</c:if>

							<td style="width:22%; text-align:left;">${bVOs[i].b_title}</td>
							<td style="width:16%;">${bVOs[i].b_author}</td>
							<td style="width:13%;">${bVOs[i].b_publish}</td>
							
							<c:if test="${bloanVOs[i].loan_state == null}">
								<td style="width:7%;">보관 중</td>								
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 0}">
								<td style="width:7%;">보관 중</td>								
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 1}">
								<td style="width:7%;">대여 중</td>
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 11}">
								<td style="width:7%;">반납 예정</td>								
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 12}">
								<td style="width:7%;">정상 반납</td>
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 2}">
								<td style="width:7%;">예약 중</td>								
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 3}">
								<td style="width:7%;">미반납</td>
							</c:if>
							<c:if test="${bloanVOs[i].loan_state == 31}">
								<td style="width:7%;">장기 미납</td>
							</c:if>
							
							<td style="width:15%;">
								<Button class="btn_navy" type="button" 
									onclick="window.location='lib_bookModiForm?b_no=${bVOs[i].b_no}'">수정</Button>&nbsp;
								<Button class="btn_navy" type="button" 
									onclick="javascript:delBook('${bVOs[i].b_no}');">삭제</Button>								
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
						<a href="lib_bookSearch_admin">[◀◀]</a>
						<a href="lib_bookSearch_admin?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
				
					<!-- 페이지 -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<!-- 현재 페이지와 i가 같은 경우 -->
						<c:if test="${i == currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						<!-- 현재 페이지와 i가 다를 경우 -->
						<c:if test="${i != currentPage}">
							<a href="lib_bookSearch_admin?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블럭[▶] / 마지막 블럭[▶▶] -->
					<c:if test="${pageCount > endPage}">
						<a href="lib_bookSearch_admin?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="lib_bookSearch_admin?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
			</div>			
		</div>
	</article>
	</div>
	
	
	<div id="divSuggestAdmin">
		<div id="suggestlistAdmin"><!-- 검색 결과 값이 들어옴 --></div>
	</div>
</section>



<jsp:include page="../../layout/footer_lib.jsp"/>