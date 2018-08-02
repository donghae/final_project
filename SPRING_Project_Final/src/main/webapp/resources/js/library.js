/**
 * 
 */

var msg_text = "미입력된 텍스트가 있습니다. 양식을 작성해주세요";


/*도서 등록 양식 입력확인*/
function bookAddForm_written() {
	if (!document.bookAddForm.global.value) {
		alert(msg_text);
		document.bookAddForm.global.focus();
		return false;
	}
	if (!document.bookAddForm.category.value) {
		alert(msg_text);
		document.bookAddForm.category.focus();
		return false;
	}
	if (!document.bookAddForm.isbn.value) {
		alert(msg_text);
		document.bookAddForm.isbn.focus();
		return false;
	}
	if (!document.bookAddForm.title.value) {
		alert(msg_text);
		document.bookAddForm.title.focus();
		return false;
	}
	if (!document.bookAddForm.price.value) {
		alert(msg_text);
		document.bookAddForm.price.focus();
		return false;
	}
	if (!document.bookAddForm.amt.value) {
		alert(msg_text);
		document.bookAddForm.amt.focus();
		return false;
	}
	if (!document.bookAddForm.img.value) {
		alert(msg_text);
		document.bookAddForm.img.focus();
		return false;
	}
	if (!document.bookAddForm.publish.value) {
		alert(msg_text);
		document.bookAddForm.publish.focus();
		return false;
	}
	if (!document.bookAddForm.date.value) {
		alert(msg_text);
		document.bookAddForm.date.focus();
		return false;
	}

}



/*도서 삭제 시 컨펌*/
function delBook(b_no) {
	var really = confirm("선택하신 도서를 삭제하시겠습니까?");
	
	if(really == true) {
		window.location='lib_bookDelPro?b_no='+b_no;
	} else {
		return false;
	}
	
}





/*관리자 : 대출/반납 페이지 - 폼 추가*/
function addloanForm() {
	$('.formplus').append("<br><br><label><span>도서 번호</span>" +
			"<input type='text' name='b_no'></label>");
}


/*관리자 : 대출/반납 페이지 - 입력여부*/
function bookLoanForm_written() {
	if(!document.bookLoanForm.user_no.value) {
		alert(msg_text);
		document.bookLoanForm.user_no.focus();
		return false;
	}
	if(!document.bookLoanForm.b_no.value) {
		alert(msg_text);
		document.bookLoanForm.b_no.focus();
		return false;
	}
}


/*관리자 : 대출/반납 페이지 - 입력여부, 반납처리*/
function bookReturn_written() {
	if(!document.bookLoanForm.user_no.value) {
		alert(msg_text); 
		document.bookLoanForm.user_no.focus();
		return false;
	}
	if(!document.bookLoanForm.b_no.value) {
		alert(msg_text);
		document.bookLoanForm.b_no.focus();
		return false;
	}
	
	var b_no = document.getElementsByName("b_no")[0];
	var user_no = document.getElementsByName("user_no")[0];
	
	window.location="lib_bookReturnPro?b_no="+b_no.value+"&user_no="+user_no.value;
}


/*관리자 : 대출/반납 페이지 - 입력여부, 연장처리*/
function bookRenew_written() {
	if(!document.bookLoanForm.user_no.value) {
		alert(msg_text); 
		document.bookLoanForm.user_no.focus();
		return false;
	}
	if(!document.bookLoanForm.b_no.value) {
		alert(msg_text);
		document.bookLoanForm.b_no.focus();
		return false;
	}
	
	var b_no = document.getElementsByName("b_no")[0];
	var user_no = document.getElementsByName("user_no")[0];
	
	window.location="lib_bookRenewPro?b_no="+b_no.value+"&user_no="+user_no.value;
}


/*function closeWithSubmit() {
	var f= document.forms.seat_form;
    document.domain = "localhost"; 
    opener.name = "lib_seat";
    f.target = opener.name;
    f.submit();
    self.close();
}*/