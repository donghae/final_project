package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface LIService {

	//도서 추가
	public void lib_bookAddPro(MultipartHttpServletRequest req, Model model);

	//도서 전체 리스트
	public void getBooklist(HttpServletRequest req,Model model);
	
	//도서 한 권 조회
	public void getBookInfo(HttpServletRequest req,Model model);
	
	//도서 수정 처리
	public void lib_bookModiPro(MultipartHttpServletRequest req, Model model);
	
	//도서 삭제 처리
	public void lib_bookDelPro(HttpServletRequest req,Model model);
	
	//도서 대여 처리
	public void lib_bookLoanPro(HttpServletRequest req,Model model);
	
	//도서 반납 처리
	public void lib_bookReturnPro(HttpServletRequest req,Model model);
	
	//도서 연장 처리
	public void lib_bookRenewPro(HttpServletRequest req,Model model);

	//도서 검색 
	public void lib_bookSearchResult(HttpServletRequest req,Model model);
	
	//도서 검색-예제
	public void searchtest(HttpServletRequest req,Model model);



	//좌석 보기
	public void lib_viewSeat(HttpServletRequest req,Model model);
	
	//좌석 업데이트 
	public void lib_seat_update(HttpServletRequest req,Model model);
}