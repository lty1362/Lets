package com.kh.ee.user.curriculum.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.curriculum.model.service.CurriculumService;
import com.kh.ee.user.curriculum.model.vo.MemVideo;
import com.kh.ee.user.curriculum.model.vo.QnA;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.member.model.vo.Member;

@Controller
public class CurriculumController {

	@Autowired
	private CurriculumService curService;
	
	@RequestMapping("detailCurri.cr")
	public String detailCurriculum(Lesson l, HttpSession session, Model model) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int lessonNo = l.getLessonNo();
		
		// lesson 객체, curriculum arrayList, qna 객체, mem_video arrayList, review 평균 별점 계산해서 가져오기
				
		return "user/curriculum/detailCurriculum";
	}
	
	@RequestMapping("lessonInfo.cr")
	public String detailLessonInfo(Lesson l, Model model) {
		return "user/curriculum/lessonInfo";
	}
	
	@RequestMapping("detailFAQ.cr")
	public String detailFaq(Lesson l, Model model) {
		return "user/curriculum/detailFAQ";
	}
	
	@RequestMapping("detailQNA.cr")
	public String detailQna(Lesson l, Model model) {
		return "user/curriculum/detailQNA";
	}

//	@RequestMapping("")
//	public String insertQuestion(QnA q, HttpSession session) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String updateQuestion(QnA q, HttpSession session) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String deleteQuestion(QnA q) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String insertAnswer(QnA q) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String updateAnswer(QnA q) {
//		return "";
//	}
//	
//	@RequestMapping("")
//	public String deleteAnswer(QnA q) {
//		return "";
//	}
	
	@RequestMapping("videoList.cr")
	public String videoList(Lesson l, Model model) {
		return "user/curriculum/videoList";
	}
	
	@RequestMapping("detailVideo.cr")
	public String detailVideo(MemVideo mv) {
		return "user/curriculum/detailVideo";
	}
	
}
