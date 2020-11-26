package com.kh.ee.user.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.pagination;
import com.kh.ee.user.notice.model.service.NoticeService;
import com.kh.ee.user.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("tutorNotice.no")
	public String tutorSelectNoticeList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Notice n, Model model) {
		
		int listCount = nService.tutorSelectNoticeListCount(n);
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 8, 4);
		
		ArrayList<Notice> noticeList = nService.tutorSelectNoticeList(n, pi);
		
		model.addAttribute("noticeList", noticeList);
		
		return "user/notice/tutorNoticeList";
	}
	
	@RequestMapping("tutorDetailNotice.no")
	public String tutorDetailNotice(Notice n, Model model) {
		return "user/notice/tutorDetailNotice";
	}
}
