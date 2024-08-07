package com.teamproject.www.Lee.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Lee/board/market/*")
//@Qualifier("LeeBoardService")
public class MarketController {
	@Autowired

	//**중고장터**
	//삽니다
	@GetMapping("/buy")
	public void buyBoard() {
	}
	//팝니다
	@GetMapping("/sell")
	public void sellBoard() {
	}
}
