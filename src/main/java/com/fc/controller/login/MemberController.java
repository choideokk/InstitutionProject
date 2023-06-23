package com.fc.controller.login;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		boolean isSuccessed = memberService.member_insert(memberDto);
		
		if (isSuccessed == true) {
			return "test";
		}
		return "register";
	}

	
	/**로그인*/ 
	
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
		   System.out.println((String)session.getAttribute("loginId"));
		   System.out.println((String)session.getAttribute("memberName"));
		   
		   } else { // 로그인 실패 시
		     mav.setViewName("login"); 		
		     mav.addObject("message", "error");
		     }
		     return mav;
		   }
	
	
	//로그아웃 요청
	@PostMapping("/logout")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
	memberService.logout(session); 
	 mav.setViewName("redirect:/test"); 
	 mav.addObject("message", "logout"); 
	  return mav;
	  }
	
	
	
	
	
}
	
	
	
	


