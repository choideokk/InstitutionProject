package com.fc.service.map;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.List;

import com.fc.dto.facility.FacilityDto;
import com.fc.dto.facility.FcDetailDto;

public interface MapService {
	public List<FacilityDto> getFacilityList();
	public FcDetailDto getCurrentFacility(String fcCode);
	public void getFacilityListFromApi() throws IOException ;
	public void getFacilityDetailFromApi() throws IOException ;
}
