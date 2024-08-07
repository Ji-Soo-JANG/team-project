package com.teamproject.www.Kim.service;

import java.util.List;

import com.teamproject.www.Kim.domain.InformationReplyVo;



public interface ReplyService {
	// 김세영 정보공유 댓글등록
	public boolean register(InformationReplyVo vo);
	
	public InformationReplyVo get(Long b_i_r_no);
	
	public boolean remove(Long b_i_r_no, Long b_i_no);
	
	public boolean modify(InformationReplyVo vo);
	//	// 김세영 정보	공유 댓글 목록
	public List<InformationReplyVo> getList(Long b_i_no);
}