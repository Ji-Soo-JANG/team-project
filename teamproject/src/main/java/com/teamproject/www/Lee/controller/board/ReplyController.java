package com.teamproject.www.Lee.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamproject.www.Lee.domain.reply.ReplyInsertDto;
import com.teamproject.www.Lee.domain.reply.ReplyListDto;
import com.teamproject.www.Lee.domain.reply.ReplyUpdateDto;
import com.teamproject.www.Lee.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController("leeReplyController")
@RequestMapping("/Lee/board/reply/*")
@Log4j
@Qualifier("LeeReplyService")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	//댓글달기
	@PostMapping("/register")
	public boolean register(@RequestBody ReplyInsertDto dto) {
		log.info("reply register, dto : " + dto);
		int boardno = dto.getBoardno();
		return replyService.registerReply(dto, boardno);
//		return false;
	}
	//댓글 리스트 가져오기
	@GetMapping("/list/{boardno}")
	public List<ReplyListDto> getList(@PathVariable("boardno") int boardno) {
		return replyService.getList(boardno);
	}
	
	//댓글삭제
	@DeleteMapping("/delete/{replyno}")
	public boolean delete(@PathVariable("replyno")  int replyno) {
		log.info("reply, delete..");
		return replyService.delete(replyno);
	}
	
	//댓글수정
	@PutMapping("/update")
	public boolean update(@RequestBody ReplyUpdateDto dto) {
		log.info("reply, update.. dto : " + dto);
		return replyService.update(dto);
	}
	
	// 댓글 좋아요
	@GetMapping("/like/{replyno}")
	public boolean like(@PathVariable("replyno") int replyno) {
		log.info("reply, like.. ");
		return replyService.like(replyno);
	}
}
