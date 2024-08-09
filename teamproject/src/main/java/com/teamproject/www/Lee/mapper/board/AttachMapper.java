package com.teamproject.www.Lee.mapper.board;

import java.util.List;

import com.teamproject.www.Lee.domain.AttachFileDto;

public interface AttachMapper {
	// insertAttach
	public int insertAttach(AttachFileDto dto);
	
	// getYesterdayPathList
	public List<String> getYesterdayUploadpath();
	
	// getPathListByBoardNo
	public List<String> getPathListByBoardNo(int boardno);
	
	// deleteByBoardNo
	public int deleteByBoardNo(int boardno);
	
	// 
	// deleteByUpdate
	public int deleteByUpdate(List<String> updatePaths);
}
