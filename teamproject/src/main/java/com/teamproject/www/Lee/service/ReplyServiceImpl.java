package com.teamproject.www.Lee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.www.Lee.domain.InsertReplyDto;
import com.teamproject.www.Lee.domain.ReplyListDto;
import com.teamproject.www.Lee.domain.UpdateReplyDto;
import com.teamproject.www.Lee.mapper.ReplyMapper;
import com.teamproject.www.Lee.mapper.board.BoardMapper;

@Service("LeeReplyService")
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private BoardMapper boardMapper;
	
	// 댓글달기
	@Override
	public boolean registerReply(InsertReplyDto dto, int b_f_no) {
		int result = replyMapper.insertReply(dto);
		boardMapper.updateReplyCount(b_f_no);
		if(result>0) {return true;};
		return false;
	}

	// 댓글 list 가져오기
	@Override
	public List<ReplyListDto> getList(int b_f_no) {
		return replyMapper.getList(b_f_no);
	}

	// 댓글 삭제
	@Override
	public boolean delete(int b_f_r_no) {
		int result = replyMapper.delete(b_f_r_no);
		if(result>0) {return true;};
		return false;
	}

	// 댓글 수정
	@Override
	public boolean update(UpdateReplyDto dto) {
		int result = replyMapper.update(dto);
		if(result>0) {return true;};
		return false;
	}

	// 댓글 좋아요
	@Override
	public boolean like(int b_f_r_no) {
		int result = replyMapper.like(b_f_r_no);
		if(result>0) {return true;};
		return false;
	}

}
