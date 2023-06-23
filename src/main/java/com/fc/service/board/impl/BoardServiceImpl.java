package com.fc.service.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dao.board.BoardDao;
import com.fc.dto.board.BoardDto;
import com.fc.service.board.BoardService;

@Service
public  class BoardServiceImpl implements BoardService {

	@Autowired 
	BoardDao boardDao;
	

	@Override
	public int boardInsert(BoardDto boardDto) {
		// TODO Auto-generated method stub
		int result = boardDao.boardInsert(boardDto);
		
		return result;
	}

	@Override
	public List<BoardDto> getBoardList() {
		// TODO Auto-generated method stub
		List<BoardDto> list = boardDao.selectBoardList();
				
		return list;
	}

	@Override
	public List<BoardDto> getBoardListbyBoardNumber(BoardDto boardDto) {
		// TODO Auto-generated method stub
	
		List<BoardDto> list = boardDao.selectBoardListByNumber(boardDto);

		return list;
	}

	@Override
	public List<BoardDto> findBoardListBySearchKeywordMap(Map<String, String> map) {
		// TODO Auto-generated method stub
	List<BoardDto> list = boardDao.selectBoardListBySearchKeywordMap(map);
		
		return list;
		
	
	}
	
	@Override
	public List<BoardDto> findBoardListBySearchKeywordMap2(Map<String, String> map) {
		// TODO Auto-generated method stub
		List<BoardDto> list = boardDao.selectBoardListBySearchKeywordMap2(map);

		return list;
	}

	@Override
	public void viewCount(int postno) {
		// TODO Auto-generated method stub
		
		boardDao.viewCount(postno);

	}

	@Override
	public BoardDto getdetail(int postno) {

		BoardDto dto =boardDao.pageView(postno);
		
		return dto;
	}

	
	@Override
	public void updateBoard(BoardDto boardDto)  {
		// TODO Auto-generated method stub
		try {
			boardDao.update(boardDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBoard(int postno) {
		// TODO Auto-generated method stub
		try {
			boardDao.delete(postno);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void boardUpdate(BoardDto boardDto) {
		// TODO Auto-generated method stub
		boardDao.update(boardDto);
	}

	


    
	}
	