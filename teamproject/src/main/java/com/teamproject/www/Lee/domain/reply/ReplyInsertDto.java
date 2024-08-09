package com.teamproject.www.Lee.domain.reply;

import lombok.Data;

@Data
public class ReplyInsertDto {
	private Integer boardno;
	private Integer replyno;
	private String comments;
	private String userid;
	private String nickname;
}
