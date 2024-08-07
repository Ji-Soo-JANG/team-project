package com.teamproject.www.Lee.domain;

import lombok.Data;

@Data
public class UserVo {

	private String u_id;
	private String u_pw;
	private String u_nickname;
	private String u_email;
	
	public UserVo(String u_id, String u_pw, String u_nickname, String u_email) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_nickname = u_nickname;
		this.u_email = u_email;
	}

	public UserVo() {
		super();
	}
	
}
