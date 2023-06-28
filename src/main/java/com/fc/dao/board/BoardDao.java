package com.fc.dao.board;

import java.util.List;
import java.util.Map;

import com.fc.dto.board.BoardDto;
import com.fc.dto.facility.SearchDto;

public interface BoardDao {



	int boardInsert(BoardDto boardDto);


	
	List<BoardDto> selectBoardList();

	List<BoardDto> selectBoardListByNumber(BoardDto boardDto);

	//제목
	List<BoardDto> selectBoardListBySearchKeywordMap(Map<String, String> map);
	//내용
	List<BoardDto> selectBoardListBySearchKeywordMap2(Map<String, String> map);
	
	List<BoardDto> selectBoardListBySearchDto(SearchDto searchDto);
	
	void viewCount(int postno);
	//조회수 예정

	BoardDto pageView(int postno);
	
	public void update(BoardDto boardDto);
	
    public void delete(int postno) ;
    
    public int insertBoardLike(Map<String, String> infoMap);
	

	
}
