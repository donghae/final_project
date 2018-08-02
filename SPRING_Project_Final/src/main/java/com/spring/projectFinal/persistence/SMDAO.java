package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spring.projectFinal.SMVO.ApplicationVO;
import com.spring.projectFinal.SMVO.AttendVO;
import com.spring.projectFinal.SMVO.Gpa_Lec_VO;
import com.spring.projectFinal.SMVO.Lec_Prof_VO;
import com.spring.projectFinal.SMVO.LectureVO;
import com.spring.projectFinal.SMVO.ProfessorVO;
import com.spring.projectFinal.SMVO.StudentVO;

public interface SMDAO {

	//주민체크
	public int juminChk(String REGI_NO);

	//입학신청
	public int applyMember(ApplicationVO vo);

	// 지원자 수 구하기
	public int getArticleCnt(int majorNum);

	// 지원자 목록 조회
	public ArrayList<ApplicationVO> getArticleList(Map<String, Object> map);

	// 지원자 합격 수 구하기
	public int getPassArticleCnt(int majorNum);

	// 지원자 합격 목록 조회
	public ArrayList<ApplicationVO> getPassArticleList(Map<String, Object> map);

	// 지원자 합격
	public void recognizePass(int majorNum);

	// 지원자 불합격
	public void recognizeFail(int majorNum);

	// 추가 합격
	public void extraRecognizePass(int majorNum);

	// 지원자 수 구하기
	public int getExtraArticleCnt(int majorNum);

	// 지원자 목록 조회
	public ArrayList<ApplicationVO> getExtraArticleList(Map<String, Object> map);

	// 강의 수 구하기
	public int getLectureCnt(Map<String, Object> map);

	// 강의 리스트 조회
	public ArrayList<Lec_Prof_VO> getLectureList(Map<String, Object> map);

	// 교수 검색 수 구하기
	public int getProfCnt(Map<String, Object> map);

	// 교수 리스트 조회
	public ArrayList<ProfessorVO> getProfList(Map<String, Object> map);

	// 강의 추가
	public int lecturePlus(LectureVO vo);

	// 강의 수정 페이지
	public Lec_Prof_VO LectureModi(int lec_no);

	// 강의 수정 처리 처리 페이지
	public void lectureModiPro(LectureVO vo);

	// 강의 삭제 처리 처리 페이지
	public void lectureDel(int lec_no);

	// 아름
	// 합격자 조회 처리
	public int nmJuminChk(Map<String, Object> map);

	// 합격자 State 가져오기
	public ApplicationVO entStateChk(Map<String, Object> map);

	// 학적 관리 > 기본 학적 상세페이지
	// public StudentVO getStudentInfo(String strId);
	public StudentVO getStudentInfo();

	// 학적 관리 > 기본 학적 상세페이지 - 정보 업데이트 처리
	public int updateStInfo(StudentVO vo);

	// 수업관리 > 내 강의실 - 시간표
	public ArrayList<LectureVO> getLectureInfo(Map<String, Object> map);

	// 수업관리 > 내 강의실 > 내 강의 개수
	public int getMyLecCnt();

	// 수업관리 > 내 강의실 > 내 강의 목록
	public ArrayList<Lec_Prof_VO> getMyLecList(Map<String, Object> map);

	// 수업관리 > 내 강의실 > 강의목록 > 출결 개수
	public List<AttendVO> getAttendLi();

	// 성적관리 > 성적조회 갯수
	public int getGpaThisCnt(String semester);

	// 성적관리 > 금학기 성적 목록 조회
	public ArrayList<Gpa_Lec_VO> getGpaThisList(Map<String, Object> map);

	// 장학금관리 > 장학금 신청
	// public StudentVO getStudentInfo();

}
