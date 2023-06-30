package com.fc.dao.facility;

import java.util.List;

import com.fc.dto.facility.FacilityDto;
import com.fc.dto.facility.FcDetailDto;
import com.fc.dto.facility.SearchDto;

public interface FacilityDao {
	public List<FacilityDto> selectFacilitiesList();
	public List<FacilityDto> selectSearchedFacilitiesList(SearchDto searchDto);
	public FcDetailDto selectCurrentFacility(String fcCode);
	public void insertFacilitiesInfo(String dataFromApi);
	public void insertFacilitiesDetailInfo(String dataFromApi);
}
