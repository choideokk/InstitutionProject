package com.fc.dto.member;


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

	public MemberDto() {

	}

	public MemberDto(String loginId, String password) {

	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getReportCount() {
		return reportCount;
	}

	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}

	@Override
	public String toString() {
		return "MemberDto [memberNo=" + memberNo + ", loginId=" + loginId + ", password=" + password + ", memberName="
				+ memberName + ", email=" + email + ", phoneNum=" + phoneNum + ", joinDate=" + joinDate + ", userCode="
				+ userCode + ", point=" + point + ", reportCount=" + reportCount + "]";
	}

	
}
