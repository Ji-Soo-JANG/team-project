package com.teamproject.www.Lee.domain.board;

import java.util.List;

import com.teamproject.www.Lee.domain.AttachFileDto;

import lombok.Data;

@Data
public class BoardUpdateDto {
	private int boardno;
	private String title;
	private String content;
	private List<AttachFileDto> pathList;
}
