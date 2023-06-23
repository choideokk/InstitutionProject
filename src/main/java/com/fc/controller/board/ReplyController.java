package com.fc.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fc.dto.board.ReplyDto;
import com.fc.service.board.ReplyService;

@Controller
public class ReplyController {
//
//	@Autowired
//	ReplyService replyService;
//	
//	   @RequestMapping("list.do")
//	    public ModelAndView list(int postno, ModelAndView mav) {
//	        List<ReplyDto> list=replyService.list(postno); //댓글 목록
//	        mav.setViewName("reply_list"); //뷰의 이름
//	        mav.addObject("list", list); //뷰에 전달할 데이터 저장
//	        return mav; //뷰로 이동
//	    }
//	   
//	    @RequestMapping("list_json.do")
//	    public List<ReplyDto> list_json(int postno){
//	        return replyService.list(postno);
//	    }
//	    
//	    @RequestMapping("insert.do") 
//	    public void insert(ReplyDto replydto, HttpSession session) {
//	        
//	
//	        String userid=(String)session.getAttribute("userid");
//	        replydto.setReplyer(userid);
//	        
//	 
//	        replyService.create(replydto);
//	       
//	    }
	   
	   
}
