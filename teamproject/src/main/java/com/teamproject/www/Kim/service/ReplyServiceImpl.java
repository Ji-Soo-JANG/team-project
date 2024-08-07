package com.teamproject.www.Kim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.www.Kim.domain.InformationReplyVo;
import com.teamproject.www.Kim.mapper.BoardMapper;
import com.teamproject.www.Kim.mapper.ReplyMapper;

@Service("kimReplyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private BoardMapper boardMapper;

	@Transactional
	@Override // 김세영 정보공유 댓글등록
	public boolean register(InformationReplyVo vo) {
		int count = replyMapper.insert(vo);
		count += boardMapper.updateReplyCntKsy(vo.getB_i_no(), 1);
		return (count == 2) ? true : false;
	}

	@Override
	public InformationReplyVo get(Long b_i_r_no) {
		InformationReplyVo vo = replyMapper.read(b_i_r_no);
		return vo;
	}
	
	@Transactional
	@Override
	public boolean remove(Long b_i_r_no, Long b_i_no) {
		int count = replyMapper.delete(b_i_r_no);
		count += boardMapper.updateReplyCntKsy(b_i_no, -1);
		return (count == 2) ? true : false;
	}

	@Override
	public boolean modify(InformationReplyVo vo) {
        System.out.println("Modifying reply: " + vo);
        int count = replyMapper.update(vo);
        System.out.println("Update count: " + count);
        return (count > 0) ? true : false;
	}
//	// 김세영 정보공유 댓글 불러오기
	@Override
	public List<InformationReplyVo> getList(Long b_i_no) {
		List<InformationReplyVo> list = replyMapper.getList(b_i_no);
		return list;
	}

}