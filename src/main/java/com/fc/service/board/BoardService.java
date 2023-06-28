package com.fc.service.board;

import java.util.List;
import java.util.Map;

import com.fc.dto.board.BoardDto;



public interface BoardService {

	int boardInsert(BoardDto boardDto);



	List<BoardDto> getBoardListbyBoardNumber(BoardDto boardDto);

	List<BoardDto> getBoardList();

	List<BoardDto> findBoardListBySearchKeywordMap(Map<String, String> map);

	List<BoardDto> findBoardListBySearchKeywordMap2(Map<String, String> map);

	void viewCount(int postno);

	BoardDto getdetail(int postno);

	void boardUpdate(BoardDto boardDto);

	public void boardDelte(int postno);




//페이징


}
