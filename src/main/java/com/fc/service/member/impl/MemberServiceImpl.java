package com.fc.service.member.impl;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fc.dao.member.MemberDao;
import com.fc.dto.member.MemberDto;
import com.fc.service.member.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;

	@Override
	public boolean member_insert(MemberDto memberdto) {
		// TODO Auto-generated method stub
		// insert 성공하면 1 아니면 0 리턴
		int result = memberDao.signUpUser(memberdto);
		
		if (result == 1) { // 회원가입 성공 시
			return true;
		}
		return false; // 회원가입 실패 시
	}

	@Override
	public MemberDto member_select(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto member_login(MemberDto memberDto, HttpSession session) {
		// TODO Auto-generated method stub
		MemberDto result = memberDao.LoginUser(memberDto);
		if(result!= null) {
			session.setAttribute("loginId",result.getLoginId());
			session.setAttribute("memberName",result.getMemberName());
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.removeAttribute("loginId"); // 세션 초기화
		
		
	}
	
	@Override
	public boolean member_id_check(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean member_update(MemberDto memberdto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}


}
