package com.teamproject.www.Lee.service.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.www.Lee.domain.AttachFileDto;
import com.teamproject.www.Lee.domain.BoardLikeDto;
import com.teamproject.www.Lee.domain.board.BoardDetailDto;
import com.teamproject.www.Lee.domain.board.BoardListDto;
import com.teamproject.www.Lee.domain.board.Criteria;
import com.teamproject.www.Lee.domain.board.BoardUpdateDto;
import com.teamproject.www.Lee.domain.board.BoardInsertDto;
import com.teamproject.www.Lee.mapper.board.AttachMapper;
import com.teamproject.www.Lee.mapper.board.BoardLikeMapper;
import com.teamproject.www.Lee.mapper.board.BoardMapper;
import com.teamproject.www.Lee.mapper.board.BoardTypeMapper;
import com.teamproject.www.Lee.mapper.reply.ReplyMapper;

@Service("LeeBoardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private ReplyMapper replyMapper;
	@Autowired
	private BoardLikeMapper boardLikeMapper;
	@Autowired
	private AttachMapper attachMapper;
	@Autowired
	private BoardTypeMapper boardTypeMapper;
	
	//*** 자유게시판 ***--------------------------------------------------------
	// 자유게시판 글등록
	@Transactional
	@Override
	public int registerBoard(BoardInsertDto dto) {
		System.out.println("boardservice......................");
		System.out.println("boardSerice dto : " + dto);
		boardMapper.insertGetKey(dto);
		int boardno = dto.getBoardno();
		System.out.println("boardno : " + boardno);
		List<AttachFileDto> PathList = dto.getPathList();
		if(PathList != null && PathList.size() > 0) {
			PathList.forEach(getDto ->{
				getDto.setBoardno(boardno);
				attachMapper.insertAttach(getDto);
			});
			
		}
		return boardno;
	}

	// 자유게시판 리스트 가져오기
	@Override
	public List<BoardListDto> getList(Criteria criteria, String boardtype) {
		System.out.println("getlist....................................");
		System.out.println("boardtype : " + boardtype);
		System.out.println("criteria : " + criteria);
		int boardtypeno = 0 ;
		boardtypeno = boardTypeMapper.getBoardTypeNo(boardtype);
		criteria.setBoardtypeno(boardtypeno);
		List<BoardListDto> list = boardMapper.getListWithPaging(criteria);
		System.out.println("list : " + list);
		return list;
	}

	// 디테일 가져오기
	@Override
	public BoardDetailDto getDetail(int boardno) {
		return boardMapper.getDetail(boardno);
	}

	// 총갯수
	@Override
	public int getAllCount(Criteria criteria) {
		return boardMapper.getAllCount(criteria);
	}

	// 글 삭제
	@Transactional
	@Override
	public boolean delete(int boardno) {
		// 댓글삭제 , 댓글 없는경우는 어떻게됨?
		int result = replyMapper.deleteByBoardNo(boardno);
		result += boardMapper.delete(boardno);
		
		if(result==2) {return true;};
		return false;
	}

	// 글 수정
	@Transactional
	@Override
	public boolean update(BoardUpdateDto dto) {
		System.out.println("board service........................");
		System.out.println("dto : " + dto);
		int boardno = dto.getBoardno();
		List<AttachFileDto> getPathList = dto.getPathList();
		List<String> pathList = new ArrayList<String>();
		if(getPathList != null && getPathList.size()  > 0) {
			for(AttachFileDto pathDto : getPathList) {
				pathList.add(pathDto.getUploadpath());
			}
			for(String path : pathList) {
				AttachFileDto attachDto = new AttachFileDto();
				attachDto.setBoardno(boardno); 
				attachDto.setUploadpath(path);
				attachMapper.insertAttach(attachDto);
			}
		}else {
			
		}
		// attach 수정
		// 삭제
		attachMapper.deleteByBoardNo(boardno);
		
		// 입력
		
		
		//수정
		int result = boardMapper.update(dto);
		if(result > 0) {return true;}
		return false;
	}

	// 조회수 증가
	@Override
	public boolean plusViews(int board) {
		int result = boardMapper.pluseViews(board);
		if(result>0) {return true;};
		return false;
	}

	//추천 했는지 조회
	@Override
	public boolean checkLike(BoardLikeDto dto) {
		int result = boardLikeMapper.checkLike(dto);
		if(result>0) {return true;};
		return false;
	}
	
	//추천하기
	@Transactional
	@Override
	public int commend(BoardLikeDto dto) {
		int b_f_no = dto.getB_f_no();
		
		int result = boardLikeMapper.boardLike(dto);
		
		result += boardMapper.commend(b_f_no);
		if(result == 2) {
			return boardMapper.getCommend(b_f_no);
		}
		return 0;
	}
	//*** 자유게시판 ***--------------------------------------------------------

	
	

}
