package com.teamproject.www.Kim.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InformationReplyVo {
	private Long replyNo;
	private Long boardNo;
	private String comments;
	private String replyer;
	private Long likes;
	private Date updateDate;
	
	
	//private Date replyDate;
}