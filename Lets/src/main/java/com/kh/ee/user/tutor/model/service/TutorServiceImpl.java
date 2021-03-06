package com.kh.ee.user.tutor.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.tutor.model.dao.TutorDao;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Service
public class TutorServiceImpl implements TutorService{
	
	@Autowired
	private TutorDao tutorDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertTutorInfo(Tutor t) {
		return tutorDao.insertTutorInfo(sqlSession, t);
	}

	@Override
	public int updateTutorInfo(Tutor t) {
		return tutorDao.updateTutorInfo(sqlSession, t);
	}

	@Override
	public Tutor selectTutor(int memNo) {
		return tutorDao.selectTutor(sqlSession, memNo);
	}

	@Override
	public int getTutorAuth(int memNo) {
		return tutorDao.getTutorAuth(sqlSession, memNo);
	}
	
	
}
