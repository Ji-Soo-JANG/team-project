package com.teamproject.www.Kim.service;

import java.util.List;

import com.teamproject.www.Kim.domain.InformationBoardVo;
import com.teamproject.www.Kim.domain.InformationCriteria;

public interface BoardService {
	
	
	
	//글목록 김세영
	public List<InformationBoardVo> getListKsy(InformationCriteria criteria);
	
	//갯수 김세영
	public int getTotalKsy(InformationCriteria criteria);
	
	// 주간 베스트 게시물 가져오기 김세영
    public List<InformationBoardVo> getWeeklyBest();
    
    // 오늘의 통합 BEST 게시물 리스트 가져오기 김세영
    public List<InformationBoardVo> getTodayBest();
    
    // 상단 공지 2개 가져오기 김세영
    public List<InformationBoardVo> getLatestAnnounce();
    
    // 글등록 김세영
    public Long write(InformationBoardVo vo);
    
    // 글 보기 김세영
  	public InformationBoardVo get(Long bno);
  	
  	// 글수정 김세영
    public Long modify(InformationBoardVo vo);


 // 글삭제 김세영
	public void delete(Long b_i_no);
    
}
