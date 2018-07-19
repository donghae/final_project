package com.spring.projectFinal.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LIController {

	//도서관 컨트롤러
	
	//도서관 홈
	@RequestMapping("lib_home")
	public String library(HttpServletRequest req,Model model) {
		
		System.out.println("library-도서관 홈");
		return "library/lib_home";
	}
	
	//도서 검색 및 조회
	@RequestMapping("lib_search")
	public String lib_search(HttpServletRequest req, Model model) {
		
		System.out.println("lib_search-도서검색");
		return "library/lib_search";
	}
	
	//도서 예약 현황
	@RequestMapping("lib_reservation")
	public String lib_reservation(HttpServletRequest req, Model model) {
		
		System.out.println("lib_reservation-도서 예약 현황");
		return "library/lib_reservation";
	}
	
	//도서 예약 현황
	@RequestMapping("lib_rental")
	public String lib_rental(HttpServletRequest req, Model model) {
		
		System.out.println("lib_rental-도서 대출 현황");
		return "library/lib_rental";
	}
	
	//도서 예약 현황
	@RequestMapping("lib_submission")
	public String lib_submission(HttpServletRequest req, Model model) {
		
		System.out.println("lib_submission-도서 신청 양식");
		return "library/lib_submission";
	}
	
	//도서 예약 현황
	@RequestMapping("lib_seat")
	public String lib_seat(HttpServletRequest req, Model model) {
		
		System.out.println("lib_seat-좌석 현황 및 예약");
		return "library/lib_seat";
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

}
