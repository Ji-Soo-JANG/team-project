package com.teamproject.www.Lee.mapper;

import java.util.List;

import com.teamproject.www.Lee.domain.ClobVo;
import com.teamproject.www.Lee.domain.Criteria;
import com.teamproject.www.Lee.domain.DetailFreeBoardDto;
import com.teamproject.www.Lee.domain.FreeBoardListDto;
import com.teamproject.www.Lee.domain.InsertFreeBoardDto;
import com.teamproject.www.Lee.domain.UpdateDto;

public interface BoardMapper {
	// 게시판 등록
	// 자유게시판
	public int insertFreeBoard(InsertFreeBoardDto Dto);
	
	public int insertGetKey(InsertFreeBoardDto Dto);
	
	// 게시글 List 가져오기
	public List<FreeBoardListDto> getList(Criteria criteria);
	
	// 게시글 List 가져오기 with Paging
	public List<FreeBoardListDto> getListWithPaging(Criteria criteria);
	
	// 게시글 상세정보 가져오기 with b_f_no
	public DetailFreeBoardDto getDetail(int b_f_no);
	
	// 총갯수 가져오기
	public int getAllCount(Criteria criteria);
	
	// 컨텐츠 가져오기 by b_f_no
	public String getContentByB_f_no(int b_f_no);
	
	// 자게 글 삭제
	public int delete(int b_f_no);
	
	// 자게 글 수정
	public int update(UpdateDto dto);
	
	// 조회수 증가
	public int pluseViews(int b_f_no);
	
	// 추천하기
	public int commend(int b_f_no);
	// 추천수 가져오기
	public int getCommend(int b_f_no);
	
	// 댓글수 업데이트
	public int updateReplyCount(int b_f_no);
	
	// 어제 날짜 게시글 컨텐츠들 가져오기
	public List<ClobVo> getYesterdayContents();
}
