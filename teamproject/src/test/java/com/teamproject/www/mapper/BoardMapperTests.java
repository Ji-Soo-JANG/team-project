package com.teamproject.www.mapper;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamproject.www.Jang.domain.BoardVo;
import com.teamproject.www.Jang.domain.NoticeCriteria;
import com.teamproject.www.Jang.domain.NoticeDto;
import com.teamproject.www.Jang.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testInstance() {
		log.info(boardMapper);
	}

	@Test
	public void testGetNotice() {
		Long boardNo = 2865L;
		log.info(boardMapper.getNotice(boardNo));
	}
	
	@Test
	public void testInsertnotice() {
		for(int i = 1; i <= 3; i++) {
		BoardVo boardVo = new BoardVo();
		boardVo.setTitle("공지사항" + i);
		boardVo.setContent("내용" + i);
		boardVo.setWriter(0);
		boardVo.setBoardtype(1); // type 1 - 공지사항, 2 - �옄�쑀寃뚯떆�뙋
		
		int count = boardMapper.insertNotice(boardVo);
		log.info("------------------------------" + boardVo.getBoardNo() + "--------------------------------");
//		System.out.println("------------------------------" + vo.getBno() + "--------------------------------");
		
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
	
	
	@Test
	public void testGetnoticeList() {
		NoticeCriteria cri = new NoticeCriteria();
		cri.setType(null);
		cri.setKeyword(null);
		cri.setOrder("desc");
		cri.setSort("views");
		List<NoticeDto> list = boardMapper.getListWithPaging(cri); 
		for(NoticeDto dto : list) {
			log.info(dto);
		}
	}
	
	@Test
	public void testGetTotal() {
		NoticeCriteria cri = new NoticeCriteria();
		cri.setType("T");
		cri.setKeyword("항3");
		int count = boardMapper.getTotal(cri);
		log.info(count);
	}
	
	@Test
	public void testGetListWithPaging() {
		NoticeCriteria cri = new NoticeCriteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		cri.setKeyword("항3");
		cri.setType("T");
		
		List<NoticeDto> list = boardMapper.getListWithPaging(cri);
//		for(noticeDto dto : list) {
//			System.out.println(dto);
//		}
	}
	
	@Test
	public void testViewsUp() {
		Long boardNo = 2865L;
		int views = boardMapper.viewsUp(boardNo);
		if(views > 0 ) {
			log.info(true);
		}
	}
	
	@Test
	public void testUpdate() {
        Long boardNo = 2865L;
        String content = "<h1>변경됨</h1>";
        int result = boardMapper.updateNotice(content, boardNo);
        NoticeDto dto = boardMapper.getNotice(boardNo);
        log.info(dto);
	}
	
	@Test
	public void testDelete() {
		Long boardNo = 2865L;
		int result = boardMapper.deleteNotice(boardNo);
		log.info(result);
	}
	
}
