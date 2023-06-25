
package com.fc.controller.board;

import java.sql.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fc.dto.board.BoardDto;
import com.fc.service.board.BoardService;

@Controller
public class BoardController {

	private static final Logger log = LogManager.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;

	
	@RequestMapping("/test")
	public String index() {

		return "test";
	}

	@RequestMapping("/testboard")
	public String index2() {

		return "testboard";
	}

	
	
	
	@GetMapping("/write")
	public String insertContents() {
	
		
		log.info(" 글쓰기 페이지 진입했음");

		return "write";	

	}

	@PostMapping("/write")
	public String insertContents_process(@ModelAttribute BoardDto boardDto) {
		System.out.println(boardDto);
		int result = boardService.boardInsert(boardDto);
		System.out.println(result);
		return "redirect:/boardlist";
	}

	
	
	@GetMapping("/boardlist")
	public String boardList(Model model, @RequestParam(name = "postNo", required = false)String postNo) {

		//Integer 받는 경우 : 숫자형이 아닌경우에 바로 오류
		
		//String 받는 경우 : 일단 받고, 숫자형 체크 -> 이후 분기 처리 조절
		//String pt;
		
		if (postNo == null) {
			List<BoardDto> boardList = boardService.getBoardList();
			model.addAttribute("boardList", boardList);
		} else {
	        int postNoInt = Integer.parseInt(postNo);
	        
			BoardDto boardDto = new BoardDto();
			boardDto.setPostno(postNoInt);
			List<BoardDto> boardList = boardService.getBoardListbyBoardNumber(boardDto);
			model.addAttribute("boardList", boardList);
	
		}
		return "boardlist";
	}
	
	
	//게시판 상세보기 페이지
	@GetMapping("/detail")
	public String getdetail(@RequestParam int postno , Model model) {
		
		
		BoardDto dto =boardService.getdetail(postno);
			model.addAttribute("viewPage",dto);
		
		return "viewPage";
		
		
	}
	
	@GetMapping("/update")
	public String updateView(BoardDto boardDto, Model model) {
		model.addAttribute("viewPage", boardDto);
		return "updateView";
	}
	
	@PostMapping("/update")
	public String update2(@ModelAttribute BoardDto boardDto, Model model) {
		BoardDto dto =boardService.getdetail(boardDto.getPostno());
		model.addAttribute("viewPage", dto);
		boardService.boardUpdate(boardDto);
		return "updateView";
	}
	
	@PostMapping("/updateView")
	 public String update(BoardDto boardDto) {
		System.out.println("여기로!!");
        log.info("게시물 수정 컨트롤러 시작");
        boardService.boardUpdate(boardDto);
        System.out.println("보드값 확인 " + boardDto.getTitle());
        System.out.println("보드값 확인 " + boardDto.getContent());
        return "redirect:/boardlist";
    }
	//게시물 삭제
	
	@GetMapping("delete")
	public String delete(@RequestParam int postno,Model model) {
	
		boardService.boardDelte(postno);
		model.addAttribute("viewPage",postno);

		System.out.println("삭제 삭제 ");		
		return "redirect:/boardlist";
		
	}

	
	
//	@PostMapping("/detail")
//	public String detailProject(@ModelAttribute("boardDto") BoardDto boardDto, Model model,int postno) {
//
//		// 조회수 증가 하는 중
//		boardService.viewCount(boardDto.getViewcnt());
//		BoardDto dto = boardService.getdetail(postno);
//	    model.addAttribute("viewCnt", postno);	    
//	    
//		return "boardlist";
//		
//	}

//		@RequestMapping(value="/updateView",method=RequestMethod.POST)
//		public String board_update(@ModelAttribute("boardboard")BoardDto boardDto) {
//				
//				try {
//					boardService.updateBoard(boardDto);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//				return "redirect:boardlist";
//			}
//			
//		
//		@RequestMapping(value="/updateView",method=RequestMethod.POST)
//		public String board_delete(@PathVariable("seq")int seq)
//		{
//			try {
//				boardService.deleteBoard(seq);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			return "redierct:boardlist";
//		}
//		
//		
//		}
	


	
	
			//1번 안됨 
	 /* @GetMapping("/updateView/{postno}")
	    public String updateView(@PathVariable int postno, Model model) {
	        log.info("게시물 수정 시작");
	        BoardDto dto = boardService.getdetail(postno);
	        model.addAttribute("update", dto);
	        return "updateView";
	    }
	  */

	/*
	    @PostMapping("/update")
	    public String update(BoardDto boardDto) {
	        log.info("게시물 수정 컨트롤러 시작");
	        //boardService.boardUpdate(boardDto);
	        System.out.println("보드값 확인 " + boardDto.getTitle());
	        System.out.println("보드값 확인 " + boardDto.getContent());
	        return "redirect:/boardlist";
	    }
	*/
}	
	
	
	//2번안됨 
	
//	@GetMapping("/update")
//	public String getUpdate(@RequestParam Integer postno, Model model) throws Exception {
//	    BoardDto data = boardService.getdetail(postno);
//	    model.addAttribute("data", data);
//	    return "updateView";
//	}
//
//	@PostMapping("/update")
//	public String postUpdate(@ModelAttribute BoardDto boardDto) throws Exception {
//	    boardService.update(boardDto);
//	    return "redirect:/boardlist";
//	}
	
//
//	
//	@GetMapping("/searchBoard")
//	public String searchBoardReservationMap(Model model, @RequestParam Map<String,String> map) {
//		// @RequestParam(name="searchKeyword", required = false) String searchKeyword) {
//		// //1번 방식
//		List<BoardDto> boardList = boardService.findBoardListBySearchKeywordMap(map);
//		model.addAttribute("boardList", boardList);
//
//		return "boardlist";
//	}
//
//	
//	@GetMapping("/searchBoard2")
//	public String searchBoardReservationMap2(Model model, @RequestParam Map<String, String> map) {
//
//
//		List<BoardDto> boardList = boardService.findBoardListBySearchKeywordMap2(map);
//		model.addAttribute("boardList", boardList);
//
//		log.debug("boardList end");
//
//		return "boardlist";
//	}



	
	

