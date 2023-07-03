package com.fc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fc.dto.board.BoardDto;
import com.fc.dto.facility.FacilityDto;
import com.fc.service.board.BoardService;
import com.fc.service.map.MapService;

@Controller
@PropertySource("/WEB-INF/properties/application.properties")
public class MainController {
	
	@Value("${api.kakao.key}")
	private String kakaoApiKey;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	MapService mapService;
	
	@GetMapping("/main")
	public String getMainPage(Model model) {
		List<FacilityDto> fcList = mapService.getFacilityList();
		List<BoardDto> cntBoardList = boardService.getBoardListByViewCnt();
		List<BoardDto> latestBoardList = boardService.getBoardList();
		
		String jsonList = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			// list를 JSON으로
			jsonList = mapper.writeValueAsString(fcList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("parsedList", jsonList);
		model.addAttribute("cntBoardList", cntBoardList);
		model.addAttribute("latestBoardList", latestBoardList);
		model.addAttribute("apiKey", kakaoApiKey);
		
		return "main";
	}
}
