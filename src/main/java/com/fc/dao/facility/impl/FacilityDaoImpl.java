package com.fc.dao.facility.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.facility.FacilityDao;
import com.fc.dto.facility.FacilityDto;

@Repository
public class FacilityDaoImpl implements FacilityDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<FacilityDto> selectFacilitiesList() {
		// TODO Auto-generated method stub
		List<FacilityDto> facilityList = sqlSessionTemplate.selectList("map_mapper.select_facility_list");

		return facilityList;
	}

	@Override
	public FacilityDto selectCurrentFacility(String fcCode) {
		// TODO Auto-generated method stub
		FacilityDto currentFc = sqlSessionTemplate.selectOne("map_mapper.select_facility", fcCode);

		return currentFc;
	}

}
