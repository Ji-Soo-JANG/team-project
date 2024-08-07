package com.teamproject.www.Lee.domain.user;

import lombok.Data;

@Data
public class ProfileDto {
	private String userid;
	private String nickname;
	private String email;
	private String lv;
	private Integer point;
	private String thumbnail;
}
