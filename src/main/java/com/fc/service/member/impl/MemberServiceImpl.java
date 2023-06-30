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
	//마이페이지에서 회원 정보 확인
	@Override
	public MemberDto member_select(String loginId) {
		MemberDto result= memberDao.readMember(loginId);
		return result;
	}
	//로그인 처리
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
	
	
	//아이디 중복 확인
	@Override
	public int member_id_check(String loginId) {
		// TODO Auto-generated method stub
		int result = memberDao.idCheck(loginId);
		return result;
	}
	//마이페이지에서 회원 정보 변경 저장
	@Override
	public void member_update(MemberDto memberdto) {
		// TODO Auto-generated method stub
		memberDao.memberUpdate(memberdto);
	}

	@Override
	public boolean member_delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}


}
