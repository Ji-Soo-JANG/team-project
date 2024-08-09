package com.teamproject.www.Lee.mapper.reply;

import java.util.List;

import com.teamproject.www.Lee.domain.reply.ReplyInsertDto;
import com.teamproject.www.Lee.domain.reply.ReplyListDto;
import com.teamproject.www.Lee.domain.reply.ReplyUpdateDto;

public interface ReplyMapper {
	// 댓글달기
	public int insertReply(ReplyInsertDto dto);
	// 댓글리스트 가져오기
//	public List<> getList();
	public List<ReplyListDto> getList(int b_f_no);
	
	// 댓글삭제
	public int delete(int b_f_r_no);
	
	// 댓글수정
	public int update(ReplyUpdateDto dto);
	
	// 댓글 좋아요
	public int like(int b_f_r_no);
	
	// 댓글 게시판번호로 삭제
	public int deleteByBoardNo(int b_f_no);
}
