package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DTService {

	// 학생 로그인
	
	 // 학생 외박 조회
	 public void dtStuNightSelect(HttpServletRequest req, Model model);
	
	 // 학생 외박 신청
	 public void dtStuNightInsert(HttpServletRequest req, Model model);
	 
	 // 학생 외박 수정 목록 뿌리기
	 public void dtStuNightpwd(HttpServletRequest req, Model model);
	
	 // 학생 외박 등록
	 public void dtStuNightrevision(HttpServletRequest req, Model model);
	
	// 학생 외박 삭제 목록
	 public void dtStuNightDeletePwd(HttpServletRequest req, Model model);
	
	// 학생 외박 삭제 처리
	 public void dtStuNightDeletelist(HttpServletRequest req, Model model);
	 
	// 학생 벌점 조회
	 public void dtStuPenalty(HttpServletRequest req, Model model);
	 
	 // 학생 공지사항 조회
	 public void dtStuNotice(HttpServletRequest req, Model model);
	 
	 
	 
	 
	 
	 
	 
	 
	 // ara 동아리 목록 뿌리기..
	 public void circleSelect(HttpServletRequest req, Model model);
	 
	 // ara 동아리 수정 목록 클릭
	 public void araCircleBefore(HttpServletRequest req, Model model);
	 
	 // ara 동아리 수정 등록
	 public void araCircleAfter(HttpServletRequest req, Model model);
	 
	 // ara 동아리 목록 삭제
	 public void araCircleDelete(HttpServletRequest req, Model model);
	 
	 
	 
	 
	 // 관리자 로그인
	 public void dormitory_login(HttpServletRequest req, Model model);
	 
	// 관리자 로그인 
	public void dtAdminLogin(HttpServletRequest req, Model model);
	
	// 관리자 기숙사 학생 조회
	public void getDormStInfoLiDormSt(HttpServletRequest req, Model model);
	
	//관리자 기숙사 학생 등록 클릭
	public void addDormStInfo(HttpServletRequest req, Model model);
	
	// 관리자 기숙사 학생 수정
	public void dtAdminStuUpdate(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 조회
	public void getDormNoticeList(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 제목 클릭
	public void getDormNoticeDetail(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 수정
	public void updateDormNotice(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 수정 등록
	public void updateDormNoticeCon(HttpServletRequest req, Model model);
	
	// 관리자 공지사항 글 등록
	public void addDormNotice(HttpServletRequest req, Model model);
	
	// 관리자 벌점 조회 , 관리자 벌점 수정 목록
	public void dtAdminPenaltySel(HttpServletRequest req, Model model);
	
	// 관리자 벌점 부여
	public void addPenaltyInsert(HttpServletRequest req, Model model);
		
	// 관리자 벌점 수정 목록
	public void selectPenalty(HttpServletRequest req, Model model);
	
	// 관리자 벌점 수정 이름 클릭
	public void updatePenalty(HttpServletRequest req, Model model);
	
	/*// 관리자 공지사항 글 수정 
	public void addAdminNoticeModify(HttpServletRequest req, Model model);*/
}
