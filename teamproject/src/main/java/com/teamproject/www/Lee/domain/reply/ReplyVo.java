package com.teamproject.www.Lee.domain.reply;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVo {
	private Integer b_f_r_no;
	private Integer b_f_no;
	private String reply;
	private String replyer;
	private Integer good;
	private Date replydate;
	private Date updatedate;
}
