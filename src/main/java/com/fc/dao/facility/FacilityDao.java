package com.fc.dao.facility;

import java.util.List;

import com.fc.dto.facility.FacilityDto;

public interface FacilityDao {
	public List<FacilityDto> selectFacilitiesList();
	public FacilityDto selectCurrentFacility(String fcCode);
}
