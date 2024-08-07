package com.teamproject.www.Lee.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private String keyword;
	private String type;
	
	public Criteria() {
		this(1, 20);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		if (type != null) {
			String[] strs = type.split("");
			return strs;
		}
		return null;
	}
}
