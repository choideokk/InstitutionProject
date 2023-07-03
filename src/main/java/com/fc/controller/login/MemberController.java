package com.fc.controller.login;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fc.dto.member.MemberDto;
import com.fc.service.member.MemberService;
import com.fc.utils.CommonCode;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	/** 회원가입 */
	@GetMapping("/register")
	public String registerAdmin() {
		return "member/login";
	}

	@PostMapping("/register")
	public String registerAdmin_process(MemberDto memberDto) {
		if (memberDto == null) {
			throw new IllegalArgumentException("memberDto cannot be null");
		}

		memberDto.setUserCode(CommonCode.USER_USER_TYPE_CUSTOMER);

		try {
			int result = memberService.member_id_check(memberDto.getLoginId());
			switch (result) {
			case 0:
				memberService.member_insert(memberDto);
				break;
			case 1:
				return "member/iogin";
			default:
				throw new RuntimeException("Unexpected result from member_id_check: " + result);
			}
		} catch (Exception e) {
			// Consider logging the exception here, so that you can see what went wrong
			throw new RuntimeException(e);
		}
		return "redirect:/login";
	}

	// 로그인
	@GetMapping("/login")
	public String login(HttpSession session, Model model) {
		String id = (String) session.getAttribute("loginId");

		// 서비스안의 회원정보보기 메서드 호출
		MemberDto memberDto = memberService.member_select(id);

		// 정보저장 후 페이지 이동
		model.addAttribute("memberDto", memberDto);

		return "member/login";
	}

	@PostMapping("/login")
	public ModelAndView login_check(@ModelAttribute MemberDto memberDto, HttpSession session) {
		MemberDto name = memberService.member_login(memberDto, session);
		ModelAndView mav = new ModelAndView();
		if (name != null) { // 로그인 성공 시
			mav.setViewName("redirect:/mypage"); // 뷰의 경로
			session.getAttribute("loginId");
			session.getAttribute("memberName");
			mav.addObject("message", "success");
		} else { // 로그인 실패 시
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	// 로그아웃 요청
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/login";
	}

	// 아이디 중복확인 요청
	@ResponseBody
	@PostMapping("/id_check")
	public int id_check(@RequestParam("loginId") String loginId, Model model) {
		System.out.println(loginId);
		int result = memberService.member_id_check(loginId);

		return result;
	}

	// 화원정보 불러오기
	@GetMapping("/mypage")
	public String memberInfo(HttpSession session, Model model) {
		// 세션 객체 안에 있는 ID정보 저장
		String id = (String) session.getAttribute("loginId");

		// 서비스안의 회원정보보기 메서드 호출
		MemberDto memberDto = memberService.member_select(id);

		// 정보저장 후 페이지 이동
		model.addAttribute("memberDto", memberDto);

		
		return "member/myInfo";

	}

	// 회원정보 업데이트
	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberDto memberDto, HttpSession session) {
		memberService.member_update(memberDto);
		session.invalidate();
		return "redirect:/login";

	}

}
