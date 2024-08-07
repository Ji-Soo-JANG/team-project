package com.teamproject.www.Jang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamproject.www.Jang.domain.BoardVo;
import com.teamproject.www.Jang.domain.NoticeCriteria;
import com.teamproject.www.Jang.domain.NoticeDto;

public interface BoardMapper {
//	public List<FreeBoardListDto> getList(Criteria criteria);
	public List<NoticeDto> getNoticeList();
	public int insertNotice(BoardVo vo);
	public NoticeDto getNotice(Long bno);
	public int getTotal(NoticeCriteria cri);
	public List<NoticeDto> getListWithPaging(NoticeCriteria cri);
	public int viewsUp(Long bno);
	public int updateNotice(@Param("content") String content, @Param("bno") Long bno);
	public int deleteNotice(Long bno);
}
