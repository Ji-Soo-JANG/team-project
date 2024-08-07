package com.teamproject.www.Lee.controller.board;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamproject.www.Lee.domain.BoardDelDto;
import com.teamproject.www.Lee.domain.BoardLikeDto;
import com.teamproject.www.Lee.domain.Criteria;
import com.teamproject.www.Lee.domain.DetailFreeBoardDto;
import com.teamproject.www.Lee.domain.FreeBoardListDto;
import com.teamproject.www.Lee.domain.InsertFreeBoardDto;
import com.teamproject.www.Lee.domain.PageDto;
import com.teamproject.www.Lee.domain.UpdateDto;
import com.teamproject.www.Lee.service.BoardService;

import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/Lee/board/community/*")
@Log4j
@Qualifier("LeeBoardService")
public class CommunityController {
	@Autowired
	private BoardService boardService;
	
	//**자유게시판
	@GetMapping("/free")
	public void freeboard(Model model, Criteria criteria) {
		List<FreeBoardListDto> list = boardService.getList(criteria);
		int allCount = boardService.getAllCount(criteria);
		PageDto pageMaker = new PageDto(criteria, allCount);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
	}
	//**글쓰기**
	//글쓰기 처리
	@GetMapping("/writeRun")
	public String writeRun(InsertFreeBoardDto dto) {
		log.info("writeRun....................................");
		int b_f_no = boardService.registerFreeBoard(dto);
		return "redirect:/board/community/detail?b_f_no="+b_f_no;
	}
	//상세페이지
	@GetMapping("/detail")
	public void detail(Model model, int b_f_no , Criteria criteria, HttpSession session) {
		log.info("controller, detail...................................");
		
		List<String> pathList = new ArrayList<>();
		pathList.add("null");
		session.setAttribute("pathList", pathList);
		DetailFreeBoardDto dto = boardService.getDetail(b_f_no);
		log.info("dto : " + dto);
		model.addAttribute("dto", dto);
		model.addAttribute("criteria", criteria);
		model.addAttribute("b_f_no", b_f_no);
		
		boardService.plusViews(b_f_no);
	}
	//글삭제
	@PostMapping("/freeDelRun")
	public String delete(BoardDelDto dto, Criteria criteria, RedirectAttributes attr) {
		System.out.println("dto : " + dto);
		System.out.println("criteria : " + criteria);
		attr.addAttribute("pageNum", criteria.getPageNum());
		attr.addAttribute("amount", criteria.getAmount());
		attr.addAttribute("type", criteria.getType());
		attr.addAttribute("keyword", criteria.getKeyword());
		boolean result = boardService.delete(dto);
		System.out.println("del, result : " + result);
		return "redirect:/board/community/free";
	}
	//글 수정
	@PostMapping("/updateRun")
	public String delete(UpdateDto dto, Criteria criteria, RedirectAttributes attr) {
		System.out.println("updateRun ................................... ");
		System.out.println("업데이트 dto : " + dto);
		attr.addAttribute("pageNum", criteria.getPageNum());
		attr.addAttribute("amount", criteria.getAmount());
		attr.addAttribute("type", criteria.getType());
		attr.addAttribute("keyword", criteria.getKeyword());
		boolean result = boardService.update(dto);
		System.out.println("update, result : " + result);
		int b_f_no = dto.getB_f_no();
		return "redirect:/board/community/detail?b_f_no="+b_f_no;
	}
	
	//추천 했는지 확인
	@ResponseBody
	@PostMapping("/checkLike")
	public boolean checkLike(@RequestBody BoardLikeDto dto) {
		log.info("controller........ checkLike..........");
		log.info("controller, checkLike  dto : " + dto);
		return boardService.checkLike(dto);
	}
	
	//추천하기
	@ResponseBody
	@PostMapping("/boardLike")
	public int commend(@RequestBody BoardLikeDto dto) {
		System.out.println("dto" + dto);
		return boardService.commend(dto);
	}

	
	//정보공유
	@GetMapping("/information")
	public void informationBoard() {
	}
	//리뷰
	@GetMapping("/review")
	public void reviewsBoard() {
	}
	//질문게시판
	@GetMapping("/qna")
	public void questionBoard() {
	}
	
	//멀티파트 테스트
	@GetMapping("/test")
	public void uploadAjax() {
	}
	

}
