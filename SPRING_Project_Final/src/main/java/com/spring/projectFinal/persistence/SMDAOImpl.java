package com.spring.projectFinal.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.SMVO.ApplicationVO;
import com.spring.projectFinal.SMVO.AttendVO;
import com.spring.projectFinal.SMVO.Gpa_Lec_VO;
import com.spring.projectFinal.SMVO.Lec_Prof_VO;
import com.spring.projectFinal.SMVO.LectureVO;
import com.spring.projectFinal.SMVO.ProfessorVO;
import com.spring.projectFinal.SMVO.StudentVO;

@Repository
public class SMDAOImpl implements SMDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int juminChk(String REGI_NO) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int chkCnt = dao.juminChk(REGI_NO);
		return chkCnt;
	}

	@Override
	public int applyMember(ApplicationVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int insertCnt = dao.applyMember(vo);
		return insertCnt;
	}

	@Override
	public int getArticleCnt(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getArticleCnt(majorNum);
		return selectCnt;
	}

	@Override
	public ArrayList<ApplicationVO> getArticleList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ApplicationVO> dtos = dao.getArticleList(map);
		return dtos;
	}

	@Override
	public int getPassArticleCnt(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getPassArticleCnt(majorNum);
		return selectCnt;
	}

	@Override
	public ArrayList<ApplicationVO> getPassArticleList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ApplicationVO> dtos = dao.getPassArticleList(map);
		return dtos;
	}

	@Override
	public int getExtraArticleCnt(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getExtraArticleCnt(majorNum);
		return selectCnt;
	}

	@Override
	public ArrayList<ApplicationVO> getExtraArticleList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ApplicationVO> dtos = dao.getExtraArticleList(map);
		return dtos;
	}

	@Override
	public void recognizePass(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.recognizePass(majorNum);
	}

	@Override
	public void recognizeFail(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.recognizeFail(majorNum);
	}

	@Override
	public void extraRecognizePass(int majorNum) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.extraRecognizePass(majorNum);
	}

	// 강의 개수 구하기
	@Override
	public int getLectureCnt(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.getLectureCnt(map);
		return cnt;
	}

	// 강의 목록 조회
	@Override
	public ArrayList<Lec_Prof_VO> getLectureList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<Lec_Prof_VO> dtos = dao.getLectureList(map);
		return dtos;
	}

	// 강의 등록
	@Override
	public int lecturePlus(LectureVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int insertCnt = dao.lecturePlus(vo);
		return insertCnt;
	}

	// 검색된 교수 수 구하기
	@Override
	public int getProfCnt(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int cnt = dao.getProfCnt(map);
		return cnt;
	}

	// 검색된 교수 리스트 조회
	@Override
	public ArrayList<ProfessorVO> getProfList(Map<String, Object> map) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		ArrayList<ProfessorVO> dtos = dao.getProfList(map);
		return dtos;
	}

	// 강의 수정 페이지
	@Override
	public Lec_Prof_VO LectureModi(int lec_no) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		Lec_Prof_VO vo = dao.LectureModi(lec_no);
		return vo;
	}

	// 강의 수정 처리 페이지
	@Override
	public void lectureModiPro(LectureVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.lectureModiPro(vo);
	}

	// 강의 삭제 처리 페이지
	@Override
	public void lectureDel(int lec_no) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dao.lectureDel(lec_no);
	}

	// 아름

	// 합격자 조회 처리
	@Override
	public int nmJuminChk(Map<String, Object> map) {
		int selectCnt = 0;
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int pwdChkCnt = dao.nmJuminChk(map);

		if (pwdChkCnt == 1) {
			selectCnt = 1;
		} else {
			selectCnt = 0;
		}
		return selectCnt;
	}

	// 합격자 State 가져오기
	@Override
	public ApplicationVO entStateChk(Map<String, Object> map) {
		ApplicationVO vo = new ApplicationVO();
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		vo = dao.entStateChk(map);
		return vo;
	}

	// 학적 관리 > 기본 학적 상세페이지
	@Override
	public StudentVO getStudentInfo() {
		StudentVO vo = new StudentVO();
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		vo = dao.getStudentInfo();
		return vo;
	}

	// 학적 관리 > 기본 학적 상세페이지 - 정보 업데이트 처리
	@Override
	public int updateStInfo(StudentVO vo) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int updateCnt = dao.updateStInfo(vo);
		return updateCnt;
	}

	// 수업관리 > 내 강의실 - 시간표
	@Override
	public ArrayList<LectureVO> getLectureInfo(Map<String, Object> map) {
		ArrayList<LectureVO> list = new ArrayList<>();
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		list = dao.getLectureInfo(map);
		return list;
	}

	// 수업관리 > 내 강의실 > 내 강의 개수
	@Override
	public int getMyLecCnt() {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getMyLecCnt();
		return selectCnt;
	}

	// 수업관리 > 내 강의실 > 내 강의 목록
	@Override
	public ArrayList<Lec_Prof_VO> getMyLecList(Map<String, Object> map) {
		ArrayList<Lec_Prof_VO> dtos = null;
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dtos = dao.getMyLecList(map);
		return dtos;
	}

	// 수업관리 > 내 강의실 > 강의목록 > 출결
	@Override
	public List<AttendVO> getAttendLi() {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		List<AttendVO> list = dao.getAttendLi();
		return list;
	}

	// 성적관리 > 성적조회 갯수
	@Override
	public int getGpaThisCnt(String semester) {
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		int selectCnt = dao.getGpaThisCnt(semester);
		return selectCnt;
	}

	// 성적관리 > 금학기 성적 목록 조회
	@Override
	public ArrayList<Gpa_Lec_VO> getGpaThisList(Map<String, Object> map) {
		ArrayList<Gpa_Lec_VO> dtos = null;
		SMDAO dao = sqlSession.getMapper(SMDAO.class);
		dtos = dao.getGpaThisList(map);
		return dtos;
	}
}
