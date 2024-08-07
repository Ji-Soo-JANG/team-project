package com.teamproject.www.Kim.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamproject.www.Kim.domain.InformationBoardVo;
import com.teamproject.www.Kim.domain.InformationCriteria;

public interface BoardMapper {
	
	// 주간 게시글 list 가져오기 김세영
	public List<InformationBoardVo> getWeeklyBest();
	
	// 게시글list 가져오기 김세영
	public List<InformationBoardVo> getListWithPagingKsy(InformationCriteria criteria);
	
	// 게시글 갯수 김세영
	public int getTotalCountKsy(InformationCriteria criteria);
	
	// 오늘의 BEST 게시물 리스트 가져오기 김세영
    public List<InformationBoardVo> getTodayBest();
    
    // 상단 공지2개 가져오기 김세영
    public List<InformationBoardVo> getLatestAnnounce();
    
    // 글쓰기 김세영
 	public int insertKsy(InformationBoardVo vo);
    
    // 김세영 글쓰기 - 키
	public int insertSelectKeyKsy(InformationBoardVo vo);
	
	// 김세영 글보기
	public InformationBoardVo selectByBnoKsy(Long bno);
	
	// 김세영 댓글 갯수 갱신(댓글 등록/삭제)
	public int updateReplyCntKsy(@Param("b_i_no") Long b_i_no, 
								  @Param("amount") int amount);
	
	// 김세영 게시글 수정
	public int modifySelectKeyKsy(InformationBoardVo vo);
	
	// 김세영 게시글 삭제
	public void deleteKsy(Long b_i_no);
}
