package com.teamproject.www.Lee.domain.board;


import java.util.List;

import com.teamproject.www.Lee.domain.AttachFileDto;

import lombok.Data;

@Data
public class BoardInsertDto {
	private Integer boardno;
	private String title;
	private String content;
	private String userid;
	private String nickname;
	private List<AttachFileDto> pathList;
}
