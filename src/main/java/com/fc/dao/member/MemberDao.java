package com.fc.dao.member;


import com.fc.dto.member.MemberDto;

public interface MemberDao {

	
	/** 회원가입*/
	public int signUpUser(MemberDto memberDto);
	/** 로그인*/
	public MemberDto LoginUser(MemberDto memberDto); 
	
	
}
