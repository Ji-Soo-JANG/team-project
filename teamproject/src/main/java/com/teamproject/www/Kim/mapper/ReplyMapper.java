package com.teamproject.www.Kim.mapper;

import java.util.List;

import com.teamproject.www.Kim.domain.InformationReplyVo;




public interface ReplyMapper {
	// 김세영 댓글달기
	public int insert(InformationReplyVo vo);
	
	public InformationReplyVo read(Long b_i_r_no);
	
	public int delete(Long b_i_r_no);
	
	public int update(InformationReplyVo vo);
//	김세영 댓글 불러오기
	public List<InformationReplyVo> getList(Long b_i_no);
}