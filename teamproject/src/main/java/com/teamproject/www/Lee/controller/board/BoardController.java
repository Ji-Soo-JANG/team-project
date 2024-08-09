package com.teamproject.www.Lee.controller.board;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.www.Lee.domain.BoardLikeDto;
import com.teamproject.www.Lee.domain.PageDto;
import com.teamproject.www.Lee.domain.board.BoardDetailDto;
import com.teamproject.www.Lee.domain.board.BoardListDto;
import com.teamproject.www.Lee.domain.board.BoardTypeVo;
import com.teamproject.www.Lee.domain.board.Criteria;
import com.teamproject.www.Lee.domain.board.BoardUpdateDto;
import com.teamproject.www.Lee.domain.board.BoardInsertDto;
import com.teamproject.www.Lee.service.board.BoardService;
import com.teamproject.www.Lee.service.board.BoardTypeService;

import lombok.extern.log4j.Log4j;



@Controller
@RequestMapping("/Lee/board/*")
@Log4j
@Qualifier("LeeBoardService")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardTypeService boardTypeService;
	
	//**게시판
	@GetMapping("/list/{bt}")
	public String listBoardType(@PathVariable("bt") String bt, Model model, Criteria criteria,HttpSession session) {
		log.info("listBoardType................");
		log.info("criteria : " + criteria);
//		log.info("boardtype : " + boardtype);
		List<BoardListDto> list = boardService.getList(criteria, bt);
		
		// 보드 타입정보 세션 추가
		int boardtypeno = boardTypeService.getBoardTypeNo(bt);
		BoardTypeVo vo = new BoardTypeVo();
		vo.setBoardtypeno(boardtypeno);
		vo.setBoardtype(bt);
//		criteria.setBoardtype(btno);
		session.setAttribute("boardtype", vo);
		log.info(session.getAttribute("boardtype"));
		log.info("criteria : " + criteria);
		int allCount = boardService.getAllCount(criteria);
		PageDto pageMaker = new PageDto(criteria, allCount);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		log.info("criteria : " + criteria);
		log.info("list : " + list);
		log.info("boardtype : " + vo);
		return "Lee/board/list";
	}
	
	//**글쓰기**
	//글쓰기
	@GetMapping("/write")
	public void write() {
	};
	
	
	//글쓰기 처리
	@PostMapping("/writeRun")
	public String writeRun(BoardInsertDto dto) {
		log.info("writeRun....................................");
		log.info("dto : " + dto);
		int boardno = boardService.registerBoard(dto);
		return "redirect:/Lee/board/detail?boardno="+boardno;
//		return "redirect:/";
	}
	//상세페이지
	@GetMapping("/detail")
	public void detail(Model model, int boardno , Criteria criteria) {
		log.info("controller, detail...................................");
		
		log.info("getDetail 전");
		BoardDetailDto dto = boardService.getDetail(boardno);
		log.info("getDetail 후");
		log.info("dto : " + dto);
		BoardTypeVo vo = new BoardTypeVo();
		vo.setBoardtypeno(dto.getBoardtypeno());
		vo.setBoardtype(dto.getBoardtype());
	
		log.info("criteria : " + criteria);
//		String boardType = boardTypeService.getBoardType(criteria.getBoardtypeno());
//		criteria.setBoardtype(boardType);
		model.addAttribute("dto", dto);
		model.addAttribute("criteria", criteria);
		model.addAttribute("boardno", boardno);
		log.info("pluseViews 전");
		boardService.plusViews(boardno);
		log.info("pluseViews 후");
	}
	
	//글삭제
	@PostMapping("/deleteRun")
	public String delete(int boardno, Criteria criteria, Model model, HttpSession session) {
		System.out.println("deleteRun..................");
		System.out.println("criteria : " + criteria);
//		attr.addAttribute("pageNum", criteria.getPageNum());
//		attr.addAttribute("amount", criteria.getAmount());
//		attr.addAttribute("type", criteria.getType());
//		attr.addAttribute("keyword", criteria.getKeyword());
		log.info("boardno : " + boardno);
		BoardTypeVo vo = (BoardTypeVo)session.getAttribute("boardtype");
		String boardtype = vo.getBoardtype();
		model.addAttribute("criteria", criteria);
		boolean result = boardService.delete(boardno);
		System.out.println("del, result : " + result);
		return "redirect:/Lee/board/list/" + boardtype;
	}
	//글 수정
	@PostMapping("/updateRun")
	public String delete(BoardUpdateDto dto, Criteria criteria, Model model) {
		System.out.println("updateRun ................................... ");
		System.out.println("업데이트 dto : " + dto);
		System.out.println("criteria : " + criteria);
//		attr.addAttribute("pageNum", criteria.getPageNum());
//		attr.addAttribute("amount", criteria.getAmount());
//		attr.addAttribute("type", criteria.getType());
//		attr.addAttribute("keyword", criteria.getKeyword());
//		BoardTypeVo vo = (BoardTypeVo)session.getAttribute("boardtype");
//		String boardtype = vo.getBoardtype();
		model.addAttribute("criteria", criteria);
		boolean result = boardService.update(dto);
		System.out.println("update, result : " + result);
		int boardno = dto.getBoardno();
		return "redirect:/Lee/board/detail?boardno="+boardno;
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

	
//	//정보공유
//	@GetMapping("/information")
//	public void informationBoard() {
//	}
//	//리뷰
//	@GetMapping("/review")
//	public void reviewsBoard() {
//	}
//	//질문게시판
//	@GetMapping("/qna")
//	public void questionBoard() {
//	}
//	
//	//멀티파트 테스트
//	@GetMapping("/test")
//	public void uploadAjax() {
//	}
	

}
