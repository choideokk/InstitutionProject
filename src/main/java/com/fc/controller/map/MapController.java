package com.fc.controller.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fc.dto.facility.FacilityDto;
import com.fc.service.map.MapService;

@Controller
@PropertySource("/WEB-INF/properties/application.properties")
public class MapController {
	
	@Value("${api.kakao.key}")
	private String apiKey;
	
	@Autowired
	MapService mapService;
	
	@GetMapping("/map")
	public String getMapPage(Model model) {
		List<FacilityDto> fcList = mapService.getFacilityList();
		model.addAttribute("apiKey", apiKey);
		String jsonList = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			jsonList = mapper.writeValueAsString(fcList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("fcList", jsonList);
		
		return "map/map";
	}
	
	@GetMapping("/map2")
	public String getMapPage2(Model model) {	
		return "map/map2";
	}

	@GetMapping("/detail")
	public String getBookPage(@RequestParam String no, Model model) {
		FacilityDto currentFc = mapService.getCurrentFacility(no);

		if (currentFc != null) {
			model.addAttribute("currentFc", currentFc);
			return "reservation/detail";
		} 

		return "error";
	}
	
}
