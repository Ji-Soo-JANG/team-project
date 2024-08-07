package com.teamproject.www.Lee.service;

import java.util.List;

import com.teamproject.www.Lee.domain.BoardDelDto;
import com.teamproject.www.Lee.domain.BoardLikeDto;
import com.teamproject.www.Lee.domain.Criteria;
import com.teamproject.www.Lee.domain.DetailFreeBoardDto;
import com.teamproject.www.Lee.domain.FreeBoardListDto;
import com.teamproject.www.Lee.domain.InsertFreeBoardDto;
import com.teamproject.www.Lee.domain.UpdateDto;

public interface BoardService {
	// 자유게시판 글등록
	public int registerFreeBoard(InsertFreeBoardDto dto);
	
	// 자유게시판 리스트 가져오기
	public List<FreeBoardListDto> getList(Criteria criteria);
	
	// 자게 디테일 가져오기
	public DetailFreeBoardDto getDetail(int b_f_no);
	
	// 총개수
	public int getAllCount(Criteria criteria);
	
	// 자게 글 삭제
	public boolean delete(BoardDelDto dto);
	
	// 글 수정
	public boolean update(UpdateDto dto);
	
	// 조회수 증가
	public boolean plusViews(int b_f_no);
	
	// 추천하기
	public int commend(BoardLikeDto dto);
	
	// 추천했는지 조회
	public boolean checkLike(BoardLikeDto dto);
	
}
