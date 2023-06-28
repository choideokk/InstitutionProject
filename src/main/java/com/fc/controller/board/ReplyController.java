package com.fc.controller.board;



import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fc.dto.board.ReplyDto;
import com.fc.service.board.ReplyService;


@Controller
public class ReplyController {

	@Autowired
	ReplyService replyService;

	
	


	@GetMapping("/comments")
	public String insertContents() {
	
		System.out.println("댓글쓰기 페이지");
		return "comments";	

	}

	@PostMapping("/comments")
	public String insertContents_process(@ModelAttribute ReplyDto replyDto ) {
		System.out.println(replyDto);
		System.out.println("왜 안넘어오지?");
		int result = replyService.replyInsert(replyDto);
		System.out.println(result);
		return "comments";
	}
	
	
	
	@RequestMapping("/comments")
	public String commentList(Model model, @RequestParam(name = "replyno", required = false)String replyno) {

		//Integer 받는 경우 : 숫자형이 아닌경우에 바로 오류
		
		//String 받는 경우 : 일단 받고, 숫자형 체크 -> 이후 분기 처리 조절
		//String pt;
		
		if (replyno == null) {
			List<ReplyDto> replyList = replyService.getCommentList();
			model.addAttribute("replyList", replyList);
		} else {
	        int reply = Integer.parseInt(replyno);
	        
	        System.out.println(replyno);
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyno(reply);
			List<ReplyDto> replyList = replyService.getCommentListbyNumber(replyDto);
			model.addAttribute("replyList", replyList);
	
		}
		return "redirect:/viewPage";
	}
	
}


