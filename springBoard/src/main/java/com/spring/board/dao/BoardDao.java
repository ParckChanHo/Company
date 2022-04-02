package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.board.vo.CheckBox;
import com.spring.board.vo.CodeName;

public interface BoardDao {
	// CODE_NAME ª—∑¡¡÷±‚
	public List<CodeName> SelectCodeName() throws Exception;
	
	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;
	
	// CheckBox BoardList
	//public List<BoardVo> selectCheckBoxBoardList(CheckBox parameter);
	
	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	public int boardUpdate(BoardVo boardVo) throws Exception;
	
	public int deleteBoard(BoardVo boardVo) throws Exception;

}
