package com.teamproject.www.Kim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamproject.www.Kim.domain.InformationReplyVo;
import com.teamproject.www.Kim.service.ReplyService;

@RestController("kimReplyController")
@RequestMapping("/Kim/reply/*")
@Qualifier("KimReplyService")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	// 김세영 댓글달기
	@PostMapping("/write")
	public boolean write(@RequestBody InformationReplyVo replyVo) {
		boolean result = replyService.register(replyVo);
		return result;
	}
	// 김세영 댓글 수정
	@PutMapping("/modify")
	public boolean modify(@RequestBody InformationReplyVo replyVo) {
        System.out.println("Modify request received for: " + replyVo);
        boolean result = replyService.modify(replyVo);
        System.out.println("Modify result: " + result);
        return result;
	}
	
	@DeleteMapping("/remove/{b_i_r_no}/{b_i_no}")
	public boolean remove(@PathVariable("b_i_r_no") Long b_i_r_no, @PathVariable("b_i_no") Long b_i_no) {
		boolean result = replyService.remove(b_i_r_no, b_i_no);
		return result;
	}
	
	// 김세영 댓글 불러오기 localhost/reply/list/501
	@GetMapping("/list/{b_i_no}")
	public List<InformationReplyVo> list(@PathVariable("b_i_no") Long b_i_no) {
        System.out.println("Fetching replies for b_i_no: " + b_i_no); // 로그 추가
        List<InformationReplyVo> list = replyService.getList(b_i_no);
        System.out.println("Replies: " + list); // 로그 추가
        return list;
	}
	
}