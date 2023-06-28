package com.fc.service.board;

import java.util.List;
import java.util.Map;

import com.fc.dto.board.BoardDto;
import com.fc.dto.board.ReplyDto;
import com.fc.dto.facility.SearchDto;

public interface BoardService {

	int boardInsert(BoardDto boardDto);



	List<BoardDto> getBoardListbyBoardNumber(BoardDto boardDto);

	List<BoardDto> getBoardList();

	List<BoardDto> findBoardListBySearchKeywordMap(Map<String, String> map);

	List<BoardDto> findBoardListBySearchKeywordMap2(Map<String, String> map);

	List<BoardDto> findBoardListBySearchDto(SearchDto searchDto);

	void viewCount(int postno);

	BoardDto getdetail(int postno);

	void boardUpdate(BoardDto boardDto);

	public void boardDelte(int postno);

}
