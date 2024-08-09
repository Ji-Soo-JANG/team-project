package com.teamproject.www.Lee.domain.reply;



import java.util.Date;

import lombok.Data;

@Data
public class ReplyListDto {
	private Integer boardno;
	private Integer replyno;
	private String comments;
	private String replyer;
	private Integer likes;
	private Date replydate;
	private Date updatedate;
	private Integer parentreplyno;
	private Integer reply_level;
}
