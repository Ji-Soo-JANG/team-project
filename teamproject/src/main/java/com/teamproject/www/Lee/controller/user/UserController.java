package com.teamproject.www.Lee.controller.user;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamproject.www.Lee.domain.LoginDto;
import com.teamproject.www.Lee.domain.ProfileDto;
import com.teamproject.www.Lee.domain.UserVo;
import com.teamproject.www.Lee.service.UserService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller("leeUserController")
@RequestMapping("/Lee/user/*")
@Qualifier("LeeUserService")
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//**로그인 페이지 이동**
	@GetMapping("/login")
	public void login(HttpServletRequest req, HttpSession session) {
		System.out.println("로그인페이지");
		String curLocation = req.getHeader("referer");
		System.out.println("현재페이지 : " + curLocation);
		session.setAttribute("curLocation", curLocation);
	}
		
	// 로그인 시 가입유무 체크
	@ResponseBody
	@PostMapping("/checkUser")
	public boolean checkUser(@RequestParam("u_id") String u_id, @RequestParam("u_pw") String u_pw ) {
		log.info("checkUser..................................");
//		log.info("u_id : " + u_id);
//		log.info("u_id : " + u_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
//		log.info("map : " + map);
		boolean result = userService.CheckUser(map);
		return result;
	}
		
	// 로그인 처리
	@PostMapping("/loginRun")
	public void loginRun(@RequestParam("u_id") String u_id , Model model, HttpServletRequest req, HttpSession session) throws Exception{
		log.info("loginRun.................................");

		LoginDto logindto = userService.getLoginDto(u_id);
			
		log.info("logindto : " + logindto);
		if(logindto != null) {
			model.addAttribute("login", logindto);
		}
	}
		
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req) {
		session.invalidate();
		String uri = req.getHeader("Referer");
		
		return "redirect:"+uri;
	}
	
	//**프로필 정보 변경
	
	//프로필변경
	//닉네임 변경
	//이메일 변경
	
	//비밀번호 변경
	@PostMapping("/updatePassword")
	public String updatePassword(@RequestParam("u_id") String u_id, @RequestParam("u_pw") String u_pw, RedirectAttributes rttr) {
		log.info("updatePassword...........................");
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		boolean result = userService.updatePw(map);
		log.info("result : " + result);
		String resultStr = "";
		if(result == true) {
			resultStr = "success";
		}else {
			resultStr = "fail";
		}
		rttr.addAttribute("resultUpdatePw", resultStr);
		return "redirect:/user/profile";
	}
	
	
	//*** 회원 가입및 아이디 비밀번호 찾기
	//join
	//회원가입페이지
	@GetMapping("/join")
	public void join() {}
	
	//회원가입처리
	@PostMapping("/joinrun")
	public String joinRun(UserVo vo) {
		boolean result = userService.signUp(vo);
		System.out.println("joinrun.. result : " + result);
		return "redirect:/user/login";
	}
	
	//이메일 본인인증
	@ResponseBody
	@PostMapping("/checkEmail")
	public String checkEmail(String u_email) {
		log.info("checkEmail......................................");
		String uuid = UUID.randomUUID().toString();
		String certi = uuid.substring(0, uuid.indexOf("-"));
		log.info("uuid : " + uuid);
		log.info("certi : " + certi);
		log.info("u_email : " + u_email);
		
		MimeMessagePreparator prepare = new MimeMessagePreparator() {
				
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
				helper.setFrom("asraisin@gmail.com");
				helper.setTo(u_email);
				helper.setSubject("인증번호 안내");
				helper.setText("인증번호 : ", certi);
			}
		};
			
		mailSender.send(prepare);

		
		return certi;
	}
	
	//**아이디찾기
	//페이지이동
	@GetMapping("/forgot-id")
	public void forgotId() {}
	
	//아이디 이메일로 전송
	@PostMapping("/findId")
	public String findId(String u_email, RedirectAttributes rttr) {
		log.info("findId.............................");
		String userId = userService.getIdByEmail(u_email);
		
		String resultMessage = "fail";
		if(userId!=null) {
			MimeMessagePreparator prepare = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
					helper.setFrom("asraisin@gmail.com");
					helper.setTo(u_email);
					helper.setSubject("아이디 안내");
					helper.setText("아이디 : ", userId);
				}
			};
			
			mailSender.send(prepare);
			resultMessage = "success";
		}
		
		rttr.addAttribute("resultFindId", resultMessage);
		
		return "redirect:/user/login";
	}
	
	//**비밀번호찾기
	//페이지이동
	@GetMapping("/forgot-password")
	public void forgotPassword() {}
	
	//비밀번호 초기화
	@PostMapping("/resetPassword")
	public String resetPassword(String u_id, RedirectAttributes rttr) {
		log.info("resetPassword.........................");
		String userEmail = userService.getEmailById(u_id);
		String newPw = userService.resetPw(u_id);
		
		String resultMessage = "fail";
		if(newPw!=null) {
			MimeMessagePreparator prepare = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
					helper.setFrom("asraisin@gmail.com");
					helper.setTo(userEmail);
					helper.setSubject("비밀번호 변경안내");
					helper.setText("변경된 비밀번호 : ", newPw);
				}
			};
			
			mailSender.send(prepare);
			resultMessage = "success";
		}
		
		rttr.addAttribute("resultResetPw", resultMessage);
		return "redirect:/user/login";
	}
	
	//프로필 페이지
	@GetMapping("/profile")
	public void profile() {}
	
	@GetMapping("/profile/{u_id}")
	public String profile(@PathVariable("u_id") String u_id, HttpSession session) {	
		log.info("profile...............................");
		log.info("u_id : " + u_id);
		ProfileDto profileDto = userService.getProfile(u_id);
		session.setAttribute("profile", profileDto);

		return "redirect:/user/profile";
	}
	
}
