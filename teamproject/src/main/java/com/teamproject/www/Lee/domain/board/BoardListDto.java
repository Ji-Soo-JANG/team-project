package com.teamproject.www.Lee.domain.board;



import java.util.Date;

import lombok.Data;

@Data
public class BoardListDto {
	private Integer boardno;
	private String title;
	private String nickname;
	private Date regdate;
	private Integer likes;
	private Integer views;
	private Integer replycount;
}
