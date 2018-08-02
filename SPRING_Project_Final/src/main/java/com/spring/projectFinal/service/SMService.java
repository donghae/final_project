package com.spring.projectFinal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface SMService {

	public int juminChk(HttpServletRequest req, Model model);

	public void appPro(MultipartHttpServletRequest req, Model model);

	// 2.지원자 목록
	public void applyList(HttpServletRequest req, Model model);

	// 2.지원 합격자 목록
	public void applyPassList(HttpServletRequest req, Model model);

	// 2.승인하기버튼-관리자
	public void recognize(HttpServletRequest req, Model model);

	// 2.추가 합격자 관리
	public void applyExtraList(HttpServletRequest req, Model model);

	// 3.강의관리-전체강의리스트
	public void lectureList(HttpServletRequest req, Model model);

	// 3.강의관리-전체강의리스트 - 강의 수정
	public void lectureModi(HttpServletRequest req, Model model);

	// 3.강의관리-강의 추가
	public void lecturePlus(HttpServletRequest req, Model model);

	// 3.강의관리-강의 추가-교수검색
	public void searchProf(HttpServletRequest req, Model model);

	// 3.강의관리 - 강의 수정
	public void lectureModiPro(HttpServletRequest req, Model model);

	// 3.강의관리 - 강의 삭제
	public void deletePro(HttpServletRequest req, Model model);

	// 4.학적 관리 > 기본 학적
	public void st_profile(HttpServletRequest req, Model model);

	// 4.학적 관리 > 기본 학적 - 정보수정 처리
	public void st_profileModiPro(HttpServletRequest req, Model model);

	// 5.수업관리 > 내 강의실
	public void st_timetable(HttpServletRequest req, Model model);

	// 6.성적관리 > 금학기 성적조회
	public void st_gpaList(HttpServletRequest req, Model model);

	// 합격자 조회
	public void passChkPro(HttpServletRequest req, Model model);

	// 수업관리 > 내 강의실 > 내 강의 목록
	public void st_lectureList(HttpServletRequest req, Model model);

	// 수업관리 > 내 강의실 > 강의 목록 > 출결 현황
	public void st_attendList(HttpServletRequest req, Model model);

	// 장학금 관리 > 장학금 신청
	public void st_scholarAppli(HttpServletRequest req, Model model);
}
