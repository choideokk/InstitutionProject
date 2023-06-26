package com.fc.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
		return "register";
	}
	
	@PostMapping("/register")
	public String registerAdmin_process(MemberDto memberDto) {
		memberDto.setUserCode(CommonCode.USER_USER_TYPE_CUSTOMER);
		// 회원가입 성공했는지 여부
	    int result= memberService.member_id_check(memberDto.getLoginId());
	    try {
			if(result == 0 ) {
				memberService.member_insert(memberDto);
			}else if(result == 1) {
				return "register";
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/test";
	}
	    

	/** 로그인 */

	@GetMapping("/test")
	public String login(HttpSession session) {
		String test = (String) session.getAttribute("loginId");
		System.out.println(test);
		return "login";
	}

	@PostMapping("/test")
	public ModelAndView login_check(@ModelAttribute MemberDto memberDto, HttpSession session) {
		MemberDto name = memberService.member_login(memberDto, session);
		ModelAndView mav = new ModelAndView();
		if (name != null) { // 로그인 성공 시
			mav.setViewName("logout"); // 뷰의 이름
			session.getAttribute("loginId");
			session.getAttribute("memberName");
			System.out.println((String) session.getAttribute("loginId"));
			System.out.println((String) session.getAttribute("memberName"));

		} else { // 로그인 실패 시
			mav.setViewName("login");
			mav.addObject("message", "error");
		}
		return mav;
	}

	// 로그아웃 요청
	@PostMapping("/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		mav.setViewName("redirect:/test");
		mav.addObject("message", "logout");
		return mav;
	}

	// 아이디 중복확인 요청
	@ResponseBody
	@PostMapping("/id_check")
	public int id_check(@RequestParam("loginId") String loginId, Model model) {
		System.out.println(loginId);
		int result = memberService.member_id_check(loginId);

		return result;

	}



}
