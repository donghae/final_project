package com.spring.projectFinal.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.projectFinal.service.LIServiceImpl;

@Controller//도서관 컨트롤러
public class LIController {

	@Autowired
	LIServiceImpl LIservice;
	
	
	
	//도서관 홈
	@RequestMapping("lib_home")
	public String library(HttpServletRequest req,Model model) {
		
		System.out.println("library-도서관 홈");
		return "library/lib_home";
	}
	
	//도서관 관리자 홈 : 홈에서 로그인 시 연결
	@RequestMapping("lib_admin")
	public String lib_admin(HttpServletRequest req,Model model) {
		
		System.out.println("lib_admin-도서관 관리자 홈");
		return "library/lib_admin";
	}
	
	
	//관리자 : 도서 추가 양식
	@RequestMapping("lib_bookAddForm")
	public String lib_bookAddForm(HttpServletRequest req,Model model) {
		
		System.out.println("lib_bookAddForm-도서 추가 양식");
		return "library/lib_bookAddForm";
	}
	
	
	//관리자 : 도서 추가 처리
	@RequestMapping(value="lib_bookAddPro", method=RequestMethod.POST)
	public String lib_bookAddPro(MultipartHttpServletRequest req,Model model) {
		
		System.out.println("lib_bookAddPro-도서 추가");
		
		LIservice.lib_bookAddPro(req, model);
		return "library/lib_bookAddPro";
	}

	
	//관리자 : 도서 수정 양식
	@RequestMapping("lib_bookModiForm")
	public String lib_bookModiForm(HttpServletRequest req,Model model) {
		
		System.out.println("lib_bookModiForm-도서 수정 양식");
		
		LIservice.getBookInfo(req, model);
		return "library/lib_bookModiForm";
	}
	
	//관리자 : 도서 수정 처리
	@RequestMapping(value="lib_bookModiPro", method=RequestMethod.POST)
	public String lib_bookModiPro(MultipartHttpServletRequest req,Model model) {
		
		System.out.println("lib_bookModiPro-도서 수정");
		
		LIservice.lib_bookModiPro(req, model);
		return "library/lib_bookModiPro";
	}
	
	//관리자 : 도서 삭제 처리
	@RequestMapping("lib_bookDelPro")
	public String lib_bookDelPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookDelPro-도서 삭제");
		
