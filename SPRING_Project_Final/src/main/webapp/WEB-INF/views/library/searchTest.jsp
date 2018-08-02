<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<script src="resources/js/request.js"></script>

<script type="text/javascript">

	var checkFirst = true; 
	var loopSendKeyword = false; 
	var lastKeyword = null;	
	
	function startSuggest() {
		
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
	
		var keyword = document.search.keyword.value;
		
	
		if(keyword == null) {
			hide("divSuggest");
			lastKeyword = "";
			
		
		} else if(keyword != lastKeyword){
			lastKeyword = keyword;
			var params = "keyword="+keyword;
			
			sendRequest(result_callback, "searchResult", "GET", params);
		}
		
		setTimeout("sendKeyword()", 500);
	}
	
	
	
	function result_callback() {
		var suggestlist = document.getElementById("suggestlist");
		
		if(httpRequest.readyState == 4) {
			if(httpRequest.status == 200) {
				
				var books = "";
				var data = httpRequest.responseText;
				var datalist = data.split("|");	
				var count = datalist[0];	
				
				if(count > 0) {
					
					var booklist = datalist[1].split(",");	
															
					for(var i=0; i<count-1; i++) {
						books += "<a href=\"javascript:select('	"+booklist[i]+"	')\">"
							+ booklist[i]	
							+ "</a>"
							+ "<br>";
					}
					show("divSuggest");
					
					suggestlist.innerHTML = books;
								
				} else {
					hide("divSuggest");
				}
							
			} else {
				suggestlist.innerHTML = "에러발생";
			}
		
		} else {
			suggestlist.innerHTML = "상태 : "+ httpRequest.readyState;
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


<body>

	<h3>검색으로 책 제목을 찾아서 출력</h3>
	<br><br>
	
	<form name="search">
		<input type="text" name="keyword" onkeydown="startSuggest();">
		
		
	
		<input type="button" value="검색" onclick="location='https://book.naver.com/search/search.nhn?sm=sta_hty.book&sug=&where=nexearch&query=' + encodeURI(document.search.keyword.value)">
	</form>


	
	<div id="divSuggest">
		<div id="suggestlist"><!-- 검색 결과 값이 들어옴 --></div>
	</div>
</body>
</html>