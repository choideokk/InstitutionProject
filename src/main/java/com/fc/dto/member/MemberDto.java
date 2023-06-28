package com.fc.dto.member;

import lombok.Data;

@Data
public class MemberDto {

	int memberNo;// 고객 부여번호 
	String loginId;// 로그인 아이디	
	String password;// 로그인 비밀번호 
	String memberName;// 이름
	String email;// 이메일 
	String phoneNum;// 전화번호 
	String joinDate;// 가입날짜
	String userCode;// 로그인 유형(고객,관리자)
	int point; //보유 포인트 
	/** 신고 당한횟수 */
	int reportCount;

	
	
	@Override
	public String toString() {
		return "MemberDto [memberNo=" + memberNo + ", loginId=" + loginId + ", password=" + password + ", memberName="
				+ memberName + ", email=" + email + ", phoneNum=" + phoneNum + ", joinDate=" + joinDate + ", userCode="
				+ userCode + ", point=" + point + ", reportCount=" + reportCount + "]";
	}

	
}
