var admin_id = "아이디를 입력하세요";
var admin_idChk="아이디를 확인해 주세요";
var admin_pwd = "비밀번호를 입력하세요";
var admin_pwdChk = "비밀번호가 다릅니다.";

var insertError = "회원가입에 실패했습니다.\n 확인 후 다시 시도하세요.";
var updateError = "회원정보 수정에 실패했습니다.\n 확인 후 다시 시도하세요";
var deleteError = "회원정보 삭제에 실패했습니다.\n 확인 후 ㅂ다시 시도하세요;"
var passwordError = "입력하신 비밀번호가 일치하지 않습니다.\n확인 후 다시 시도하세요;"

//에러메시지
function errorAlert(errorMsg){
	alert(errorMsg);
	window.history.back(); //이전 페이지로 돌아라가..
}


/*//회원가입 버튼 클릭시 입력 값 체크
function inputCheck(){
	//아이디 입력여부
	if(document.signIn.userId.value == ""){ //아이디가 없을 때
		alert("id입력하세요.");
		document.signIn.userId.focus();
		return false; // 나를 호출한 곳으로 false를 리턴하면서 동작 중지
	}
	
	//비밀번호 입력여부
	if(document.signIn.userPwd.value == ""){
		alert("Pwd를 입력하세요");
		document.signIn.userPwd.focus();
		return false;
	}
	
	//비밀번호 입력확인
	if(document.signIn.userRePwd.value == ""){
		alert("비밀번호를 다시 입력해 주세요")
		document.signIn.userRePwd.focus();
		return false;
	}
	
	//비밀번호와 확인 비밀번호가 불일치시 메시지 출력 
	if(document.signIn.userPwd.value != document.signIn.userRePwd.value){
		document.signIn.userPwd.value="";
		document.signIn.userRePwd.value="";
		alert("pwd가 일치하지 않습니다.");
		return false;	
	}
	
	//이메일 불일치시 메시지 출력
	if(document.signIn.userEmail.value == ""){
		alert("email을 입력하세요")
		document.signIn.userEmail.focus();
		return false;
	}
}

	//중복확인 체크시 아이디 체크 후 새 창 실행
	function idCheck(){
		if(!document.signIn.userId.value){
			alert(msg_id);
			document.signIn.userId.focus();
			return false;
		}	
		var url="confirm?userId=" + document.signIn.userId.value;
		window.open(url, "confirm", "menubar=no, width=100, height=100");
	}	
	
	// 사용 가능 아이디 넘겨주고 새창 닫음
	function setId(){
			opener.document.signIn.userId.value = userId;
			opener.document.signIn.hiddenId.value = "1";
			self.close();	
			window.close();
		}
	
	//이메일 
	function selectEmailChk(){
		if(document.signIn.email3.value == 0){ // 직접입력
			document.signIn.email2.value= "";
			document.signIn.email2.focus();
			
			// 이메일 직접입력이 아닌경우 select box의 값(email3)를 email2의 값으로 설정
			}else{
				document.signIn.email2.value = document.signIn.email3.value;
			}	
		}	
	
	// 이메일 인증 버튼 클릭
	function emailcke(){
		if(!document.signIn.email1.value){
			alert(msg_email);
			document.signIn.email1.focus();
			return false;
		}	
		
		email = document.signIn.email1.value +"@"+ document.signIn.email2.value
		var url="findId?findId="+email;
		window.open(url, "emailche", "menubar=no, width=100, height=100");			
	}
	
	// 
	function confirmIdCheck(){
		if(!document.confirmform.id.value){
			alert(msg_id);
			document.confirmform.id.focus();
			return false;
		}	
	}
	
	//로그인 할 시 id 확인
	function idpwdCheck(){
		if(!document.login.id.value){
			alert(msg_id);
			document.login.id.focus();
			return false;
		
		// 로그인시 pwd 확인
		}else if(!document.login.pwd.value && !document.login.rePwd.value){
			alert(msg_pwdChk);
			document.login.pwd.focus();
			return false;
		}
		

	}
	//정보수정 입력시 체크
	function modifyCheck(){
		if(!document.modifyForm.pwd.value){
			alert(msg_pwd);
			document.modifyForm.pwd.focus();
			return false;
		
		}else if(!document.modifyForm.hp.value){
			alert(msg_hp);
			docuemnt.modifyForm.hp.focus();
			return false;
		
		}else if(!document.modifyForm.email.value){
			alert(msg_email);
			document.modifyForm.email.focus();
			return false;
		}		
	}

	//상품목록 구매/장바구니 담기 클릭 시 실행
	function book(index){
		if(index == 1){
			document.buy.action="nowbuy";
		
		}else if(index == 2){
			document.buy.action="cart";
		}
		document.buy.submit();
	}
*/
	
	
	