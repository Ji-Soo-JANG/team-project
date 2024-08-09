package com.teamproject.www.kim.mapper;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamproject.www.Kim.domain.InformationBoardVo;
import com.teamproject.www.Kim.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
    @Autowired
    private BoardMapper boardMapper;
    
    // 공지사항 2개 가져오기 테스트
    @Test
    public void testGetLatestAnnounce() {
        List<InformationBoardVo> result = boardMapper.getLatestAnnounce();
        assertNotNull(result);
        assertTrue(result.size() <= 2);  // 최근 2개의 공지글만 가져와야 함
        for (InformationBoardVo vo : result) {
            System.out.println(vo);
        }
    }
}
