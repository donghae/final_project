package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.DTVO.Admin_notice_selectVO;
import com.spring.projectFinal.DTVO.Admin_stu_selectVO;
import com.spring.projectFinal.DTVO.Dt_stu_overnight_selectVO;
import com.spring.projectFinal.DTVO.Dt_stu_penalty_selectVO;



public interface DTDAO {

	
	// 관리자 로그인
	public int dtAdminLogin(Map<String, Object> map);
	
	// 관리자 기숙사 학생 수 조회
	public int getDormStInfoCnt();
	
	// 관리자 기숙사 학생 목록
	public ArrayList<Admin_stu_selectVO> getDormStInfoLiDormSt(Map<String, Object> map);
	
	// 관리자 기숙사 학생 등록
	public int addDormStInfo(Map<String, Object> map);
	
	// 관리자 공지사항 게시글 조회
	public int getDormNoticeCnt();
	
	// 관리자 공지사항 목록 가지고 오기
	public ArrayList<Admin_notice_selectVO> getDormNotice(Map<String, Integer> map);
	
	// 관리자 공지사항 조회수 증가
	public int getDormNoticeCntUp(Map<String,Object> map);
	
	// 관리자 공지사항 상세페이지 값 뿌리기
	public Admin_notice_selectVO getDormNoticeDetail(int dorm_n_no);
	
	// 관리자 공지사항 수정 값 뿌리기
	public Admin_notice_selectVO updateDormNotice(int dorm_n_no);
	
	// 관리자 공지사항 수정 처리 update
	public int updateDormNoticeCon(Map<String,Object> map);
	
	// 관리자 공지사항 글 등록 insert
	public int addDormNotice(Admin_notice_selectVO dto);
	
	
	
	
	
	
	
	
	// 학생 외박 조회
	public  ArrayList<Dt_stu_overnight_selectVO> dtStuNightSelect(String st_no);	
	
	// 학생 외박 신청	
	public int dtStuNightInsert(Map<String, Object> map);
	
	// 학생 외박 수정 pwd
	public int dtStuNightpwd(String st_no);
	
	// 학생 외박 수정 정보 뿌리기
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightUpdate(String st_no);
	
	// 학생 외박 정보 수정 처리
	public int dtStuNightrevision(Map<String, Object> map);
	
	// 학생 외박 신청 삭제 pwd
	public ArrayList<Dt_stu_overnight_selectVO> dtStuNightDeletePwd(String st_no);
	
	// 학생 외박 삭제 처리
	public int dtStuNightDeletelist(Map<String, Object> map);

	// 학생 벌점 조회
	public ArrayList<Dt_stu_penalty_selectVO> dtStuPenalty(String st_no);
	
}


