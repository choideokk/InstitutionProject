package com.fc.dao.member.impl;


import org.apache.ibatis.jdbc.SQL;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.member.MemberDao;
import com.fc.dto.member.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao{

	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	

	/** 회원가입*/
	@Override
	public int signUpUser(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		int result = 0;
		result = sqlSessionTemplate.insert("member_mapper.signup", memberDto);
		
		
		return result;
		
	}
	
	
	
	
	/**로그인 */ 
	@Override
	public MemberDto LoginUser(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		MemberDto result = sqlSessionTemplate.selectOne("member_mapper.login", memberDto);
		
		return result;
	}




	@Override
	public int idCheck(String loginId) {
		// TODO Auto-generated method stub
		int result= sqlSessionTemplate.selectOne("member_mapper.id_check", loginId);
	
		return result; // 아이디중복
	}

	
	


}
