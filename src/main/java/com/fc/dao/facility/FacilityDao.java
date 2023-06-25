package com.fc.dao.facility;

import java.util.List;

import com.fc.dto.facility.FacilityDto;
import com.fc.dto.facility.FcDetailDto;

public interface FacilityDao {
	public List<FacilityDto> selectFacilitiesList();
	public FcDetailDto selectCurrentFacility(String fcCode);
	public void insertFacilitiesInfo(String dataFromApi);
	public void insertFacilitiesDetailInfo(String dataFromApi);
}
