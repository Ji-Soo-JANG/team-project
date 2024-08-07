package com.teamproject.www.Lee.controller.board;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Lee/board/announce/*")
public class AnnounceController {
//	@Autowired
//	private BoardService boardService;
	
	//공지사항
	@GetMapping("/announce")
	public void announce() {
		System.out.println("공지");
	}
	//가입인사
	@GetMapping("/greeting")
	public void reeting() {
		System.out.println("가입인사");
	}
	//출석체크
	@GetMapping("/check")
	public void check() {
		System.out.println("공지");
	}
}
