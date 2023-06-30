
package com.fc.controller.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fc.dto.board.ArticlePage;
import com.fc.dto.board.BoardDto;
import com.fc.dto.facility.SearchDto;
import com.fc.service.board.BoardService;

@Controller
public class BoardController {

	private static final Logger log = LogManager.getLogger(BoardController.class);

	@Autowired
	BoardService boardService;

	// 게시글 작성
	@GetMapping("/write")
	public String insertContents() {
		return "board/write";	
	}

	@PostMapping("/write")
	public String insertContents_process(@ModelAttribute BoardDto boardDto) {
		int result = boardService.boardInsert(boardDto);
		return "redirect:/boardlist?pageNo=1";
	}

	// 전체 글 목록
	@GetMapping("/boardlist")
	public String boardList(Model model, @RequestParam int pageNo, @ModelAttribute SearchDto searchObj) {
	// public String boardList(Model model, @RequestParam(name = "postNo", required = false) String postNo, @ModelAttribute SearchDto searchObj) {

		List<BoardDto> boardList;
		
		boardList = boardService.getBoardList();
		
		int totalPage = boardService.getTotalPage();
		ArticlePage currentPageInfo = new ArticlePage(totalPage, (int)pageNo, 7, 5, boardList);
		
		model.addAttribute("currentPageInfo", currentPageInfo);
		model.addAttribute("totalPage", totalPage);
		
		
		return "board/boardlist";
	}
	
	// 게시글 검색 (수정중..)
	@PostMapping("/searchBoard")
	public String getSearchedList(SearchDto searchDto, @RequestParam int pageNo, Model model) {
		// checkbox 체크되면 on, 아니면 null값으로 들어옴
		List<BoardDto> searchedList = boardService.findBoardListBySearchDto(searchDto);
		int totalPage = boardService.getSearchedTotalPage();
		
		ArticlePage currentPageInfo = new ArticlePage(totalPage, (int)pageNo, 7, 5, searchedList);
		
		model.addAttribute("currentPageInfo", currentPageInfo);
		model.addAttribute("searchObj", searchDto);
		return "board/boardlist";
	}
	
	
	//게시판 상세보기 페이지
	@GetMapping("/detail")
	public String getdetail(@RequestParam("postno") int postno , Model model) {
		
		BoardDto dto = boardService.getdetail(postno);
		model.addAttribute("viewPage",boardService.getdetail(postno));
		
		boardService.viewCount(postno);
		
		return "board/viewPage";
	}
	
	// 신고 or 추천
	// 기존에 신고한적이 있는지 결과값을 리턴받아서 ajax로 전달..
	@ResponseBody
	@PostMapping("/action_proc")
	public int like_proc(@RequestParam("postno") int postno, @RequestParam("type") String type, HttpSession session) {
		Map<String, String> commonInfo = new HashMap<String, String>();
		commonInfo.put("sendUserId", (String)session.getAttribute("loginId"));
		commonInfo.put("type", type);
		commonInfo.put("targetPostNo", Integer.toString(postno));
		int result = boardService.controlBoardInfo(commonInfo);
		return result;
	}
	
	
	// 게시글 수정
	@GetMapping("/update")
	public String updateView(BoardDto boardDto, Model model) {
		model.addAttribute("viewPage", boardDto);
		return "board/updateView";
	}
	
	@PostMapping("/update")
	public String update2(@ModelAttribute BoardDto boardDto, Model model) {
		BoardDto dto =boardService.getdetail(boardDto.getPostno());
		model.addAttribute("viewPage", dto);
		boardService.boardUpdate(boardDto);
		return "board/updateView";
	}
	
	@PostMapping("/updateView")
	 public String update(BoardDto boardDto) {
		int postno = boardDto.getPostno();
		System.out.println("여기로!!");
        log.info("게시물 수정 컨트롤러 시작");
        boardService.boardUpdate(boardDto);
        System.out.println("보드값 확인 " + boardDto.getTitle());
        System.out.println("보드값 확인 " + boardDto.getContent());
        return "redirect:/detail?postno=" + postno;
    }
	
	//게시물 삭제
	@GetMapping("delete")
	public String delete(@RequestParam int postno, Model model) {
	
		boardService.boardDelte(postno);
		//model.addAttribute("deleteviewPage",postno);

		System.out.println("삭제 삭제 ");		
		return "redirect:/boardlist?pageNo=1";
		
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



	
	

