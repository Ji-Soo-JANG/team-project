package com.teamproject.www.Lee.mapper.board;

import com.teamproject.www.Lee.domain.BoardLikeDto;

public interface BoardLikeMapper {
	// 게시글 좋아요 체크
	public int checkLike(BoardLikeDto dto);
	
	// 게시글 좋아요
	public int boardLike(BoardLikeDto dto);
}	
