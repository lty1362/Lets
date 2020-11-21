package com.kh.ee.user.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {

	private String memId;
	private String memPwd;
	private String memName;
	private String nickname;
	private String birthday;
	private String gender;
	private String address;
	private String phone;
	private String memPic;
	private Date enrollDate;
	private Date modifyDate;
	private int reportCount;
	private Date outDate;
	private String status; 
}