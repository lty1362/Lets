package com.kh.ee.user.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.service.ReviewService;
import com.kh.ee.user.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService revService;
	
	//후기 더보기 플러스 버튼 클릭시 적용
	@RequestMapping("showMore.rev")
	public String showMore(int lessonNo, Model model) {
		Lesson l = revService.selectNumber(lessonNo);
		
		System.out.println("l:" + l.getLessonNo());
		
		model.addAttribute("l",l);
		
		return "user/lesson/reviewDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="showMoreReview.rev", produces="application/json; charset=utf-8")
	public String selectReviewList(int lessonNo) {
		ArrayList<Review> list = revService.selectReviewList(lessonNo); 
				
		return new Gson().toJson(list); 
	}
	
	@ResponseBody
	@RequestMapping("insertReview.rev")
	public String insertReview(Review r) {
		int result = revService.insertReview(r);
		
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("insertReplyReview.rev")
		public String insertReplyReview(Reply re){
		
		int result = revService.insertReplyReview(re);
		
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateReview.rev")
	public String updateReview(Review r) {
		int result = revService.updateReview(r);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateReviewReply.rev")
	public String updateReviewReply(Reply re) {
		int result = revService.updateReviewReply(re);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping("deleteReview.rev")
	public String deleteReview(int reviewNo) {
		int result = revService.deleteReview(reviewNo);
		
		if(result>0) {
			return "success";
		} else {
			return "fail"; 
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteReviewReply.rev")
	public String deleteReviewReply(int reviewNo) {
		int result = revService.deleteReviewReply(reviewNo);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
}
