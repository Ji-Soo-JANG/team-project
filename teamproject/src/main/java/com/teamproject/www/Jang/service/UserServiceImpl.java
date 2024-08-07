package com.teamproject.www.Jang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.www.Jang.domain.UserVo;
import com.teamproject.www.Jang.mapper.UserMapper;

@Service("JangUserService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean signUp(UserVo vo) {
		int count = userMapper.join(vo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public UserVo login(String u_id, String upw) {
		UserVo loginVo = userMapper.login(u_id, upw);
		return loginVo;
	}

}
