package com.teamproject.www.Lee.service.user;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.www.Lee.domain.user.JoinDto;
import com.teamproject.www.Lee.domain.user.LoginDto;
import com.teamproject.www.Lee.domain.user.ProfileDto;
import com.teamproject.www.Lee.mapper.user.UserMapper;

@Service("LeeUserService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	//회원가입
	@Override
	public boolean signUp(JoinDto dto) {
		int count = userMapper.join(dto);
		if(count>0) {
			return true;
		}
		return false;
	}

	//가입 체크
	@Override
	public boolean CheckUser(Map<String, String> map) {
		int result = userMapper.CheckUser(map);
		if(result > 0) {return true;};
		return false;
	}

	// 로그인 DTO 가져오기
	@Override
	public LoginDto getLoginDto(String u_id) {
		return userMapper.getLoginDto(u_id);
	}

	//아이디 가져오기
	@Override
	public String getIdByEmail(String u_email) {
		System.out.println("service getIdByEmail.................................");
		System.out.println("u_email : " + u_email);
		String userId = userMapper.getIdByEmail(u_email);
		System.out.println("userId : " + userId);
		return userId;
	}
	
	//비밀번호 업데이트
	@Override
	public boolean updatePw(Map<String, String> map) {
		int result = userMapper.updatePw(map);
		if(result > 0) {
			return true;
		}
		return false;
	}
	
	//비밀번호 리셋
	@Override
	public String resetPw(String userid) {
		System.out.println("resetPw......................");
		String uuid = UUID.randomUUID().toString();
		String userpw = uuid.substring(0, uuid.indexOf("-"));
		System.out.println("userpw : " + userpw);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		int result = userMapper.updatePw(map);
		
		return (result == 1) ? userpw : null;
	}

	//이메일가져오기
	@Override
	public String getEmailById(String u_id) {
		return userMapper.getEmailById(u_id);
	}

	//프로필 가져오기
	@Override
	public ProfileDto getProfile(String u_id) {
		return userMapper.getProfileDto(u_id);
	}





}
