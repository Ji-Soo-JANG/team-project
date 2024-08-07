package com.teamproject.www.Jang.service;

import org.apache.ibatis.annotations.Param;

import com.teamproject.www.Jang.domain.UserVo;

public interface UserService {
	
	//회원가입
	public boolean signUp(UserVo vo); 
	
	// 로그인
	public UserVo login(String u_id, String upw);

}
