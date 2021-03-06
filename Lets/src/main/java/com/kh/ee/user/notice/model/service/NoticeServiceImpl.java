package com.kh.ee.user.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.notice.model.dao.NoticeDao;
import com.kh.ee.user.notice.model.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public ArrayList<Notice> selectNoticeList(Notice n) {
		return nDao.selectNoticeList(ss, n);
	}

	@Override
	public int tutorSelectNoticeListCount(Notice n) {
		return nDao.tutorSelectNoticeListCount(ss, n);
	}

	@Override
	public ArrayList<Notice> tutorSelectNoticeList(Notice n, PageInfo pi) {
		return nDao.tutorSelectNoticeList(ss, n, pi);
	}

	@Override
	public Notice tutorDetailNotice(Notice n) {
		return nDao.tutorDetailNotice(ss, n);
	}

	@Override
	public int increaseCount(Notice n) {
		return nDao.increaseCount(ss, n);
	}

}
