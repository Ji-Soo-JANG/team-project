package com.teamproject.www.Jang.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVo {
	private Long bno;
	private String title;
	private String content;
	private int writer;
	private Long btype;
	private Date regdate;
	private Date updatedate;
	private int views;
}
