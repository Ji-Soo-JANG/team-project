package com.teamproject.www.Lee.domain;

import java.util.List;

import lombok.Data;

@Data
public class UpdateDto {
	private int b_f_no;
	private String b_f_title;
	private String b_f_content;
	private char b_f_img;
	private List<AttachFileDto> pathList;
}
