package com.teamproject.www.Lee.service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.www.Lee.domain.reply.ReplyInsertDto;
import com.teamproject.www.Lee.domain.reply.ReplyListDto;
import com.teamproject.www.Lee.domain.reply.ReplyUpdateDto;
import com.teamproject.www.Lee.mapper.board.BoardMapper;
import com.teamproject.www.Lee.mapper.reply.ReplyMapper;

@Service("LeeReplyService")
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private BoardMapper boardMapper;
	
	// 댓글달기
	@Override
	public boolean registerReply(ReplyInsertDto dto) {
		System.out.println("reply service......................");
		System.out.println("registerReply......................");
		System.out.println("dto : " + dto);
		int result = replyMapper.insertReply(dto);
		int boardno = dto.getBoardno();
		boardMapper.updateReplyCount(boardno);
		if(result>0) {return true;};
		return false;
	}

	// 댓글 list 가져오기
	@Override
	public List<ReplyListDto> getList(int boardno) {
		return replyMapper.getList(boardno);
	}

	// 댓글 삭제
	@Override
	public boolean delete(int replyno) {
		int result = replyMapper.delete(replyno);
		if(result>0) {return true;};
		return false;
	}

	// 댓글 수정
	@Override
	public boolean update(ReplyUpdateDto dto) {
		int result = replyMapper.update(dto);
		if(result>0) {return true;};
		return false;
	}

	// 댓글 좋아요
	@Override
	public boolean like(int boardno) {
		int result = replyMapper.like(boardno);
		if(result>0) {return true;};
		return false;
	}

}
