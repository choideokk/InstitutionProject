package com.fc.service.map.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dao.facility.FacilityDao;
import com.fc.dto.facility.FacilityDto;
import com.fc.service.map.MapService;

@Service
public class MapServiceImpl implements MapService {

	@Autowired
	FacilityDao facilityDao;
	
	@Override
	public List<FacilityDto> getFacilityList() {
		// TODO Auto-generated method stub
		List<FacilityDto> fcList = facilityDao.selectFacilitiesList();
		return fcList;
	}

	@Override
	public FacilityDto getCurrentFacility(String fcCode) {
		// TODO Auto-generated method stub
		FacilityDto currentFc = facilityDao.selectCurrentFacility(fcCode);
		return currentFc;
	}

}
