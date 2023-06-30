package com.fc.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fc.dto.board.ReplyDto;
import com.fc.dto.member.MemberDto;
import com.fc.service.board.ReplyService;

@Controller
public class ReplyController {
	private static final Logger log = LogManager.getLogger(BoardController.class);

	@Autowired
	ReplyService replyService;

//	@GetMapping("/reply")
//	public String insertContents() {
//		log.info(" 댓글 작성 페이지 진입");
//
//
//		return "board/reply";	
//
//	}

	@PostMapping("/reply")
	public String insertContents_process(@ModelAttribute ReplyDto replyDto, @RequestParam int postno, HttpSession session, Model model) {
		
		String userId = (String ) session.getAttribute("userId");
		replyDto.setReplywriter(userId);
		replyDto.setPostno(postno);
		int result = replyService.replyInsert(replyDto);
		System.out.println(result);
		
		return "redirect:/detail?postno=" + postno;
	}
	
	
	@RequestMapping("/listreply")
	public String list(int replynumber,Model model) {
		
		List<ReplyDto> list=replyService.list(replynumber);

		model.addAttribute("list",list);
		
		return "board/reply";
	}
	
	
	/*
	 * @RequestMapping("list_json.do") public List<ReplyDto> list_json(int postno){
	 * return replyService.list(postno);
	 * 
	 * }
	 */
	@PostMapping("/replylikes")
	public String likesUp(@RequestParam("postno") int postno , Model model, HttpSession session) {
		Map<String, String> likeInfo = new HashMap<String, String>();
		likeInfo.put("likeUserId", (String)session.getAttribute("loginId"));
		likeInfo.put("likePostNo", Integer.toString(postno));
//		model.addAttribute("viewPage",boardService.getdetail(postno));
		
		int result = replyService.replylike(likeInfo);
		if (result == 0) {
			
			System.err.println("왜 안오지 ");
		} else {
				
		}
		return "redirect:/reply";
	}
	
}
