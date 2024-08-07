package com.teamproject.www.Lee.domain;

import lombok.Data;

@Data
public class LoginDto {
	private String u_id;
	private String u_nickname;
	private String u_level;
	private Integer u_point;
	private boolean checked;
	
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean getChecked() {
		return this.checked;
	}
}
