package com.teamproject.www.Jang.service;

import com.teamproject.www.Jang.domain.LoginSessionDto;
import com.teamproject.www.Jang.domain.UserVo;

public interface UserService {
	
	//회원가입
	public boolean signUp(UserVo vo); 
	
	// 로그인
	public LoginSessionDto login(String userId, String userPw);

}
