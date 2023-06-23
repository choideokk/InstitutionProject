package com.fc.service.map;

import java.util.List;

import com.fc.dto.facility.FacilityDto;

public interface MapService {
	public List<FacilityDto> getFacilityList();
	public FacilityDto getCurrentFacility(String fcCode);
}
