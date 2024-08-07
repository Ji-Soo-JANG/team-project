package com.teamproject.www.Kim.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InformationReplyVo {
	private Long b_i_r_no;
	private Long b_i_no;
	private String reply;
	private String replyer;
	private Long good;
	private Date replydate;
	private Date updatedate;
}