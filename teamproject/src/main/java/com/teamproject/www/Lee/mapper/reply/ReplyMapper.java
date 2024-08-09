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
	public List<ReplyListDto> getList(int boardno);
	// 댓글 갯수 가져오기
	public int getCountByBoardno(int boardno);
	// 댓글삭제
	public int delete(int replyno);
	
	// 댓글수정
	public int update(ReplyUpdateDto dto);
	
	// 댓글 좋아요
	public int like(int replyno);
	
	// 댓글 게시판번호로 삭제
	public int deleteByBoardNo(int replyno);
}
