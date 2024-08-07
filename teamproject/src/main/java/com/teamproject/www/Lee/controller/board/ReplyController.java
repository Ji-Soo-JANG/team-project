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

import com.teamproject.www.Lee.domain.InsertReplyDto;
import com.teamproject.www.Lee.domain.ReplyListDto;
import com.teamproject.www.Lee.domain.UpdateReplyDto;
import com.teamproject.www.Lee.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RestController("leeReplyController")
@RequestMapping("/Lee/board/free/reply/*")
@Log4j
@Qualifier("LeeReplyService")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	//댓글달기
	@PostMapping("/register")
	public boolean register(@RequestBody InsertReplyDto dto) {
		log.info("reply register, dto : " + dto);
		int b_f_no = dto.getB_f_no();
		return replyService.registerReply(dto, b_f_no);
//		return false;
	}
	//댓글 리스트 가져오기
	@GetMapping("/list/{b_f_no}")
	public List<ReplyListDto> getList(@PathVariable("b_f_no") int b_f_no) {
		return replyService.getList(b_f_no);
	}
	
	//댓글삭제
	@DeleteMapping("/delete/{b_f_r_no}")
	public boolean delete(@PathVariable("b_f_r_no")  int b_f_r_no) {
		log.info("reply, delete..");
		return replyService.delete(b_f_r_no);
	}
	
	//댓글수정
	@PutMapping("/update")
	public boolean update(@RequestBody UpdateReplyDto dto) {
		log.info("reply, update.. dto : " + dto);
		return replyService.update(dto);
	}
	
	// 댓글 좋아요
	@GetMapping("/like/{b_f_r_no}")
	public boolean like(@PathVariable("b_f_r_no") int b_f_r_no) {
		log.info("reply, like.. ");
		return replyService.like(b_f_r_no);
	}
}
