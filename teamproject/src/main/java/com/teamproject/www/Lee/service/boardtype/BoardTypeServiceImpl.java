package com.teamproject.www.Lee.service.boardtype;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.www.Lee.mapper.boardtype.BoardTypeMapper;

@Service("LeeBoardTypeService")
public class BoardTypeServiceImpl implements BoardTypeService{
	@Autowired
	private BoardTypeMapper boardtypemapper;
	@Override
	public String getBoardType(int boardtypeno) {
		boardtypemapper.getBoardType(boardtypeno);
		return null;
	}
	
}
