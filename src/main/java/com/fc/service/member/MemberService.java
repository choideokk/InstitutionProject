package com.fc.service.member;
import javax.servlet.http.HttpSession;
import com.fc.dto.member.MemberDto;

public interface MemberService {
	
	//회원가입시 회원 정보 저장
	boolean member_insert(MemberDto memberdto);
	
	//마이페이지에서 회원 정보 확인
	MemberDto member_select(String id);
	
	//로그인 처리
	MemberDto member_login(MemberDto memberDto, HttpSession session);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//아이디 중복 확인
	int member_id_check(String loginId);
	
	//마이페이지에서 회원 정보 변경 저장
	boolean member_update(MemberDto memberdto);

	//회원 정보 탈퇴
	boolean member_delete(String id);

	


}
