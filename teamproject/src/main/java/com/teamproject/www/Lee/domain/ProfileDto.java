package com.teamproject.www.Lee.domain;

import lombok.Data;

@Data
public class ProfileDto {
	private String u_id;
	private String u_nickname;
	private String u_email;
	private Integer u_point;
	private String u_level;
	private String u_imgurl;
}
