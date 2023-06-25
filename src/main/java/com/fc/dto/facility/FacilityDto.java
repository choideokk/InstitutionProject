package com.fc.dto.facility;

import lombok.Data;

@Data
public class FacilityDto {
	String rsrcNo;
	String rsrcNm;
	String zip;
	String addr;
	String daddr;
	String lot;
	String lat;
	String instUrlAddr;
	String imgFileUrlAddr;
	
	@Override
	public String toString() {
		return "FacilityDto [rsrcNo=" + rsrcNo + ", rsrcNm=" + rsrcNm + ", zip=" + zip + ", addr=" + addr + ", daddr="
				+ daddr + ", lot=" + lot + ", lat=" + lat + ", instUrlAddr=" + instUrlAddr + ", imeFileUrlAddr="
				+ imgFileUrlAddr + "]";
	}
	
}
