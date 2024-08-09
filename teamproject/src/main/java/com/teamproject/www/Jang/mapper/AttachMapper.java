package com.teamproject.www.Jang.mapper;

import com.teamproject.www.Jang.domain.AttachVo;

public interface AttachMapper {
	// 업로드 파일 등록
	public void insertUpload(AttachVo attachVo);
	
	// 업로드 파일 제거
	public void deleteUpload(Long boardNo);
}
