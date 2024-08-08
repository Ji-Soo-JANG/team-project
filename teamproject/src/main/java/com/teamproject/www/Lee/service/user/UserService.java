package com.teamproject.www.Lee.service.user;

import java.util.Map;

import com.teamproject.www.Lee.domain.user.JoinDto;
import com.teamproject.www.Lee.domain.user.LoginDto;
import com.teamproject.www.Lee.domain.user.ProfileDto;

public interface UserService {
	
	//회원가입
	public boolean signUp(JoinDto dto); 
	
	//가입체크
	public boolean CheckUser(Map<String, String> map);
	
	//로그인 DTO 가져오기
	public LoginDto getLoginDto(String u_id);
	
	//아이디 가져오기
	public String getIdByEmail(String u_email);
	
	//비밀번호 업데이트
	public boolean updatePw(Map<String, String> map);
	
	//비밀번호 리셋
	public String resetPw(String u_id);
	
	//이메일 가져오기
	public String getEmailById(String u_id);
	
	//프로필 가져오기
	public ProfileDto getProfile(String u_id);
}
