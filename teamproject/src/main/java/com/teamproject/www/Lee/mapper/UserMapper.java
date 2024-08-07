package com.teamproject.www.Lee.mapper;

import java.util.Map;

import com.teamproject.www.Lee.domain.LoginDto;
import com.teamproject.www.Lee.domain.ProfileDto;
import com.teamproject.www.Lee.domain.UserVo;

public interface UserMapper {
	//회원가입
	public int join(UserVo vo);
	
	//가입 체크
	public int CheckUser(Map<String, String> map);
	
	//로그인 Dto 가져오기
	public LoginDto getLoginDto(String u_id);
	
	//아이디 이메일로 가져오기
	public String getIdByEmail(String u_email);
	
	//이메일 가져오기
	public String getEmailById(String u_id);
	
	//update pw
	public int updatePw(Map<String, String> map);
	
	//프로필 정보 가져오기
	public ProfileDto getProfileDto(String u_id);
}
