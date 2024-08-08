package com.teamproject.www.Jang.mapper;

import org.apache.ibatis.annotations.Param;

import com.teamproject.www.Jang.domain.LoginSessionDto;
import com.teamproject.www.Jang.domain.UserVo;

public interface UserMapper {
	//회원가입
	public int join(UserVo vo);
	
	// 로그인
	public LoginSessionDto login(@Param("userId") String userId, @Param("userPw") String userPw);
}
