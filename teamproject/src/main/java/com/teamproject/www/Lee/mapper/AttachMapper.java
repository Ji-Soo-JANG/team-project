package com.teamproject.www.Lee.mapper;

import java.util.List;

import com.teamproject.www.Lee.domain.AttachFileDto;

public interface AttachMapper {
	// insertAttach
	public int insertAttach(AttachFileDto dto);
	
	// getYesterdayPathList
	public List<String> getYesterdayAt_url();
	
	// getPathListByBoardNo
	public List<String> getPathListByBoardNo(int b_f_no);
	
	// deleteByBoardNo
	public int deleteByBoardNo(int b_f_no);
	
	// 
	// deleteByUpdate
	public int deleteByUpdate(List<String> updatePaths);
}
