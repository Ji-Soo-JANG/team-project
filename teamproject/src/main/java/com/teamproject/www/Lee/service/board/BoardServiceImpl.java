package com.teamproject.www.Lee.service.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamproject.www.Lee.Util.MyFileUtil;
import com.teamproject.www.Lee.domain.AttachFileDto;
import com.teamproject.www.Lee.domain.BoardDelDto;
import com.teamproject.www.Lee.domain.BoardLikeDto;
import com.teamproject.www.Lee.domain.DetailFreeBoardDto;
import com.teamproject.www.Lee.domain.UpdateDto;
import com.teamproject.www.Lee.domain.board.BoardListDto;
import com.teamproject.www.Lee.domain.board.Criteria;
import com.teamproject.www.Lee.domain.board.InsertBoardDto;
import com.teamproject.www.Lee.mapper.AttachMapper;
import com.teamproject.www.Lee.mapper.BoardLikeMapper;
import com.teamproject.www.Lee.mapper.ReplyMapper;
import com.teamproject.www.Lee.mapper.board.BoardMapper;

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
	
	//*** 자유게시판 ***--------------------------------------------------------
	// 자유게시판 글등록
	@Transactional
	@Override
	public int registerFreeBoard(InsertBoardDto dto) {
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
	public List<BoardListDto> getList(Criteria criteria, String insertBoardtype) {
		System.out.println("getlist....................................");
		System.out.println("insertBoardtype : " + insertBoardtype);
		int boardtype = 0 ;
		switch(insertBoardtype) {
			case "free" : 
				boardtype = 1;
				break;
		}
		criteria.setBoardtype(boardtype);
		
		return boardMapper.getListWithPaging(criteria);
	}

	// 자게 디테일 가져오기
	@Override
	public DetailFreeBoardDto getDetail(int b_f_no) {
		return boardMapper.getDetail(b_f_no);
	}

	// 총갯수
	@Override
	public int getAllCount(Criteria criteria) {
		return boardMapper.getAllCount(criteria);
	}

	// 글 삭제
	@Transactional
	@Override
	public boolean delete(BoardDelDto dto) {
		int b_f_no = dto.getB_f_no();
		
		// 이미지 삭제
		char isImg = dto.getB_f_img();
		if(isImg=='Y') {
			List<String> paths = attachMapper.getPathListByBoardNo(b_f_no);
			MyFileUtil.deleImg(paths);
			attachMapper.deleteByBoardNo(b_f_no);
		}
		
		// 댓글삭제 , 댓글 없는경우는 어떻게됨?
		int result = replyMapper.deleteByBoardNo(b_f_no);
		result += boardMapper.delete(b_f_no);
		
		if(result==2) {return true;};
		return false;
	}

	// 글 수정
	@Transactional
	@Override
	public boolean update(UpdateDto dto) {
		System.out.println("board service........................");
		System.out.println("dto : " + dto);
		int b_f_no = dto.getB_f_no();
		List<AttachFileDto> getPathList = dto.getPathList();
		List<String> pathList = new ArrayList<String>();
		
		for(AttachFileDto pathDto : getPathList) {
			pathList.add(pathDto.getUploadpath());
		}
		// attach 수정
		// 삭제
		attachMapper.deleteByBoardNo(b_f_no);
		
		// 입력
		for(String path : pathList) {
			AttachFileDto attachDto = new AttachFileDto();
			attachDto.setBoardno(b_f_no); 
			attachDto.setUploadpath(path);
			attachMapper.insertAttach(attachDto);
		}
		
		//수정
		int result = boardMapper.update(dto);
		if(result > 0) {return true;}
		return false;
	}

	// 조회수 증가
	@Override
	public boolean plusViews(int b_f_no) {
		int result = boardMapper.pluseViews(b_f_no);
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
