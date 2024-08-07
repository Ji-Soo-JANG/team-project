package com.teamproject.www.Lee.domain;



import java.util.Date;

import lombok.Data;

@Data
public class ReplyListDto {
	private Integer b_f_no;
	private Integer b_f_r_no;
	private String reply;
	private String replyer;
	private Integer good;
	private Date replydate;
	private Date updatedate;
	private Integer rereply_no;
	private Integer reply_level;
}
