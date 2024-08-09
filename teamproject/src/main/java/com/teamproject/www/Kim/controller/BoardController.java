package com.teamproject.www.Kim.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamproject.www.Kim.domain.AttachBoardDto;
import com.teamproject.www.Kim.domain.InformationBoardVo;
import com.teamproject.www.Kim.domain.InformationCriteria;
import com.teamproject.www.Kim.domain.InformationPageDto;
import com.teamproject.www.Kim.mapper.AttachMapper;
import com.teamproject.www.Kim.service.BoardService;

@Controller("kimBoardController")
@RequestMapping("/Kim/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
    private AttachMapper attachMapper;

	// 정보공유 게시판 (김세영)
	@GetMapping("/information")
	public void informationBoard(Model model, InformationCriteria criteria,
	        @RequestParam(value = "type", required = false) String type,
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(value = "sort", required = false) String sort
	        /*@RequestParam(value = "category", required = false) String category*/) {
	    if (criteria.getPageNum() == 0) {
	        criteria.setPageNum(1);
	    }
	    if (criteria.getAmount() == 0) {
	        criteria.setAmount(10);
	    }
	    criteria.setType(type);
	    criteria.setKeyword(keyword);
	    criteria.setSort(sort);
//	    criteria.setCategory(category);

	    List<InformationBoardVo> list = boardService.getListKsy(criteria);
	    int total = boardService.getTotalKsy(criteria);
	    InformationPageDto pageMaker = new InformationPageDto(criteria, total);
	    model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("criteria", criteria);
	    
	    // 주간 베스트 게시물 리스트 추가
	    List<InformationBoardVo> weeklyBestList = boardService.getWeeklyBest();
        model.addAttribute("weeklyBestList", weeklyBestList);
        
        // 오늘의 BEST 게시물 리스트 추가
        List<InformationBoardVo> todayBestList = boardService.getTodayBest();
        model.addAttribute("todayBestList", todayBestList);
        
        // 상단 공지 2개 가져오기
        List<InformationBoardVo> latestAnnounce = boardService.getLatestAnnounce();
        model.addAttribute("latestAnnounce", latestAnnounce);
        
	}

	// **김세영 글쓰기 폼**
	@GetMapping("/write")
	public void write(Model model) {
		
		// 주간 베스트 게시물 리스트 추가
	    List<InformationBoardVo> weeklyBestList = boardService.getWeeklyBest();
        model.addAttribute("weeklyBestList", weeklyBestList);
	}
	
	// 김세영 글쓰기 처리
	@PostMapping("/write")
	public String write(InformationBoardVo vo, RedirectAttributes rttr, HttpSession session) { // 수정된 부분: HttpSession 추가
        Long b_i_no = boardService.write(vo);
        List<AttachBoardDto> ckeditorImages = (List<AttachBoardDto>) session.getAttribute("ckeditorImages"); // 추가된 부분
		// 한번쓰고 버릴꺼라서 리다이렉트 (일회성)
		
        if (ckeditorImages != null) {
            for (AttachBoardDto dto : ckeditorImages) {
                dto.setB_i_no(b_i_no);
                attachMapper.insertKsy(dto);
            }
            session.removeAttribute("ckeditorImages"); // 추가된 부분
        }

        rttr.addFlashAttribute("resultWriter", b_i_no);
        return "redirect:/Kim/board/information";
	}
	
	// 김세영 글읽기
	@GetMapping("/read")
	public String read(@RequestParam("b_i_no") Long b_i_no, @ModelAttribute InformationCriteria criteria, Model model, 
			@RequestParam(value = "type", required = false) String type,
	        @RequestParam(value = "keyword", required = false) String keyword,
	        @RequestParam(value = "sort", required = false) String sort
	        /*@RequestParam(value = "category", required = false) String category*/) {
		InformationBoardVo boardVo = boardService.get(b_i_no);
		model.addAttribute("boardVo", boardVo);
		
		criteria.setType(type);
	    criteria.setKeyword(keyword);
	    criteria.setSort(sort);
	    //criteria.setCategory(category);
        
        // 게시판 리스트 불러오기
	    List<InformationBoardVo> list = boardService.getListKsy(criteria);
	    int total = boardService.getTotalKsy(criteria);
	    InformationPageDto pageMaker = new InformationPageDto(criteria, total);
	    model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("criteria", criteria);
        
	    // 주간 베스트 게시물 리스트 추가
	    List<InformationBoardVo> weeklyBestList = boardService.getWeeklyBest();
	    model.addAttribute("weeklyBestList", weeklyBestList);
	    
        return "Kim/board/read";
	}
	
	// 김세영 글 수정페이지로 이동
	@GetMapping("/modifyForm")
	public String modifyForm(@RequestParam("b_i_no") Long b_i_no, Model model) {
	    InformationBoardVo boardVo = boardService.get(b_i_no);
	    model.addAttribute("boardVo", boardVo);
	    
	 // 주간 베스트 게시물 리스트 추가
	    List<InformationBoardVo> weeklyBestList = boardService.getWeeklyBest();
	    model.addAttribute("weeklyBestList", weeklyBestList);
	    return "Kim/board/modify";
	}
	
	
	
	// 김세영 글 수정
	@PostMapping("/modify")
	public String modify(InformationBoardVo vo, RedirectAttributes rttr, HttpSession session) {
		Long b_i_no = boardService.modify(vo);
		
		 List<AttachBoardDto> ckeditorImages = (List<AttachBoardDto>) session.getAttribute("ckeditorImages");
		    if (ckeditorImages != null) {
		        for (AttachBoardDto dto : ckeditorImages) {
		            dto.setB_i_no(b_i_no);
		            attachMapper.insertKsy(dto);
		        }
		        session.removeAttribute("ckeditorImages");
		    }
		
		
		rttr.addFlashAttribute("resultModify", b_i_no);
		return "redirect:/Kim/board/read?b_i_no=" + b_i_no;
	}
	
    // 김세영 글 삭제
    @PostMapping("/delete")
    public String delete(@RequestParam Long b_i_no, RedirectAttributes rttr) {
        boardService.delete(b_i_no);
        rttr.addFlashAttribute("resultDelete", b_i_no);
        return "redirect:/Kim/board/information"; // 삭제 후 게시글 목록 페이지로 리디렉션
    }

}