		LIservice.lib_bookDelPro(req, model);
		return "library/lib_bookDelPro";
	}
	
	
	//관리자 : 도서 대여/반납 
	@RequestMapping("lib_bookLoanForm")
	public String lib_bookLoanForm(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookLoanForm-도서 대여/반납");
		return "library/lib_bookLoanForm";
	}
	
	//관리자 : 도서 대여 처리
	@RequestMapping("lib_bookLoanPro")
	public String lib_bookLoanPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookLoanPro-도서 대여");

		LIservice.lib_bookLoanPro(req, model);
		return "library/lib_bookLoanPro";
	}
	
	
	//관리자 : 도서 반납 처리
	@RequestMapping("lib_bookReturnPro")
	public String lib_bookReturnPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookReturnPro-도서 반납");

		LIservice.lib_bookReturnPro(req, model);
		return "library/lib_bookReturnPro";
	}
	
	
	//관리자 : 대여 연장 처리
	@RequestMapping("lib_bookRenewPro")
	public String lib_bookRenewPro(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookRenewPro-대여 연장");

		LIservice.lib_bookRenewPro(req, model);
		return "library/lib_bookRenewPro";
	}
	
	
	
	
	
	//도서 관리 페이지
	@RequestMapping("lib_supervise")
	public String lib_supervise(HttpServletRequest req, Model model) {
		
		System.out.println("lib_supervise-도서 관리 페이지");
		LIservice.lib_bookLoanlist(req,model);
		return "library/lib_supervise";
	}
	//도서 관리 페이지 - 대여 현황
	@RequestMapping("lib_bookLoanlist")
	public String lib_bookLoanlist(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookLoanlist-대여 현황");
		LIservice.lib_bookLoanlist(req,model);
		return "library/lib_bookLoanlist";
	}
	//도서 관리 페이지 - 반납 현황
	@RequestMapping("lib_bookReturnlist")
	public String lib_bookReturnlist(HttpServletRequest req, Model model) {
		
		System.out.println("lib_returnlist-반납 현황");
		return "library/lib_returnlist";
	}
	//도서 관리 페이지 - 반납 예정 현황
	@RequestMapping("lib_bookRtPrearrangelist")
	public String lib_bookRtPrearrangelist(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookRtPrearrangelist-반납 예정 현황");
		return "library/lib_bookRtPrearrangelist";
	}
	//도서 관리 페이지 - 예약 현황
	@RequestMapping("lib_bookReserlist")
	public String lib_bookReserlist(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookReserlist-예약 현황");
		return "library/lib_bookReserlist";
	}
	//도서 관리 페이지 - 대여
	@RequestMapping("lib_bookLoanform")
	public String lib_bookLoanform(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookLoanform-예약 현황");
		return "library/lib_bookLoanform";
	}
	//도서 관리 페이지 - 반납
	@RequestMapping("lib_bookReturnform")
	public String lib_bookReturnform(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookReturnform-예약 현황");
		return "library/lib_bookReturnform";
	}
	//도서 관리 페이지 - 연장
	@RequestMapping("lib_bookRenewform")
	public String lib_bookRenewform(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookRenewform-예약 현황");
		return "library/lib_bookRenewform";
	}
		
	
	
	
	
	//도서 신청 양식
	@RequestMapping("lib_submission")
	public String lib_submission(HttpServletRequest req, Model model) {
		
		System.out.println("lib_submission-도서 신청 양식");
		return "library/lib_submission";
	}
	
	
	
	//도서관 안내 페이지
	@RequestMapping("lib_summary")
	public String lib_summary(HttpServletRequest req, Model model) {
		
		System.out.println("lib_summary-도서관 안내");
		return "library/lib_summary";
	}
	
	//도서관 현황(소개)
	@RequestMapping("lib_situation")
	public String lib_situation(HttpServletRequest req, Model model) {
		
		System.out.println("lib_situation-도서관 현황(소개)");
		return "library/lib_situation";
	}
	
	//도서관 위치
	@RequestMapping("lib_map")
	public String lib_map(HttpServletRequest req, Model model) {
		
		System.out.println("lib_situation-도서관 위치");
		return "library/lib_map";
	}

	
	//공통 : 도서 검색 폼
	@RequestMapping("lib_bookSearch")
	public String lib_bookSearch(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSearch-도서검색");
		LIservice.getBooklist(req,model);
		return "library/lib_bookSearch";
	}
	
	
	//공통 : 도서 검색 결과 (ajax)
	@RequestMapping("lib_bookSearchResult")
	public String lib_bookSearchResult(HttpServletRequest req, Model model) {
		
		System.out.println("lib_bookSearchResult-도서검색결과");
		
		LIservice.lib_bookSearchResult(req, model);
		return "library/lib_bookSearchResult";
	}
	
	
	
	

	//test
	@RequestMapping("qrcode")
	public String qrcode(HttpServletRequest req, Model model) {
		
		System.out.println("qrcode");
		return "library/qr/qrcodetest";
	}
	
	
	@RequestMapping("barcode")
	public String barcode(HttpServletRequest req, Model model) {
		
		System.out.println("barcode");
		return "library/barcode/barcodetest1";
	}
	
	
	
	
	
	
	
	


	//도서 좌석 현황
	@RequestMapping("lib_seat")
	public String lib_seat(HttpServletRequest req, Model model) {
		System.out.println("lib_viewSeat-좌석 현황 및 예약");			
		return "library/lib_seat";
	}
	@RequestMapping("lib_seat_sub")
	public String lib_seat_sub(HttpServletRequest req, Model model) {
		
		System.out.println("lib_viewSeat-좌석 현황 및 예약");	
		LIservice.lib_viewSeat(req, model);
		
		return "library/lib_seat_sub";
	}
		
	
	//도서 좌석 업데이트
	@RequestMapping("lib_seat_update")
	public String lib_seat_update(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat_update-좌석 업데이트");	
		LIservice.lib_seat_update(req,model);
		LIservice.lib_viewSeat(req, model);
		return "library/lib_seat_sub";
	}
	
	
	
/*	//관리자 : 이용자를 위한 좌석 업데이트 폼
	@RequestMapping("lib_seat_info")
	public String lib_seat_info(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat_info-좌석 업데이트 양식");	
		
		return "library/lib_seat_info";
	}*/
	
	
	//실시간 검색기능
	@RequestMapping("searchTest")
	public String searchTest() {
		System.out.println("searchTest");
		return "library/searchTest";
	}	
	//검색 결과
	@RequestMapping("searchResult")
	public String searchResult(HttpServletRequest req, Model model) {
		System.out.println("searchResult");
						
		LIservice.searchtest(req, model);
		
		return "library/searchResult";
	}
	
}
