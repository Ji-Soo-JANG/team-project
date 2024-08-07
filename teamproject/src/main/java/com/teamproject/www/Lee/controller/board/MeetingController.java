package com.teamproject.www.Lee.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Lee/board/meeting/*")
//@Qualifier("LeeBoardService")
public class MeetingController {
	@Autowired

	//**모임**
	//정모공지
	@GetMapping("/regular")
	public void regularmeetingBoard() {
	}
	//벙캠/동행
	@GetMapping("/thunder")
	public void thundermeetingBoard() {
	}
	//모임후기
	@GetMapping("/review")
	public void meetingreviewsBoard() {
	}
}
