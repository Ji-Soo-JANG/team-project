package com.teamproject.www.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamproject.www.Jang.domain.UserVo;
import com.teamproject.www.Jang.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	@Autowired
	private UserMapper userMapper;
	
	//instance
	@Test
	public void testInstance() {
		log.info(userMapper);
	}
	
	//�쉶�썝媛��엯
	@Test
	public void testJoin() {
	
		//10媛� �뀒�뒪�듃
		int count = 10;
		for(int i=0; i<count; i++) {
			String u_id = "test" + i;
			String upw = "1234";
			String uname = "�솉湲몃룞" + i;
			String nickname = "test-" + i;
			String email = "test"+ i + "@email.com";
			UserVo vo = new UserVo();
			vo.setUserId(u_id);
			vo.setUserPw(upw);
			vo.setNickname(nickname);
			vo.setEmail(email);
			
			int result = userMapper.join(vo);
			log.info(result);
		}
	}
	
	// 濡쒓렇�씤
	@Test
	public void testLogin() {
		String u_id = "system";
		String upw = "1234";
		
		UserVo vo = userMapper.login(u_id, upw);
		log.info(vo);
	}
}
