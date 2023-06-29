package com.fc.dao.member;


import com.fc.dto.member.MemberDto;

public interface MemberDao {

	
	/** 회원가입*/
	public int signUpUser(MemberDto memberDto);
	/** 로그인*/
	public MemberDto LoginUser(MemberDto memberDto); 
	
	/**아이디 중복 체크*/
	public int idCheck(String id);
	
	/**회원정보 수정 */
	public MemberDto memberUpdate(MemberDto memberDto);
	
	
}
