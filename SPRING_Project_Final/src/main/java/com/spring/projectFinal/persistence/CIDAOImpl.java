package com.spring.projectFinal.persistence;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.projectFinal.CIVO.MajorVO;



@Repository
public class CIDAOImpl implements DIDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getMajorCnt() {
		// TODO Auto-generated method stub
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		int selectCnt = dao.getMajorCnt();
		
		return selectCnt;
	}

	@Override
	public ArrayList<MajorVO> getMajorList(Map<String, Object> map) {
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		ArrayList<MajorVO> dtos = dao.getMajorList(map);
		
		return dtos;
	}

	@Override
	public MajorVO getMajor(int maj_cd) {
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		MajorVO vo = dao.getMajor(maj_cd);
		
		return vo;
	}

	@Override
	public int modifyMajor(MajorVO vo) {
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		int updateCnt = dao.modifyMajor(vo);
		
		return updateCnt;
	}

	@Override
	public Date getDate() {
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		Date date = dao.getDate();
		
		return date;
	}

	@Override
	public int addMajor(MajorVO vo) {
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		int insertCnt = dao.addMajor(vo);
		
		return insertCnt;
	}

	@Override
	public int deleteMajor(int maj_cd) {
		DIDAO dao = sqlSession.getMapper(DIDAO.class);
		int deleteCnt = dao.deleteMajor(maj_cd);
		
		return deleteCnt;
	}
}
