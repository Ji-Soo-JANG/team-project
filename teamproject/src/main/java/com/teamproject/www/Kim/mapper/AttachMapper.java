package com.teamproject.www.Kim.mapper;

import java.util.List;

import com.teamproject.www.Kim.domain.AttachBoardDto;

public interface AttachMapper {

	public int insertKsy(AttachBoardDto dto);
	
	public List<AttachBoardDto> getAttachListKsy(Long bno);
	
	public int deleteKsy(Long bno);

	public List<AttachBoardDto> getOldAttachListKsy();
	
	int updateBnoForNullFiles(Long b_i_no);
}