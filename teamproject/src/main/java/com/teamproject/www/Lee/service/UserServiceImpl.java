package com.teamproject.www.Lee.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.www.Lee.domain.user.LoginDto;
import com.teamproject.www.Lee.domain.user.ProfileDto;
import com.teamproject.www.Lee.domain.user.UserVo;
import com.teamproject.www.Lee.mapper.UserMapper;

@Service("LeeUserService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	//회원가입
	@Override
	public boolean signUp(UserVo vo) {
		int count = userMapper.join(vo);
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
	public String resetPw(String u_id) {
		System.out.println("resetPw......................");
		String uuid = UUID.randomUUID().toString();
		String newPw = uuid.substring(0, uuid.indexOf("-"));
		System.out.println("newPw : " + newPw);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", newPw);
		int result = userMapper.updatePw(map);
		
		return (result == 1) ? newPw : null;
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
