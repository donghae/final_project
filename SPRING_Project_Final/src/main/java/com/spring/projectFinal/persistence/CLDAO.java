package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.Map;

import com.spring.projectFinal.CLVO.CyberAttendanceVO;
import com.spring.projectFinal.CLVO.CyberLecNoticeVO;
import com.spring.projectFinal.CLVO.CyberNoticeVO;
import com.spring.projectFinal.CLVO.LectureVO;
import com.spring.projectFinal.CLVO.RoundVO;


public interface CLDAO {
	public int addLecNotice(Map<String, Object> map);
	
	public int getLecNoticeCnt(Map<String, Object> map);
	
	public ArrayList<CyberLecNoticeVO> getLecNoticeList(Map<String, Object> map);
	
	public CyberLecNoticeVO getLecNotice(int cy_lec_n_no);
	//강의하나 공지사항
	
	public int addNotice(Map<String, Object> map);
	
	public int getNoticeCnt();
	
	public ArrayList<CyberNoticeVO> getNoticeList(Map<String, Object> map);
	
	public CyberNoticeVO getNotice(int cy_n_no);
	//전체 공지사항
	
	
	//주차별 강의 개수
	public int getRoundCnt(Map<String, Object> map);
	
	//주차별 강의 목록
	public ArrayList<RoundVO> getRoundList(Map<String, Object> map);
	
	public int getLecCnt();
	
	public ArrayList<LectureVO> getLecList(Map<String, Object> map);
	
	public int getLecPersonCnt(int lec_no);
	
	public int addRound(RoundVO vo);
	
	//출결
	public int checkCyAttendance(CyberAttendanceVO vo);
	
	//출결추가
	public int insertCyAttendance(CyberAttendanceVO vo);
	
	//출결추가
	public int updateCyAttendance(CyberAttendanceVO vo);
	
	//출결 가져오기
	public CyberAttendanceVO getCyAttendance(Map<String, Object> map);
}
