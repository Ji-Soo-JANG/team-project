package com.teamproject.www.Lee.service;

import java.util.List;

import com.teamproject.www.Lee.domain.reply.ReplyInsertDto;
import com.teamproject.www.Lee.domain.reply.ReplyListDto;
import com.teamproject.www.Lee.domain.reply.ReplyUpdateDto;

public interface ReplyService {
	// 댓글달기
	public boolean registerReply(ReplyInsertDto dto, int b_f_no);
	
	// 댓글LIST 가져오기
	public List<ReplyListDto> getList(int b_f_no);
	
	// 댓글 삭제
	public boolean delete(int b_f_r_no);

	
	// 댓글 수정
	public boolean update(ReplyUpdateDto dto);
	
	// 댓글 좋아요
	public boolean like(int b_f_r_no);
	
}
