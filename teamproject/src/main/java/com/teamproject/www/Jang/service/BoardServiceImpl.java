package com.teamproject.www.Jang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.www.Jang.domain.BoardVo;
import com.teamproject.www.Jang.domain.NoticeCriteria;
import com.teamproject.www.Jang.domain.NoticeDto;
import com.teamproject.www.Jang.mapper.BoardMapper;

@Service("JangBoardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<NoticeDto> getNoticeList() {
		List<NoticeDto> list = boardMapper.getNoticeList();
		return list;
	}

	@Override
	public NoticeDto getNotice(Long bno) {
		NoticeDto dto = boardMapper.getNotice(bno);
		return dto;
	}

	@Override
	public int getTotal(NoticeCriteria cri) {
		int total = boardMapper.getTotal(cri);
		return total;
	}

	@Override
	public List<NoticeDto> getListWithPaging(NoticeCriteria cri) {
		System.out.println("service: " + cri);
		List<NoticeDto> list = boardMapper.getListWithPaging(cri);
		for(NoticeDto dto : list) {
			dto.calcNewPost();
		}
		return list;
	}

	@Override
	public void viewsUp(Long bno) {
		boardMapper.viewsUp(bno);
	}

	@Override
	public void insertNotice(BoardVo vo) {
		boardMapper.insertNotice(vo);
	}

	@Override
	public boolean modify(@RequestParam("content") String content, @RequestParam("bno") Long bno) {
		System.out.println("service; content: " + content);
		int count = boardMapper.updateNotice	(content, bno);
		if(count > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		int count = boardMapper.deleteNotice(bno);
		if(count > 0) {
			return true;	
		}
		return false;
	}

}
