package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.LIVO.BookLoanVO;
import com.spring.projectFinal.LIVO.BookVO;
import com.spring.projectFinal.LIVO.SeatVO;

public interface LIDAO {

	//isbn번호가 같은 책의 권수
	public int isbnCheck(Map<String,Object> map);
	
	//도서 추가
	public int bookadd(BookVO bVO);
	
	//도서 개수 
	public int bookcnt(Map<String,Object> map);
	
	//도서 전체 리스트
	public ArrayList<BookVO> booklist(Map<String,Object> map);
	
	//특정 도서 조회
	public BookVO bookinfo(String b_no);
	
	//도서 수정
	public int bookupdate(Map<String,Object> map);
	
	//도서 삭제 
	public int bookdelete(String b_no);
	
	//도서 대여
	public int bookloan(BookLoanVO bloanVO);
	
	//학생 증명
	public int stCertiry(String user_no);
	
	//관리자 증명
	public int adCertiry(String user_no);
	
	//교수 증명
	public int pfCertiry(String user_no);
	
	//도서 대여 개수
	public int bookloanCnt();
	
	//도서 대여 관련 정보 조회
	public ArrayList<BookLoanVO> bookloanlist(Map<String,Object> map);
	
	//도서 대여 한 건 조회
	public BookLoanVO bookloanOne(Map<String,Object> map);
	
	//도서 반납,연장
	public int loanupdate(BookLoanVO bloanVO);
	
	//도서 검색
	public ArrayList<BookVO> booksearch(Map<String,Object> map);


	
	//전체 좌석 보기
	public ArrayList<SeatVO> viewSeat(String rdRoom_no);
	
	//좌석 업데이트
	public int seatupdate(SeatVO sVO);
	
	//중복 유저 확인
	public int seatUserCnt(String user_no);
	
	//한 좌석 정보 보기
	public SeatVO seatOne(Map<String,Object> map);
	
	

}
