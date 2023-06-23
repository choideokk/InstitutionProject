package com.fc.service.board;

import java.util.List;
import java.util.Map;

import com.fc.dto.board.BoardDto;
import com.fc.dto.board.ReplyDto;

public interface BoardService {

	int boardInsert(BoardDto boardDto);



	List<BoardDto> getBoardListbyBoardNumber(BoardDto boardDto);

	List<BoardDto> getBoardList();

	List<BoardDto> findBoardListBySearchKeywordMap(Map<String, String> map);

	List<BoardDto> findBoardListBySearchKeywordMap2(Map<String, String> map);

	void viewCount(int postno);

	BoardDto getdetail(int postno);

	
	// 게시물 수정
	public void updateBoard(BoardDto boardDto) throws Exception;
		
		// 게시물 삭제
	public void deleteBoard(int postno) throws Exception;

	
	void boardUpdate(BoardDto boardDto);




		


	
	

}