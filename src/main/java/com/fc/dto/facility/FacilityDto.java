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
	/*
	String rsrcClsCd;
	String rsrcClsNm;
	String rsrcInstCd; 
	String rsrcInstNm; 
	String linkRsrcYn; 
	String usePsblYn; 
	String freeYn; 
	String rsrcIntr; 
	String usePrpse;
	String atpn;
	String lcInf; 
	int area;
	String inqTag; 
	String lossYn;
	int amt1;
	int amt2;
	String updYmd; 
	String bnrImgFileUrlAddr; 
	String delYn;
	String rsrcAprvYn; 
	String rsrcAprvYmd; 
	String sggCd; 
	String dtlUrlAddr; 
	String gdsAtrbCn; 
	String delYmd; 
	String rsvtNdlsYn; 
	String lcInsttCd; 
	String lcInsttNm;
	*/
	
	@Override
	public String toString() {
		return "FacilityDto [rsrcNo=" + rsrcNo + ", rsrcNm=" + rsrcNm + ", zip=" + zip + ", addr=" + addr + ", daddr="
				+ daddr + ", lot=" + lot + ", lat=" + lat + ", instUrlAddr=" + instUrlAddr + ", imeFileUrlAddr="
				+ imgFileUrlAddr + "]";
	}
	
}
