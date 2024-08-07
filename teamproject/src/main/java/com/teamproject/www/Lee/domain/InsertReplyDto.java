package com.teamproject.www.Lee.domain;

import lombok.Data;

@Data
public class InsertReplyDto {
	private Integer b_f_no;
	private Integer b_f_r_no;
	private String reply;
	private String replyer;
//	private boolean isReply; 
//	
//	public void setIsReply(boolean isReply) {
//		this.isReply = isReply;
//	}
//	
//	public boolean getIsReply() {
//		return this.isReply;
//	}
}
