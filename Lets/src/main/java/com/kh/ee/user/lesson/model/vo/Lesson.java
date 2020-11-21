package com.kh.ee.user.lesson.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.CLOB;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Lesson {

	private int lessonNo;
	private int memNo;
	private String lessonForm;
	private String lessonType;
	private int lessonGroup;
	private String lessonCategory;
	private String lessonTitle;
	private String lessonCoverImg;
	private CLOB lessonInstr;
	private int lessonContNo;
	private String lessonPrepare;
	private String lessonTarget;
	private int likeCount;
	private String lessonStatus;
	private int statusHold;
	private String hReason;
	private String rReason;
	private String price;
	private String time;
	private String totalCount;
	private String period;
	private String discStatus;
	private String discountPeriod;
	private String discount;
	private String payTotal;
	private String status;
	
	
}