package com.teamproject.www.Lee.mapper.user;

import java.util.Map;

import com.teamproject.www.Lee.domain.user.JoinDto;
import com.teamproject.www.Lee.domain.user.LoginDto;
import com.teamproject.www.Lee.domain.user.ProfileDto;

public interface UserMapper {
	//회원가입
	public int join(JoinDto dto);
	
	//가입 체크
	public int CheckUser(Map<String, String> map);
	
	//로그인 Dto 가져오기
	public LoginDto getLoginDto(String userid);
	
	//아이디 이메일로 가져오기
	public String getIdByEmail(String email);
	
	//이메일 가져오기
	public String getEmailById(String userid);
	
	//update pw
	public int updatePw(Map<String, String> map);
	
	//프로필 정보 가져오기
	public ProfileDto getProfileDto(String userid);
}
